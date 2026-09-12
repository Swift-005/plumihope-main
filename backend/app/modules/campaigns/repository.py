import uuid

from sqlalchemy.orm import Session

from app.modules.campaigns.models import Campaign, CampaignEvidence


def create_campaign(db: Session, agent_profile_id: uuid.UUID, data: dict) -> Campaign:
    campaign = Campaign(agent_profile_id=agent_profile_id, status="DRAFT", **data)
    db.add(campaign)
    db.commit()
    db.refresh(campaign)
    return campaign


def get_by_id(db: Session, campaign_id: uuid.UUID) -> Campaign | None:
    return db.query(Campaign).filter(Campaign.id == campaign_id).first()


def get_by_help_request(db: Session, help_request_id: uuid.UUID) -> Campaign | None:
    return db.query(Campaign).filter(Campaign.help_request_id == help_request_id).first()


def list_campaigns(db: Session, status: str | None = None) -> list[Campaign]:
    query = db.query(Campaign)
    if status:
        query = query.filter(Campaign.status == status)
    return query.order_by(Campaign.created_at.desc()).all()


def update_fields(db: Session, campaign: Campaign, updates: dict) -> Campaign:
    for key, value in updates.items():
        setattr(campaign, key, value)
    db.commit()
    db.refresh(campaign)
    return campaign


def update_status(db: Session, campaign: Campaign, new_status: str) -> Campaign:
    campaign.status = new_status
    db.commit()
    db.refresh(campaign)
    return campaign


def count_evidence(db: Session, campaign_id: uuid.UUID) -> int:
    return db.query(CampaignEvidence).filter(CampaignEvidence.campaign_id == campaign_id).count()


def add_evidence(db: Session, campaign_id: uuid.UUID, uploader_id: uuid.UUID, data: dict) -> CampaignEvidence:
    evidence = CampaignEvidence(
        campaign_id=campaign_id,
        uploader_id=uploader_id,
        verification_status="UPLOADED",
        **data,
    )
    db.add(evidence)
    db.commit()
    db.refresh(evidence)
    return evidence


def list_evidence(db: Session, campaign_id: uuid.UUID) -> list[CampaignEvidence]:
    return db.query(CampaignEvidence).filter(CampaignEvidence.campaign_id == campaign_id).all()
