from fastapi import APIRouter

from app.modules.auth.router import router as auth_router
from app.modules.users.router import router as users_router
from app.modules.help_requests.router import router as help_requests_router
from app.modules.agents.router import router as agents_router

api_router = APIRouter(prefix="/api/v1")

api_router.include_router(auth_router)
api_router.include_router(users_router)
api_router.include_router(help_requests_router)
api_router.include_router(agents_router)
