import uuid

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from app.core.config import settings
from app.modules.payments import repository
from app.modules.payments.models import Payment
from app.modules.payments.providers import get_payment_provider
from app.modules.donations import repository as donations_repository
from app.modules.donations.state_machine import validate_transition as validate_donation_transition


def initiate_payment(db: Session, donation_id: uuid.UUID, user_id: uuid.UUID) -> dict:
    donation = donations_repository.get_by_id(db, donation_id)
    if not donation:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Donation not found")

    if donation.user_id != user_id:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="You do not own this donation")

    existing_payment = repository.get_by_donation_id(db, donation_id)
    if existing_payment:
        raise HTTPException(status_code=status.HTTP_409_CONFLICT, detail="Payment already initiated for this donation")

    validate_donation_transition(donation.status, "PENDING")

    provider = get_payment_provider()
    result = provider.initiate_payment(str(donation.id), donation.amount, donation.currency)

    payment = repository.create_payment(
        db, donation_id, settings.payment_provider, result["provider_reference"], donation.amount
    )

    donations_repository.update_status(db, donation, "PENDING")

    return {
        "payment_id": payment.id,
        "provider": payment.provider,
        "provider_reference": payment.provider_reference,
        "redirect_url": result["redirect_url"],
        "status": payment.status,
    }
