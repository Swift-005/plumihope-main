import uuid

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from app.modules.help_requests import repository
from app.modules.help_requests.models import HelpRequest
from app.modules.help_requests.schemas import HelpRequestCreate
from app.modules.help_requests.state_machine import validate_transition
from app.modules.agents.models import AgentProfile


def create_help_request(db: Session, user_id: uuid.UUID, payload: HelpRequestCreate) -> HelpRequest:
    help_request = repository.create_help_request(db, user_id, payload.model_dump())
    repository.create_event(db, help_request.id, user_id, "SUBMITTED")
    return help_request


def list_help_requests(db: Session, status: str | None = None) -> list[HelpRequest]:
    return repository.list_help_requests(db, status)


def get_help_request_or_404(db: Session, help_request_id: uuid.UUID) -> HelpRequest:
    help_request = repository.get_help_request(db, help_request_id)
    if not help_request:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Help request not found")
    return help_request


def claim_help_request(db: Session, help_request_id: uuid.UUID, current_user_id: uuid.UUID) -> HelpRequest:
    help_request = get_help_request_or_404(db, help_request_id)

    agent_profile = db.query(AgentProfile).filter(AgentProfile.user_id == current_user_id).first()
    if not agent_profile or agent_profile.status != "VERIFIED":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Requires verified Agent status")

    validate_transition(help_request.status, "CLAIMED")

    existing_claim = repository.get_active_claim(db, help_request_id)
    if existing_claim:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Help request already claimed")

    repository.create_claim(db, help_request_id, agent_profile.id)
    repository.update_status(db, help_request, "CLAIMED")
    repository.create_event(db, help_request_id, current_user_id, "CLAIMED")

    return help_request
