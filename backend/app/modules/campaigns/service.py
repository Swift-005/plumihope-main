import uuid

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from app.modules.campaigns import repository
from app.modules.campaigns.models import Campaign
from app.modules.campaigns.schemas import CampaignCreate, CampaignUpdateRequest
from app.modules.campaigns.state_machine import validate_transition
from app.modules.agents.models import AgentProfile
from app.modules.help_requests import repository as help_requests_repository
from app.modules.help_requests import service as help_requests_service


def _get_agent_profile_or_403(db: Session, user_id: uuid.UUID) -> AgentProfile:
    profile = db.query(AgentProfile).filter(AgentProfile.user_id == user_id).first()
    if not profile or profile.status != "VERIFIED":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Requires verified Agent status")
    return profile


def create_campaign(db: Session, user_id: uuid.UUID, payload: CampaignCreate) -> Campaign:
    agent_profile = _get_agent_profile_or_403(db, user_id)

    help_request = help_requests_service.get_help_request_or_404(db, payload.help_request_id)
    if help_request.status != "ELIGIBLE":
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="Help request must be ELIGIBLE before a campaign can be created",
        )

    existing_campaign = repository.get_by_help_request(db, payload.help_request_id)
    if existing_campaign:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="A campaign already exists for this help request",
        )

    data = payload.model_dump()
    campaign = repository.create_campaign(db, agent_profile.id, data)

    help_requests_repository.update_status(db, help_request, "CONVERTED_TO_CAMPAIGN")

    return campaign


def list_campaigns(db: Session, status: str | None = None) -> list[Campaign]:
    return repository.list_campaigns(db, status)


def get_campaign_or_404(db: Session, campaign_id: uuid.UUID) -> Campaign:
    campaign = repository.get_by_id(db, campaign_id)
    if not campaign:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Campaign not found")
    return campaign


def _require_owner(db: Session, campaign: Campaign, user_id: uuid.UUID) -> None:
    agent_profile = db.query(AgentProfile).filter(AgentProfile.user_id == user_id).first()
    if not agent_profile or campaign.agent_profile_id != agent_profile.id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="You do not own this campaign")


def update_campaign(db: Session, campaign_id: uuid.UUID, user_id: uuid.UUID, payload: CampaignUpdateRequest) -> Campaign:
    campaign = get_campaign_or_404(db, campaign_id)
    _require_owner(db, campaign, user_id)

    if campaign.status != "DRAFT":
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Only DRAFT campaigns can be freely edited")

    updates = payload.model_dump(exclude_unset=True, exclude_none=True)
    if not updates:
        return campaign
    return repository.update_fields(db, campaign, updates)


def submit_campaign(db: Session, campaign_id: uuid.UUID, user_id: uuid.UUID) -> Campaign:
    campaign = get_campaign_or_404(db, campaign_id)
    _require_owner(db, campaign, user_id)

    validate_transition(campaign.status, "SUBMITTED")

    evidence_count = repository.count_evidence(db, campaign_id)
    if evidence_count == 0:
        raise HTTPException(
            status_code=status.HTTP_409_CONFLICT,
            detail="At least one evidence item is required before submission",
        )

    return repository.update_status(db, campaign, "SUBMITTED")
