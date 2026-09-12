import uuid

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from app.core.database import get_db
from app.modules.auth.dependencies import get_current_user
from app.modules.campaigns import service
from app.modules.campaigns.schemas import CampaignCreate, CampaignUpdateRequest, CampaignPublic, CampaignDetail
from app.modules.users.models import User

router = APIRouter(prefix="/campaigns", tags=["campaigns"])


@router.post("", response_model=CampaignDetail, status_code=201)
def create_campaign(
    payload: CampaignCreate,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    return service.create_campaign(db, current_user.id, payload)


@router.get("", response_model=list[CampaignPublic])
def list_campaigns(
    status: str | None = Query(default=None),
    db: Session = Depends(get_db),
):
    return service.list_campaigns(db, status)


@router.get("/{campaign_id}", response_model=CampaignDetail)
def get_campaign(campaign_id: uuid.UUID, db: Session = Depends(get_db)):
    return service.get_campaign_or_404(db, campaign_id)


@router.patch("/{campaign_id}", response_model=CampaignDetail)
def update_campaign(
    campaign_id: uuid.UUID,
    payload: CampaignUpdateRequest,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    return service.update_campaign(db, campaign_id, current_user.id, payload)


@router.post("/{campaign_id}/submit", response_model=CampaignDetail)
def submit_campaign(
    campaign_id: uuid.UUID,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db),
):
    return service.submit_campaign(db, campaign_id, current_user.id)
