import uuid

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.modules.auth.dependencies import get_current_user
from app.modules.help_requests import service
from app.modules.help_requests.schemas import HelpRequestCreate, HelpRequestPublic, HelpRequestDetail
from app.modules.users.models import User

router = APIRouter(prefix="/help-requests", tags=["help-requests"])


@router.post("", response_model=HelpRequestDetail, status_code=201)
def create_help_request(
    payload: HelpRequestCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    return service.create_help_request(db, current_user.id, payload)


@router.get("", response_model=list[HelpRequestPublic])
def list_help_requests(
    status: str | None = Query(default=None),
    db: Session = Depends(get_db),
):
    return service.list_help_requests(db, status)


@router.get("/{help_request_id}", response_model=HelpRequestDetail)
def get_help_request(help_request_id: uuid.UUID, db: Session = Depends(get_db)):
    return service.get_help_request_or_404(db, help_request_id)


@router.post("/{help_request_id}/claim", response_model=HelpRequestDetail)
def claim_help_request(
    help_request_id: uuid.UUID,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    return service.claim_help_request(db, help_request_id, current_user.id)
