# PLUMIHOPE

COMPLETE MASTER PROJECT BLUEPRINT
AI CODING + ARCHITECTURE + DATABASE + API + WEB + iOS

* TESTING + DEVOPS + INSTALLATION + FOLDER STRUCTURE
  ============================================================

DOCUMENT VERSION: 1.0
STATUS: MASTER IMPLEMENTATION BLUEPRINT
PURPOSE:
This document is the SINGLE SOURCE OF TRUTH for implementing the
PlumiHope platform.

A coding agent such as Claude Code, Cursor, Codex, Copilot, or another
AI coding agent must be able to implement the complete project from
this document without requiring the original SRS, SAD, ERD, State
Machine, Role Permission Matrix, or Test Strategy documents.

If an implementation detail is not explicitly specified here, choose
the simplest production-quality implementation that does not violate
the architecture, security model, state machines, permissions,
database rules, or trust principles defined below.

============================================================
0. MASTER INSTRUCTION TO THE CODING AGENT
=========================================

You are the principal software architect and senior full-stack
engineer responsible for implementing PLUMIHOPE.

PLUMIHOPE is a trusted humanitarian donation and assistance platform.

The platform connects:

USER
->
HELP REQUEST
->
VERIFIED AGENT INVESTIGATION
->
EVIDENCE
->
CAMPAIGN
->
MODERATOR REVIEW
->
APPROVAL
->
PUBLIC DONATION
->
PAYMENT VERIFICATION
->
FUNDING
->
PAYOUT
->
ASSISTANCE DELIVERY
->
PROOF / UPDATE
->
FINAL MODERATOR REVIEW
->
SUCCESSFUL

The system must prioritize:

1. Trust
2. Security
3. Accountability
4. Evidence
5. Server-side authority
6. Explicit lifecycle states
7. Auditability
8. Financial correctness
9. Privacy
10. Maintainability

DO NOT build a simple CRUD donation website.

Build a complete workflow-driven humanitarian platform.

============================================================

1. PRODUCT DEFINITION
   ============================================================

Product name:

PLUMIHOPE

Product type:

Trusted Humanitarian Donation & Assistance Platform

Primary platforms:

1. iOS application
2. Public Web
3. Agent Portal
4. Moderator Dashboard
5. Admin Dashboard
6. Backend REST API
7. PostgreSQL database
8. S3-compatible object storage

Primary backend:

Python
FastAPI
SQLAlchemy
Alembic
PostgreSQL

iOS:

Swift
SwiftUI
MVVM
Dependency Injection
async/await
URLSession
SwiftData
Keychain

Web:

TypeScript
Next.js
React
Tailwind CSS

Infrastructure:

Docker
Docker Compose
Git
GitHub
GitHub Actions

Future / optional:

Redis
Background workers
S3-compatible storage
APNs
Email/SMS provider
OpenTelemetry
Prometheus
Grafana
Sentry
Kafka/RabbitMQ
OpenSearch/Elasticsearch

DO NOT introduce microservices initially.

Start with a modular monolith.

============================================================
2. CORE PRODUCT PRINCIPLE
=========================

The fundamental question PlumiHope must answer is:

"Can a donor confidently support a real case and later understand
what happened to the money and assistance?"

Therefore:

VERIFICATION > CLAIMS

EVIDENCE > BADGES

SERVER > CLIENT

AUDIT TRAIL > MEMORY

EXPLICIT STATES > BOOLEAN FLAGS

FINANCIAL RECORDS > UI DISPLAY

============================================================
3. NON-NEGOTIABLE ARCHITECTURE RULES
====================================

RULE 1
PostgreSQL is the authoritative system of record.

RULE 2
The server is the source of truth for:

* authorization
* roles
* permissions
* campaign state
* donation state
* payment state
* payout state
* verification
* financial totals

RULE 3
The client must NEVER be trusted to tell the server:

{
"role": "admin"
}

or:

{
"payment": "success"
}

or:

{
"verified": true
}

or:

{
"campaign_status": "approved"
}

These values must be determined server-side.

RULE 4
Do not use lifecycle booleans such as:

is_verified
is_active
is_completed

when an actual lifecycle exists.

Use explicit status/state fields.

RULE 5
No state transition may skip a defined intermediate state.

RULE 6
Every sensitive operation must produce an audit record.

RULE 7
Financial operations must be transaction-safe and idempotent.

RULE 8
Payment confirmation must come from server-side provider
verification/webhook logic.

RULE 9
Public API responses must never expose restricted or highly
sensitive information.

RULE 10
Core humanitarian and financial records should normally progress
to terminal states instead of being hard deleted.

============================================================
4. USERS AND ROLES
==================

There are four platform roles:

USER
AGENT
MODERATOR
ADMIN

A user may hold multiple roles.

Example:

USER + VERIFIED AGENT

Role and status are NOT the same thing.

---

## 4.1 USER

Default account role.

Can:

* register
* verify account
* login
* browse campaigns
* search campaigns
* view campaign details
* view verification information
* donate
* view own donations
* save/follow
* submit help request
* apply to become Agent
* report campaign
* manage own profile
* receive notifications

Cannot:

* create fundraising campaign directly

---

## 4.2 AGENT

Agent is layered on top of USER.

Agent status:

PENDING
UNDER_REVIEW
VERIFIED
RESTRICTED
SUSPENDED
REVOKED

Only:

AGENT + VERIFIED

may perform campaign-management operations.

Agent may:

* claim help requests
* investigate cases
* submit evidence
* create campaign from approved/eligible help request
* update own campaign
* submit campaign
* post campaign updates
* participate in assistance workflow

PENDING/UNDER_REVIEW/RESTRICTED/SUSPENDED/REVOKED
must not receive normal verified-agent privileges.

---

## 4.3 MODERATOR

Moderator is created only by Admin.

There is NO public moderator registration.

Moderator permissions are individually configurable.

Moderator may receive permissions such as:

campaign:review
campaign:approve
campaign:reject
agent:review
agent:verify
agent:suspend
report:review
report:resolve
dispute:resolve
finance:view
finance:manage
audit:view

Moderator cannot promote themselves to Admin.

Moderator cannot perform Admin-only operations.

---

## 4.4 ADMIN

Highest operational role.

Admin can:

* manage users
* manage agents
* create/manage moderators
* manage moderator permissions
* suspend users
* manage platform policies
* manage finance
* manage disputes
* view audit logs
* configure system
* manage categories
* investigate security events

Admin account must be created through a controlled bootstrap
process.

There must be NO public admin registration endpoint.

============================================================
5. PROJECT REPOSITORY STRUCTURE
===============================

Create the following repository:

plumihope/

```
README.md
LICENSE
.gitignore
.env.example
docker-compose.yml
Makefile

docs/

    00-product/
        product-overview.md
        glossary.md
        roadmap.md

    01-requirements/
        requirements.md
        business-rules.md
        acceptance-criteria.md
        traceability.md

    02-architecture/
        architecture.md
        system-context.md
        component-architecture.md
        deployment.md

    03-api/
        api-overview.md
        authentication.md
        authorization.md
        error-format.md
        endpoints.md

    04-database/
        database-overview.md
        erd.md
        tables.md
        indexes.md
        retention.md

    05-state-machines/
        agent.md
        help-request.md
        campaign.md
        donation.md
        payment.md
        report.md
        dispute.md
        payout.md
        cross-entity-rules.md

    06-security/
        security-model.md
        threat-model.md
        privacy.md
        file-security.md
        payment-security.md

    07-ui-ux/
        design-system.md
        web-information-architecture.md
        ios-information-architecture.md
        user-flows.md

    08-testing/
        test-strategy.md
        test-matrix.md
        e2e-flows.md
        security-tests.md

    09-deployment/
        local-development.md
        staging.md
        production.md
        backups.md
        disaster-recovery.md

    10-operations/
        moderation-guide.md
        incident-response.md
        audit-guide.md

    11-decisions/
        ADR-001-swiftui.md
        ADR-002-fastapi.md
        ADR-003-postgresql.md
        ADR-004-modular-monolith.md
        ADR-005-rest.md
        ADR-006-swiftdata.md
        ADR-007-object-storage.md
        ADR-008-redis.md
        ADR-009-event-streaming.md

backend/

    app/

        main.py

        core/
            config.py
            database.py
            security.py
            dependencies.py
            exceptions.py
            logging.py
            pagination.py
            permissions.py
            audit.py

        api/
            router.py
            v1/
                router.py

        modules/

            auth/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                dependencies.py

            users/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

            agents/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

            help_requests/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            campaigns/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            verification/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

            donations/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            payments/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                providers/
                    base.py
                    sandbox.py
                    provider_x.py

            payouts/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            reports/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            disputes/
                router.py
                schemas.py
                models.py
                repository.py
                service.py
                state_machine.py

            notifications/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

            moderation/
                router.py
                schemas.py
                service.py

            admin/
                router.py
                schemas.py
                service.py

            media/
                router.py
                schemas.py
                models.py
                service.py
                storage.py

            follows/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

            audit/
                router.py
                schemas.py
                models.py
                repository.py
                service.py

        models/
            base.py

        schemas/
            common.py
            pagination.py
            errors.py

    migrations/
        env.py
        script.py.mako
        versions/

    tests/

        unit/
            auth/
            users/
            agents/
            help_requests/
            campaigns/
            donations/
            payments/
            payouts/
            reports/
            disputes/
            permissions/
            state_machines/

        integration/

        api/

        security/

        e2e/

        fixtures/

    requirements.txt
    pyproject.toml
    Dockerfile

web/

    app/

        layout.tsx
        page.tsx

        (public)/
            page.tsx
            explore/
            campaigns/
            how-it-works/
            trust/
            about/
            faq/
            contact/

        auth/
            login/
            register/
            verify/
            forgot-password/
            reset-password/

        dashboard/
            layout.tsx
            page.tsx
            donations/
            saved/
            help-requests/
            notifications/
            profile/
            settings/

        agent/
            layout.tsx
            page.tsx
            requests/
            campaigns/
            verification/
            updates/
            notifications/
            profile/

        moderator/
            layout.tsx
            page.tsx
            campaigns/
            agents/
            reports/
            disputes/
            finance/
            audit/

        admin/
            layout.tsx
            page.tsx
            users/
            agents/
            moderators/
            campaigns/
            donations/
            payments/
            payouts/
            reports/
            disputes/
            categories/
            notifications/
            policies/
            audit/
            settings/

    components/

        ui/
        forms/
        campaigns/
        donations/
        help-requests/
        agents/
        moderation/
        admin/
        navigation/
        feedback/

    lib/
        api/
        auth/
        permissions/
        validation/
        formatters/

    hooks/
    stores/
    types/
    constants/
    utils/

    public/
        images/
        icons/

    tests/
        unit/
        integration/
        e2e/

    package.json
    tsconfig.json
    next.config.ts
    tailwind.config.ts
    Dockerfile

ios/

    PlumiHope/

        App/
            PlumiHopeApp.swift
            AppState.swift
            AppEnvironment.swift

        Core/

            Networking/
                APIClient.swift
                APIEndpoint.swift
                HTTPMethod.swift
                APIError.swift

            Authentication/
                AuthManager.swift
                TokenStore.swift
                KeychainTokenStore.swift

            Persistence/
                ModelContainer.swift
                PersistenceController.swift

            DI/
                DependencyContainer.swift

            DesignSystem/
                Colors.swift
                Typography.swift
                Spacing.swift
                Components.swift

            Utilities/
                Logger.swift
                DateFormatter.swift
                CurrencyFormatter.swift

        Models/
            User.swift
            Campaign.swift
            Donation.swift
            HelpRequest.swift
            Agent.swift
            Notification.swift
            Report.swift

        Repositories/
            CampaignRepository.swift
            DonationRepository.swift
            HelpRequestRepository.swift
            UserRepository.swift
            AgentRepository.swift

        Services/
            AuthService.swift
            CampaignService.swift
            DonationService.swift
            HelpRequestService.swift
            NotificationService.swift
            AgentService.swift

        Features/

            Authentication/
                Login/
                Register/
                Verification/
                ForgotPassword/

            Home/
                HomeView.swift
                HomeViewModel.swift

            Explore/
                ExploreView.swift
                ExploreViewModel.swift

            Campaign/
                CampaignDetailView.swift
                CampaignDetailViewModel.swift
                WhyVerifiedView.swift

            Donation/
                DonationAmountView.swift
                DonationPaymentView.swift
                DonationReviewView.swift
                DonationSuccessView.swift
                DonationReceiptView.swift

            HelpRequest/
                HelpRequestStartView.swift
                HelpRequestFormView.swift
                HelpRequestEvidenceView.swift
                HelpRequestReviewView.swift
                HelpRequestSubmittedView.swift
                HelpRequestStatusView.swift

            Activity/
                ActivityView.swift
                DonationHistoryView.swift
                DonationDetailView.swift
                SavedCampaignsView.swift

            Profile/
                ProfileView.swift
                SettingsView.swift
                SecurityView.swift
                NotificationSettingsView.swift

            Notifications/
                NotificationsView.swift

            Reports/
                ReportCampaignView.swift

        Components/
            CampaignCard.swift
            VerificationBadge.swift
            ProgressBar.swift
            PrimaryButton.swift
            SecondaryButton.swift
            EmptyStateView.swift
            ErrorStateView.swift
            LoadingView.swift

        Resources/
            Assets.xcassets
            Localizable.xcstrings

    PlumiHopeTests/
    PlumiHopeUITests/

infrastructure/

    docker/
    nginx/
    scripts/
        bootstrap-admin.sh
        seed-database.sh
        backup-database.sh
        restore-database.sh

.github/

    workflows/
        backend.yml
        web.yml
        ios.yml
        security.yml
        e2e.yml
        release.yml
```

============================================================
6. DOCUMENTATION STRUCTURE
==========================

The repository must document itself.

Every major architectural decision must have documentation.

Every API must be documented.

Every state machine must be documented.

Every permission must be documented.

Every database table must be documented.

Every test must be traceable to:

FR-*
NFR-*
BR-*
TC-*
or a state-machine transition.

============================================================
7. LOCAL DEVELOPMENT REQUIREMENTS
=================================

Required software:

* Git
* Docker
* Docker Compose
* Python 3.x
* Node.js LTS
* npm/pnpm
* Xcode
* Swift
* PostgreSQL client tools optionally
* Make optionally

Recommended:

* macOS for iOS development
* VS Code / Cursor / Claude Code
* Xcode
* Docker Desktop

============================================================
8. ENVIRONMENT FILES
====================

Create:

.env.example

Example:

APP_ENV=development

DATABASE_URL=postgresql+psycopg://plumihope:plumihope@postgres:5432/plumihope

JWT_SECRET=CHANGE_ME
JWT_ACCESS_EXPIRE_MINUTES=15
JWT_REFRESH_EXPIRE_DAYS=30

S3_ENDPOINT=
S3_BUCKET=
S3_ACCESS_KEY=
S3_SECRET_KEY=

PAYMENT_PROVIDER=sandbox
PAYMENT_API_KEY=

SMTP_HOST=
SMTP_PORT=
SMTP_USER=
SMTP_PASSWORD=

APNS_KEY_ID=
APNS_TEAM_ID=
APNS_BUNDLE_ID=

Never commit real secrets.

============================================================
9. DOCKER DEVELOPMENT ENVIRONMENT
=================================

docker-compose.yml must initially provide:

postgres

api

web

Optional future services:

redis
worker

Do not make Redis mandatory for MVP unless required.

Example architecture:

```
             ┌───────────────┐
             │    iOS App    │
             └───────┬───────┘
                     │ HTTPS
             ┌───────▼───────┐
             │   Next.js     │
             │ Web / Portal  │
             └───────┬───────┘
                     │ HTTPS
             ┌───────▼───────┐
             │    FastAPI    │
             │ Modular Mono  │
             └───────┬───────┘
                     │
        ┌────────────┼────────────┐
        │            │            │
  ┌─────▼─────┐ ┌────▼────┐ ┌────▼─────┐
  │ PostgreSQL│ │ Object  │ │ Payment  │
  │           │ │ Storage │ │ Provider │
  └───────────┘ └─────────┘ └──────────┘
```

============================================================
10. INSTALLATION / FIRST BOOT
=============================

STEP 1:

Clone repository.

STEP 2:

Copy:

.env.example

to:

.env

STEP 3:

Start infrastructure:

docker compose up -d postgres

STEP 4:

Run backend migrations.

alembic upgrade head

STEP 5:

Seed development data.

python scripts/seed.py

STEP 6:

Start API.

uvicorn app.main:app --reload

STEP 7:

Start web.

npm install
npm run dev

STEP 8:

Open iOS project in Xcode.

Configure:

API base URL
development environment

STEP 9:

Run tests.

Backend:
pytest

Web:
npm test

Web E2E:
npx playwright test

iOS:
xcodebuild test

============================================================
11. DATABASE
============

Database:

PostgreSQL

Primary keys:

UUID

Use:

gen_random_uuid()

unless a small lookup table justifies integer IDs.

Money:

NUMERIC

Never FLOAT.

Recommended:

NUMERIC(14,2)

or

NUMERIC(12,2)

depending on field.

Timestamp:

TIMESTAMPTZ

Database should default timestamps to now() where appropriate.

Foreign keys:

fk_<table>_<referenced_table>

Indexes:

idx_<table>_<columns>

============================================================
12. DATABASE TABLES
===================

Create these core tables:

IDENTITY / ACCESS:

users
roles
permissions
user_roles
role_permissions

HUMANITARIAN:

agent_profiles
agent_verifications
help_requests
help_request_agents
help_request_events

CAMPAIGN:

campaign_categories
campaigns
campaign_evidence
campaign_updates

FINANCIAL:

donations
payments
payouts

TRUST / ACCOUNTABILITY:

reports
reviews
disputes

ENGAGEMENT:

follows
notifications
media
audit_logs

============================================================
13. IMPORTANT DATABASE RELATIONSHIPS
====================================

users
|
+---- agent_profiles
|
+---- user_roles ---- roles ---- role_permissions ---- permissions
|
+---- help_requests
|
+---- donations
|
+---- reports
|
+---- notifications
|
+---- audit_logs

agent_profiles
|
+---- campaigns
|
+---- help_request_agents

help_requests
|
+---- help_request_agents
|
+---- help_request_events
|
+---- campaigns

campaigns
|
+---- campaign_evidence
|
+---- campaign_updates
|
+---- donations
|
+---- payouts
|
+---- reports
|
+---- disputes

donations
|
+---- payments

============================================================
14. DATA CLASSIFICATION
=======================

PUBLIC:

* campaign title
* approved public description
* public campaign media
* general category
* verification summary
* approved public updates

INTERNAL:

* operational metadata
* internal counters
* internal reputation information

RESTRICTED:

* moderator notes
* private phone
* private address
* detailed review notes
* restricted evidence
* recipient relationship details

HIGHLY SENSITIVE:

* national ID
* medical reports
* prescriptions
* bank/payout information
* sensitive location information

Never expose restricted/highly-sensitive fields through ordinary
public API responses.

============================================================
15. DELETE / RETENTION RULES
============================

Do not casually hard-delete:

campaigns
help_requests
donations
payments
payouts
audit_logs
reports
disputes

Financial records are historical evidence.

Example:

campaign -> donations

ON DELETE RESTRICT

donation -> payment

ON DELETE RESTRICT

audit_logs.actor_id:

SET NULL

Notifications may be deleted with the user if appropriate.

Media references may be SET NULL if media is legitimately purged.

Retention of highly sensitive information must follow finalized
legal/data-governance policy before production.

============================================================
16. AUTHENTICATION
==================

ONE authentication system.

No:

/agent/login
/moderator/login
/admin/login

Use:

POST /api/v1/auth/register
POST /api/v1/auth/login
POST /api/v1/auth/refresh
POST /api/v1/auth/logout

Flow:

REGISTER
->
EMAIL/PHONE VERIFICATION
->
LOGIN
->
SHORT-LIVED ACCESS TOKEN
+
LONG-LIVED REFRESH TOKEN

Refresh token rotation is required.

Logout revokes the relevant refresh session/token.

Passwords:

* strong salted hash
* never plaintext
* never logged

iOS:

Keychain

Web:

secure httpOnly cookie strategy where applicable.

Future:

MFA
Face ID
Touch ID

============================================================
17. AUTHORIZATION
=================

Authorization must combine:

ROLE
+
PERMISSION
+
ACCOUNT STATUS
+
OBJECT OWNERSHIP
+
CURRENT STATE
+
BUSINESS RULE

Example:

role = AGENT

is NOT sufficient.

Correct:

role = AGENT
AND agent_status = VERIFIED
AND permission = campaign:create
AND request/campaign state allows action

Only then:

ALLOW

============================================================
18. CORE PERMISSIONS
====================

campaign:view
campaign:create
campaign:update_own
campaign:submit
campaign:review
campaign:approve
campaign:reject

agent:apply
agent:review
agent:verify
agent:suspend

help_request:create
help_request:claim

donation:create
donation:view_own

finance:view
finance:manage

report:create
report:review
report:resolve

dispute:resolve

user:update_own
user:view
user:suspend

follow:manage

moderator:create
moderator:manage

system:manage

audit:view

============================================================
19. PERMISSION MATRIX
=====================

USER:

campaign:view       YES
campaign:create     NO
donation:create     YES
donation:view_own   YES
help_request:create YES
agent:apply         YES
report:create       YES
follow:manage       YES
user:update_own     YES

VERIFIED AGENT:

USER permissions
+
campaign:create
campaign:update_own
campaign:submit
help_request:claim

MODERATOR:

Only explicitly granted moderation permissions.

ADMIN:

All administrative permissions.

Agent permissions are automatically blocked when:

PENDING
UNDER_REVIEW
RESTRICTED
SUSPENDED
REVOKED

Only VERIFIED gets standard Agent campaign-management privileges.

============================================================
20. STATE MACHINE PRINCIPLE
===========================

Every lifecycle object has explicit states.

Allowed transitions are exhaustive.

If a transition is not defined:

REJECT IT.

Never allow:

DRAFT -> ACTIVE

if the defined workflow requires:

DRAFT
-> SUBMITTED
-> UNDER_REVIEW
-> APPROVED
-> ACTIVE

============================================================
21. AGENT STATE MACHINE
=======================

States:

PENDING
UNDER_REVIEW
VERIFIED
REJECTED
RESTRICTED
SUSPENDED
REVOKED

Typical flow:

PENDING
|
| moderator opens
v
UNDER_REVIEW
|
+---- approved ----> VERIFIED
|
+---- rejected ----> REJECTED

VERIFIED
|
+---- restriction ----> RESTRICTED
|
+---- suspension ----> SUSPENDED
|
+---- admin revoke --> REVOKED

Agent REVOKED is an Admin-level boundary.

Moderator may suspend where permitted.

Moderator must not gain the ability to revoke an Agent if the
permission model reserves revoke for Admin.

============================================================
22. HELP REQUEST STATE MACHINE
==============================

Implement the exact state list from the authoritative state-machine
implementation.

At minimum the workflow must represent:

SUBMITTED
-> UNDER_REVIEW / ASSIGNED
-> INVESTIGATION
-> ELIGIBLE / NOT_ELIGIBLE
-> CONVERTED_TO_CAMPAIGN
-> CLOSED/CANCELLED where applicable

IMPORTANT:

A help request may convert into at most one campaign.

Multiple Agents may express interest/claim according to the
business rules.

Collision prevention must be implemented server-side.

============================================================
23. CAMPAIGN STATE MACHINE
==========================

Core lifecycle:

DRAFT
->
SUBMITTED
->
UNDER_REVIEW
->
APPROVED
->
ACTIVE
->
TARGET_REACHED
->
ASSISTANCE_PENDING
->
FINAL_REVIEW
->
SUCCESSFUL

Possible negative/neutral states include:

REJECTED
SUSPENDED
CANCELLED
EXPIRED
CLOSED

Do not invent alternate shortcuts.

Important:

TARGET_REACHED != SUCCESSFUL

Money reaching the target does NOT mean humanitarian assistance
has been successfully delivered.

============================================================
24. CAMPAIGN RULES
==================

BR-01

Normal USER cannot create a campaign.

BR-02

Only VERIFIED Agent can submit campaign.

BR-03

Moderator approval is required before public fundraising.

BR-04

Required evidence must satisfy verification rules.

BR-05

Donation status depends on server-side payment verification.

BR-06

Payout and assistance are separate from donation collection.

BR-07

Final SUCCESSFUL status requires assistance/proof workflow and
final review.

BR-08

Suspended Agents cannot create new campaigns.

BR-09

Revoked Agents cannot perform Agent operations.

BR-10

Moderator cannot perform Admin-only revoke boundary.

BR-11

Admin cannot be created through public registration.

BR-12

Sensitive documents are not public by default.

============================================================
25. CAMPAIGN DATA
=================

Campaign contains at minimum:

id
help_request_id
agent_profile_id
title
description
category_id
target_amount
raised_amount
currency
start_date
end_date
status
verification_status
recipient_name
recipient_relationship
payout_destination_ref
created_at
updated_at

Important:

raised_amount is derived/updated from CONFIRMED donations only.

Never allow client-side:

raised_amount += donation

============================================================
26. EVIDENCE
============

Evidence types may include:

PRESCRIPTION
MEDICAL_REPORT
HOSPITAL_ESTIMATE
IDENTITY
RECIPIENT_PHOTO
RECIPIENT_INTERVIEW
FIELD_VIDEO
EXTERNAL_VIDEO_LINK
RECEIPT
COST_ESTIMATE
OTHER

Each evidence record must support:

uploaded
visibility
verification status
verified_by
verified_at

Visibility:

PUBLIC
RESTRICTED

Restricted evidence must require appropriate authorization.

============================================================
27. "WHY VERIFIED?"
===================

Do NOT display verification as only:

✓ VERIFIED

Instead explain specific checks.

Example:

WHY VERIFIED?

[✓] Agent identity reviewed
[✓] Case investigated
[✓] Supporting evidence reviewed
[✓] Cost estimate reviewed
[✓] Recipient information checked
[✓] Campaign approved by Moderator

Include:

"Verified means the listed checks were completed and reviewed.
It is not a guarantee of absolute certainty."

The exact checks shown must come from actual backend verification
records, not a fake frontend badge.

============================================================
28. CAMPAIGN UPDATES
====================

Agent may publish campaign updates when state allows.

Update can contain:

content
media
author
timestamp

Examples:

* Field investigation completed
* Treatment started
* Assistance purchased
* Assistance delivered
* Recipient received support
* Final proof uploaded

Updates form a public accountability timeline.

============================================================
29. DONATION MODEL
==================

Donation flow:

CAMPAIGN
->
ENTER AMOUNT
->
FEE BREAKDOWN
->
PAYMENT METHOD
->
REVIEW
->
PAYMENT INITIATION
->
PROVIDER
->
SERVER VERIFICATION
->
DONATION CONFIRMED
->
CAMPAIGN TOTAL UPDATED
->
RECEIPT

Never:

client says payment successful
->
campaign amount updated

Correct:

provider confirmation
->
server verifies
->
database transaction
->
donation CONFIRMED
->
campaign total updated

============================================================
30. FINANCIAL SAFETY
====================

Donation/payment/payout logic must be:

* idempotent
* transactional
* replay resistant
* race-condition resistant

Use:

provider_reference UNIQUE

Idempotency keys where appropriate.

Never use floating-point arithmetic for money.

Use database transactions.

Concurrent donation confirmation must not corrupt:

raised_amount

or donation status.

============================================================
31. PAYMENT STATE MACHINE
=========================

Implement explicit Payment states.

Typical:

INITIATED
-> PROCESSING
-> VERIFIED

or failure/cancellation states according to provider integration.

Only verified provider information may transition payment into the
successful/verified state.

============================================================
32. DONATION STATE MACHINE
==========================

Donation state must reflect server-confirmed financial status.

A donation cannot become:

CONFIRMED

until the linked payment is verified.

Relationship:

DONATION 1 : 1 PAYMENT

============================================================
33. PAYOUT STATE MACHINE
========================

Payout is intentionally separate from donation collection.

States:

PENDING
PROCESSING
COMPLETED
FAILED

Flow:

PENDING
->
PROCESSING
->
COMPLETED

or:

PROCESSING
->
FAILED

A failed payout must NOT simply be mutated into success.

Retry:

FAILED
->
NEW PAYOUT ROW
->
PENDING

Original failed row remains historical evidence.

============================================================
34. ASSISTANCE WORKFLOW
=======================

Funding:

TARGET_REACHED

does NOT equal:

ASSISTANCE_DELIVERED

Correct:

TARGET_REACHED
->
PAYOUT
->
ASSISTANCE_PENDING
->
ASSISTANCE_DELIVERED
->
PROOF_SUBMITTED
->
FINAL_REVIEW
->
SUCCESSFUL

Moderator final approval is required.

============================================================
35. REPORT SYSTEM
=================

Any relevant User may create a report.

Flow:

OPEN
->
UNDER_REVIEW
->
MORE_INFORMATION_REQUIRED
->
UNDER_REVIEW
->
RESOLVED

or:

UNDER_REVIEW
->
ESCALATED

or:

UNDER_REVIEW
->
DISMISSED

Every decision requires appropriate rationale.

============================================================
36. DISPUTE SYSTEM
==================

Dispute is different from Report.

Dispute is for formal financial/assistance-related issues.

States:

OPEN
UNDER_REVIEW
RESOLVED

Resolution outcome may be:

NO_ISSUE
REFUND
PARTIAL_REFUND
CAMPAIGN_SUSPENDED
AGENT_RESTRICTED
PAYMENT_INVESTIGATION
ESCALATED

============================================================
37. NOTIFICATIONS
=================

USER notifications:

* help request updates
* campaign-related events
* donation confirmation
* report status
* account events

AGENT notifications:

* nearby requests
* requests claimed by others
* campaign approval/rejection
* requests for evidence
* new donations
* deadlines
* moderator messages

MODERATOR notifications:

* new Agent applications
* campaigns awaiting review
* high-risk campaigns
* submitted reports
* payout reviews

ADMIN notifications:

* security alerts
* payment anomalies
* system failures
* unusual activity
* major escalations

Support:

In-app notifications

Push notifications through APNs

Email/SMS as configured.

============================================================
38. AUDIT LOG
=============

Audit logging is mandatory.

Sensitive actions must create append-style audit records.

Examples:

user role changed
user suspended
agent verified
agent suspended
campaign approved
campaign rejected
evidence accessed
donation confirmed
payment verified
payout initiated
payout completed
report resolved
dispute resolved
moderator permission changed
system policy changed

Audit record should contain:

id
actor_id
action
entity_type
entity_id
before
after
timestamp
metadata where appropriate

Audit history should survive user deletion.

============================================================
39. API DESIGN
==============

Base:

/api/v1/

REST + JSON.

GraphQL is NOT required for MVP.

Errors use structured machine-readable bodies.

HTTP statuses:

400
401
403
404
409
422
429
500

============================================================
40. INITIAL API ENDPOINTS
=========================

AUTH

POST /api/v1/auth/register
POST /api/v1/auth/login
POST /api/v1/auth/refresh
POST /api/v1/auth/logout

USER

GET /api/v1/users/me
PATCH /api/v1/users/me

AGENTS

POST /api/v1/agents/apply
GET /api/v1/agents
GET /api/v1/agents/{id}

HELP REQUESTS

POST /api/v1/help-requests
GET /api/v1/help-requests
GET /api/v1/help-requests/{id}
POST /api/v1/help-requests/{id}/claim

CAMPAIGNS

POST /api/v1/campaigns
GET /api/v1/campaigns
GET /api/v1/campaigns/{id}
PATCH /api/v1/campaigns/{id}
POST /api/v1/campaigns/{id}/evidence
POST /api/v1/campaigns/{id}/updates
POST /api/v1/campaigns/{id}/submit
POST /api/v1/campaigns/{id}/reports

DONATIONS

POST /api/v1/donations
GET /api/v1/donations/me

MODERATION

GET /api/v1/moderation/campaigns
POST /api/v1/moderation/campaigns/{id}/approve
POST /api/v1/moderation/campaigns/{id}/reject

ADMIN

GET /api/v1/admin/users

Expand API consistently for:

agents
reports
disputes
payouts
notifications
audit
moderator management
categories
finance
system settings

============================================================
41. API REQUEST PIPELINE
========================

Every protected request follows:

REQUEST
->
AUTHENTICATION
->
IDENTIFY USER
->
LOAD ROLES
->
LOAD PERMISSIONS
->
AUTHORIZATION
->
OBJECT OWNERSHIP CHECK
->
STATE CHECK
->
BUSINESS RULE VALIDATION
->
DATABASE TRANSACTION
->
AUDIT LOG
->
RESPONSE

Do not bypass this pipeline.

============================================================
42. BACKEND MODULE RULE
=======================

Each module owns:

router
schema
service
repository
models

Example:

campaigns/
router.py
schemas.py
models.py
repository.py
service.py
state_machine.py

Do not put all business logic in router.py.

Router:

HTTP only.

Service:

business logic.

Repository:

database access.

State machine:

allowed transitions.

============================================================
43. SERVICE LAYER
=================

Services must enforce:

* state transitions
* permission rules
* ownership
* validation
* financial integrity
* audit logging
* cross-module rules

Example:

CampaignService.submit_campaign()

must verify:

1. authenticated user
2. user has AGENT role
3. agent status == VERIFIED
4. campaign belongs to agent
5. campaign state permits submission
6. required evidence exists
7. verification requirements satisfied
8. transaction succeeds
9. audit entry created

============================================================
44. IOS ARCHITECTURE
====================

Architecture:

SwiftUI
->
ViewModel
->
Use Case / Service
->
Repository
->
API Client
->
FastAPI

Local:

SwiftData

Secure:

Keychain

Networking:

URLSession

Concurrency:

async/await

============================================================
45. IOS MAIN NAVIGATION
=======================

Use a clean tab-based architecture.

Recommended:

HOME
EXPLORE
ACTIVITY
PROFILE

Primary actions:

Donate
Request Help
View Campaign
Save Campaign

Use sheets/navigation stacks where appropriate.

Do not overload the tab bar.

============================================================
46. IOS AUTH SCREENS
====================

SCREEN:

Splash

SCREEN:

Welcome

SCREEN:

Register

Fields:

name
email/phone
password
confirm password

SCREEN:

Verification

SCREEN:

Login

SCREEN:

Forgot Password

SCREEN:

Reset Password

SCREEN:

Session Expired

============================================================
47. IOS HOME
============

Home should include:

Greeting
Featured campaigns
Urgent campaigns
Categories
Recent updates
Trust explanation
Request Help CTA
Explore CTA

Example:

+--------------------------------+
| PlumiHope                 ...  |
|                                |
| Help can change a life.        |
|                                |
| [ Find a Campaign ]            |
|                                |
| FEATURED                       |
|                                |
| [ Campaign Card ]              |
| [ Campaign Card ]              |
|                                |
| VERIFIED CASES                  |
| ...                            |
|                                |
| Home Explore Activity Profile |
+--------------------------------+

============================================================
48. IOS CAMPAIGN DETAIL
=======================

Must include:

campaign media
title
verification state
Why Verified
description
recipient information allowed for public display
target
raised
progress
deadline
agent information allowed for public display
updates
evidence summary
Donate button
Report button
Save button

Example:

+--------------------------------+
| < Back                  Share  |
|                                |
| [ Campaign Image ]             |
|                                |
| VERIFIED                       |
| Help with treatment            |
|                                |
| ৳45,000 raised / ৳80,000       |
| ███████████░░                  |
|                                |
| [ DONATE NOW ]                 |
|                                |
| WHY VERIFIED?                  |
| ✓ Identity checked             |
| ✓ Case investigated            |
| ✓ Evidence reviewed            |
|                                |
| STORY                          |
| ...                            |
|                                |
| UPDATES                        |
| ...                            |
+--------------------------------+

============================================================
49. IOS DONATION FLOW
=====================

Screen 1:

Donation Amount

Preset:

৳100
৳500
৳1,000
Custom

Screen 2:

Fee Breakdown

Donation:
৳1,000

Platform/processing fee:
৳XX

Total:
৳X,XXX

Screen 3:

Payment Method

Screen 4:

Review

Screen 5:

Processing

Screen 6:

Success

Screen 7:

Receipt

Receipt should contain:

donation ID
campaign
amount
fee
total
timestamp
payment reference where appropriate

============================================================
50. IOS HELP REQUEST FLOW
=========================

SCREEN 1:

Request Help

SCREEN 2:

Category

SCREEN 3:

Description

SCREEN 4:

Location

SCREEN 5:

Evidence / attachments where permitted

SCREEN 6:

Review

SCREEN 7:

Submit

SCREEN 8:

Request Submitted

SCREEN 9:

Status Timeline

Example:

Submitted
|
Under Review
|
Agent Assigned
|
Investigation
|
Decision
|
Campaign / Closed

============================================================
51. IOS ACTIVITY
================

Include:

Donation history
Donation detail
Saved campaigns
Help request history
Notifications

============================================================
52. IOS PROFILE
===============

Include:

Profile
Edit Profile
Security
Notification Preferences
Agent Application
Help & Support
Terms
Privacy
Logout

If user is Agent:

Agent status
Verification status
Agent dashboard entry

============================================================
53. WEB PUBLIC SITE
===================

Public pages:

/
/explore
/campaigns
/campaigns/[id]
/how-it-works
/trust
/about
/faq
/contact

Authentication:

/auth/login
/auth/register
/auth/verify
/auth/forgot-password
/auth/reset-password

============================================================
54. WEB HOME PAGE
=================

Header:

PLUMIHOPE

Explore
How It Works
Trust
About

Sign In

Primary CTA:

Find a Campaign

Secondary:

Ask for Help

Hero:

"Help should reach people when they need it most."

Trust points:

Verified cases
Human review
Transparent progress
Accountability updates

Featured campaigns.

Categories.

How it works.

Trust explanation.

Final CTA.

Footer.

============================================================
55. WEB EXPLORE
===============

Filters:

category
subcategory
status
funding progress
deadline
location where public-safe
search text

Cards:

image
verified state
title
short description
raised
target
progress
deadline
Donate

Include:

loading
empty
error
pagination/infinite scroll

============================================================
56. WEB CAMPAIGN DETAIL
=======================

Sections:

Hero media
Campaign title
Verification
Why Verified
Funding progress
Donation CTA
Story
Evidence
Agent information
Updates timeline
Financial transparency
Report campaign
Related campaigns

Do NOT expose restricted evidence.

============================================================
57. USER DASHBOARD
==================

Dashboard:

Overview
My Donations
Saved Campaigns
Help Requests
Notifications
Profile

Cards:

Total donated
Active support
Saved campaigns
Open help requests

============================================================
58. AGENT PORTAL
================

Agent pages:

Dashboard
Requests
Request Detail
Investigation
Evidence
Campaigns
Campaign Detail
Campaign Create
Campaign Edit
Campaign Updates
Verification
Notifications
Profile

Dashboard metrics:

Assigned Requests
Pending Investigations
Active Campaigns
Campaigns Awaiting Review
Completed Cases

============================================================
59. AGENT REQUEST DETAIL
========================

Show:

request information
category
safe location information
request history
claim status
other agent activity where permitted
action:

Claim

After claim:

Start Investigation

Evidence:

upload
document
photo
video
notes

Then:

Create Campaign

============================================================
60. AGENT CAMPAIGN CREATION
===========================

Only VERIFIED Agent.

Flow:

Select approved/eligible Help Request

->
Campaign information

->
Target amount

->
Recipient information

->
Evidence

->
Review

->
Save Draft

->
Submit

Validation must occur server-side.

============================================================
61. MODERATOR DASHBOARD
=======================

Pages:

Dashboard
Campaign Review
Agent Review
Reports
Disputes
Finance
Audit
Notifications

Dashboard metrics:

Campaigns awaiting review
Agent applications
Open reports
Open disputes
High-risk items
Payout reviews

============================================================
62. MODERATOR CAMPAIGN REVIEW
=============================

Review screen:

Campaign information
Agent
Help Request
Evidence
Verification checklist
Financial estimate
Recipient information
History
Existing reports
Audit trail

Actions:

Approve
Reject
Request More Information
Suspend where authorized

Every decision:

requires correct permission
requires valid campaign state
creates audit record
creates notification

============================================================
63. MODERATOR AGENT REVIEW
==========================

Show:

application
identity/KYC evidence
experience
supporting documents
verification history
previous actions if authorized

Actions:

Approve
Reject
Suspend

Admin-only revoke remains protected.

============================================================
64. REPORT DASHBOARD
====================

Moderator sees:

Report ID
Reporter
Entity
Reason
Status
Priority
Created
Assigned moderator

Actions:

Open
Review
Request information
Resolve
Dismiss
Escalate

============================================================
65. DISPUTE DASHBOARD
=====================

Show:

Dispute
Related campaign
Related donation
Related payment
Evidence
Report history
Financial information as permitted

Actions:

Resolve
Refund
Partial refund
Campaign suspend
Agent restriction
Payment investigation
Escalate

============================================================
66. ADMIN DASHBOARD
===================

Admin pages:

Dashboard
Users
Agents
Moderators
Campaigns
Donations
Payments
Payouts
Reports
Disputes
Categories
Notifications
Policies
Audit Logs
Settings

Dashboard:

Users
Active users
Agents
Verified agents
Active campaigns
Funds raised
Pending payouts
Open reports
Open disputes
Payment health
Security events

============================================================
67. ADMIN USER MANAGEMENT
=========================

Admin can:

search users
view user
suspend user
restore user where policy allows
view roles
manage roles where permitted
view account status

Every administrative change:

AUDIT LOG

============================================================
68. ADMIN MODERATOR MANAGEMENT
==============================

Admin can:

create moderator
assign permissions
remove permissions
suspend moderator access

Moderator cannot:

create another Admin
promote self
change system authority

============================================================
69. ADMIN POLICY MANAGEMENT
===========================

Potential policies:

fee model
overfunding behavior
moderator permissions
campaign categories
verification requirements
notification policy

Changes must be:

authenticated
authorized
validated
audited

============================================================
70. WEB DESIGN SYSTEM
=====================

Design objective:

Trustworthy
Human
Modern
Calm
Professional
Accessible

Avoid:

casino-like donation UI
aggressive red urgency
dark patterns
fake scarcity
excessive animations
misleading verification

Use:

clean cards
strong hierarchy
generous whitespace
clear progress
evidence-driven trust presentation

Typography:

Web:
Inter or equivalent modern sans-serif.

iOS:

SF Pro.

Spacing:

4 / 8 / 12 / 16 / 24 / 32 / 40 / 48

Border radius:

8
12
16
20

Buttons:

Primary
Secondary
Tertiary
Destructive

============================================================
71. UI COMPONENT LIBRARY
========================

Web:

Button
Input
Textarea
Select
Checkbox
Radio
Tabs
Modal
Drawer
Toast
Alert
Badge
Avatar
Card
CampaignCard
CampaignProgress
VerificationSummary
EvidenceCard
Timeline
DataTable
Pagination
SearchBar
FilterBar
EmptyState
ErrorState
Skeleton

iOS:

PrimaryButton
SecondaryButton
CampaignCard
ProgressBar
VerificationBadge
EvidenceRow
TimelineRow
FormField
LoadingView
EmptyStateView
ErrorStateView
ConfirmationSheet

============================================================
72. DESIGN STATES
=================

Every important screen must support:

DEFAULT
LOADING
EMPTY
ERROR
SUCCESS
DISABLED
PERMISSION_DENIED
UNAUTHORIZED
OFFLINE
SESSION_EXPIRED

Never design only the happy path.

============================================================
73. ACCESSIBILITY
=================

Web:

WCAG AA target.

Support:

keyboard navigation
screen readers
focus states
semantic HTML
sufficient contrast

iOS:

VoiceOver
Dynamic Type
44pt minimum touch target
Reduce Motion compatibility
accessible labels
accessible hints
logical focus order

============================================================
74. RESPONSIVE WEB
==================

Breakpoints:

mobile
tablet
desktop
large desktop

Campaign grid:

mobile:
1 column

tablet:
2 columns

desktop:
3 columns

admin tables:

responsive horizontal scrolling or adaptive card view.

============================================================
75. MEDIA SYSTEM
================

Use S3-compatible object storage.

Database stores:

object key
metadata
visibility
owner/reference
created timestamp

Do not store large media blobs directly in PostgreSQL.

Upload pipeline:

CLIENT
->
AUTHENTICATED UPLOAD
->
SERVER VALIDATION
->
OBJECT STORAGE
->
MEDIA ROW
->
REFERENCE ENTITY

Validate:

MIME
file size
extension
ownership
visibility

Never trust filename or client MIME alone.

============================================================
76. SEARCH
==========

MVP:

PostgreSQL-native search.

Use:

tsvector
GIN

Search fields:

campaign title
description
category

Future:

OpenSearch/Elasticsearch

only when scale/complexity justifies it.

============================================================
77. REDIS
=========

Redis is optional initially.

Introduce only for:

caching
rate limiting
short-lived data
hot reads

Do not create Redis dependency just because it is fashionable.

============================================================
78. BACKGROUND JOBS
===================

Later:

worker process

Potential jobs:

notifications
media processing
receipt generation
email
push notifications
report aggregation

RabbitMQ optional.

============================================================
79. EVENT STREAMING
===================

Do NOT introduce Kafka initially.

Introduce only if actual:

event volume
number of consumers
analytics
notifications
risk engine
recommendations

justify it.

============================================================
80. AI
======

AI must NEVER become the final authority for:

identity verification
payment verification
financial state
campaign approval
humanitarian eligibility

If AI is later added, use it for:

risk signals
duplicate detection
document assistance
search
classification
moderator assistance

Human review remains authoritative.

============================================================
81. SECURITY
============

Implement:

password hashing
JWT access tokens
refresh token rotation
server-side RBAC
object-level authorization
rate limiting strategy
input validation
SQL injection protection through ORM/parameterization
file upload validation
CSRF protection where applicable
secure cookies where applicable
security headers
CORS policy
secret management
audit logging
IDOR protection
privilege escalation protection

Never trust client role claims.

============================================================
82. PRIVACY
===========

Collect minimum necessary sensitive information.

Do not expose:

NID
medical reports
private address
private phone
bank information

unless explicitly authorized.

Public campaign data must be redacted appropriately.

============================================================
83. FINANCIAL TRANSACTION PATTERN
=================================

For donation confirmation:

BEGIN TRANSACTION

1. Lock/check payment record
2. Verify provider reference
3. Confirm payment
4. Update donation
5. Update campaign raised amount
6. Create audit log
7. Commit

If any step fails:

ROLLBACK

Use idempotency.

============================================================
84. DATABASE INDEXING
=====================

Index every foreign key.

Important:

campaigns.status
campaigns.agent_profile_id
campaigns.category_id
campaigns.help_request_id

help_requests.status

reports.status

donations.status

audit_logs.entity_type + entity_id

reviews.entity_type + entity_id

payments.provider_reference UNIQUE

users.email UNIQUE

users.phone UNIQUE where applicable

follows(user_id, agent_profile_id) UNIQUE

============================================================
85. TESTING STRATEGY
====================

Testing begins from the first feature.

Test levels:

UNIT
INTEGRATION
API
E2E
SECURITY
PERFORMANCE
ACCESSIBILITY

Tools:

Backend:

pytest

HTTP:

httpx

API schema:

schemathesis where useful

iOS:

XCTest
XCUITest

Web:

Jest
Playwright

Load:

k6

Accessibility:

axe
VoiceOver

============================================================
86. TEST TRACEABILITY
=====================

Every test should reference:

FR
NFR
BR
TC
or state transition.

Example:

# TC-CMP-03

# Verifies FR-CMP-03

or:

# SM-CAMPAIGN: UNDER_REVIEW -> APPROVED

Untraceable critical tests are technical debt.

============================================================
87. STATE MACHINE TESTING
=========================

For EVERY defined transition:

create positive test.

For EVERY undefined transition:

create negative test.

Example:

DRAFT -> SUBMITTED

must succeed when conditions are met.

DRAFT -> ACTIVE

must fail if intermediate states are required.

============================================================
88. AUTHORIZATION TESTING
=========================

Test:

USER
AGENT/PENDING
AGENT/UNDER_REVIEW
AGENT/VERIFIED
AGENT/RESTRICTED
AGENT/SUSPENDED
AGENT/REVOKED
MODERATOR
ADMIN

Do NOT test AGENT as a single state.

============================================================
89. SECURITY TESTS
==================

Test:

forged role claims
forged payment success
IDOR
privilege escalation
unauthorized evidence access
unauthorized campaign modification
unauthorized payout
replay attack
duplicate payment
duplicate webhook
malicious upload
oversized upload
invalid MIME
SQL injection
authentication bypass
expired token
revoked refresh token

============================================================
90. E2E MVP JOURNEY
===================

E2E TEST:

1. Register User
2. Verify account
3. Login
4. Submit Help Request
5. Apply as Agent
6. Moderator reviews Agent
7. Agent becomes VERIFIED
8. Agent claims Help Request
9. Agent investigates
10. Agent uploads evidence
11. Agent creates campaign
12. Agent submits campaign
13. Moderator reviews
14. Moderator approves
15. Campaign becomes public
16. Donor views campaign
17. Donor opens Why Verified
18. Donor donates using sandbox
19. Server verifies payment
20. Donation becomes CONFIRMED
21. Campaign raised amount updates
22. Agent posts update
23. Payout initiated
24. Payout completed
25. Assistance delivered
26. Proof uploaded
27. Campaign enters FINAL_REVIEW
28. Moderator approves final outcome
29. Campaign becomes SUCCESSFUL
30. User can report campaign
31. Moderator investigates/resolves report
32. Audit log contains sensitive actions

============================================================
91. PERFORMANCE
===============

Indicative target:

P95 read API latency < 500ms under normal load.

Measure:

API latency
database query time
media processing
queue latency
notification latency

Use k6 before major releases.

============================================================
92. OBSERVABILITY
=================

Track:

request ID
structured logs
errors
API latency
DB latency
payment failures
webhook failures
authentication failures
security events

Future:

Sentry
OpenTelemetry
Prometheus
Grafana

============================================================
93. CI/CD
=========

GitHub Actions.

On pull request:

1. format/lint
2. type checks
3. unit tests
4. integration tests
5. API tests
6. security tests
7. web build
8. iOS tests where CI environment permits

No merge if required CI fails.

============================================================
94. BRANCHING
=============

Recommended:

main
develop
feature/*
fix/*
hotfix/*

Pull requests require:

tests
review
traceability
migration review where applicable

============================================================
95. DATABASE MIGRATIONS
=======================

Use Alembic only.

Never manually modify production database schema.

For schema change:

1. modify SQLAlchemy model
2. create migration
3. inspect migration
4. test migration
5. apply migration
6. verify rollback strategy

Destructive migrations:

EXPAND
->
MIGRATE
->
CONTRACT

Do not blindly drop production columns.

============================================================
96. SEED DATA
=============

Development seed should create:

Admin
Moderator
Verified Agent
Normal User
Sample Help Requests
Sample Campaigns
Sample donations
Sample reports
Sample notifications

Use clearly fake development data.

Never seed real sensitive data.

============================================================
97. DEVELOPMENT ACCOUNTS
========================

Create development-only users:

[admin@example.test](mailto:admin@example.test)
[moderator@example.test](mailto:moderator@example.test)
[agent@example.test](mailto:agent@example.test)
[user@example.test](mailto:user@example.test)

Use development passwords only.

Never use these credentials in production.

============================================================
98. WEB ROUTE MAP
=================

PUBLIC:

/
/explore
/campaigns
/campaigns/:id
/how-it-works
/trust
/about
/faq
/contact

AUTH:

/auth/login
/auth/register
/auth/verify
/auth/forgot-password
/auth/reset-password

USER:

/dashboard
/dashboard/donations
/dashboard/donations/:id
/dashboard/saved
/dashboard/help-requests
/dashboard/help-requests/:id
/dashboard/notifications
/dashboard/profile
/dashboard/settings

AGENT:

/agent
/agent/requests
/agent/requests/:id
/agent/campaigns
/agent/campaigns/new
/agent/campaigns/:id
/agent/verification
/agent/notifications
/agent/profile

MODERATOR:

/moderator
/moderator/campaigns
/moderator/campaigns/:id
/moderator/agents
/moderator/agents/:id
/moderator/reports
/moderator/reports/:id
/moderator/disputes
/moderator/disputes/:id
/moderator/finance
/moderator/audit

ADMIN:

/admin
/admin/users
/admin/agents
/admin/moderators
/admin/campaigns
/admin/donations
/admin/payments
/admin/payouts
/admin/reports
/admin/disputes
/admin/categories
/admin/notifications
/admin/policies
/admin/audit
/admin/settings

============================================================
99. UI/UX SCREEN INVENTORY
==========================

PUBLIC:

01 Splash/Loading
02 Home
03 Explore
04 Search Results
05 Campaign Detail
06 Why Verified
07 How It Works
08 Trust & Safety
09 About
10 FAQ
11 Contact

AUTH:

12 Register
13 Login
14 Verification
15 Forgot Password
16 Reset Password
17 Session Expired

USER:

18 Dashboard
19 Donation History
20 Donation Detail
21 Saved Campaigns
22 Help Request
23 Help Request Status
24 Notifications
25 Profile
26 Settings
27 Security

DONATION:

28 Donation Amount
29 Fee Breakdown
30 Payment Method
31 Donation Review
32 Payment Processing
33 Donation Success
34 Receipt

AGENT:

35 Agent Application
36 Agent Dashboard
37 Request Queue
38 Request Detail
39 Claim Request
40 Investigation
41 Evidence Upload
42 Campaign Create
43 Campaign Draft
44 Campaign Submit
45 Campaign Management
46 Campaign Update
47 Agent Notifications
48 Agent Profile
49 Agent Verification

MODERATOR:

50 Moderator Dashboard
51 Campaign Queue
52 Campaign Review
53 Evidence Review
54 Agent Queue
55 Agent Review
56 Report Queue
57 Report Detail
58 Dispute Queue
59 Dispute Detail
60 Finance Review
61 Moderator Audit

ADMIN:

62 Admin Dashboard
63 Users
64 User Detail
65 Agents
66 Agent Detail
67 Moderators
68 Moderator Permissions
69 Campaign Management
70 Donations
71 Payments
72 Payouts
73 Reports
74 Disputes
75 Categories
76 Notification Management
77 System Policies
78 Audit Logs
79 Security Events
80 Settings

============================================================
100. EVERY SCREEN MUST HAVE THESE STATES
========================================

For each screen define:

NORMAL

LOADING

EMPTY

ERROR

SUCCESS

UNAUTHORIZED

FORBIDDEN

OFFLINE

SESSION_EXPIRED

CONFIRMATION

DESTRUCTIVE_CONFIRMATION where applicable

============================================================
101. ERROR UX
=============

Never show:

"Something went wrong."

alone.

Use useful messages.

Example:

"Your donation could not be confirmed yet. No money was added to
the campaign total. Please check your payment status or try again."

For authorization:

"You don't have permission to perform this action."

For expired session:

"Your session has expired. Please sign in again."

============================================================
102. OFFLINE IOS BEHAVIOR
=========================

SwiftData may cache:

campaigns
saved campaigns
safe public information
offline drafts

BUT:

offline data must NEVER become authoritative for:

payment status
authorization
campaign status
financial totals
verification status

When online:

refresh from server.

============================================================
103. API PAGINATION
===================

List endpoints should support:

page
page_size

or cursor pagination where appropriate.

Response should contain:

items
page
page_size
total
has_next

or equivalent cursor metadata.

============================================================
104. API VERSIONING
===================

Current:

/api/v1/

Breaking API changes require:

/api/v2/

Do not silently break clients.

============================================================
105. API DOCUMENTATION
======================

FastAPI automatic OpenAPI documentation must remain enabled in
development/staging.

Document:

authentication
permissions
request schema
response schema
error schema
examples

============================================================
106. FRONTEND DATA RULE
=======================

Frontend must not reproduce backend business rules as the only
enforcement mechanism.

Frontend may hide unavailable actions for UX.

Backend MUST independently enforce the same rule.

Example:

Web hides "Create Campaign" for normal USER.

But API must still reject:

POST /campaigns

from USER.

============================================================
107. MODERATION DESIGN PRINCIPLE
================================

Moderator UI must make evidence review easy.

Review page should prioritize:

CASE
AGENT
EVIDENCE
VERIFICATION CHECKS
FINANCIAL ESTIMATE
HISTORY
REPORTS
DECISION

Do not force moderators to hunt through unrelated screens.

============================================================
108. TRUST DESIGN PRINCIPLE
===========================

Do not use trust badges as decoration.

Every verification badge must link to evidence/verification
explanation.

Example:

[ VERIFIED ]

click:

WHY VERIFIED?

Then:

Identity:
Reviewed

Case:
Investigated

Evidence:
Reviewed

Cost:
Checked

Moderator:
Approved

============================================================
109. ADMIN SECURITY PRINCIPLE
=============================

Admin actions are high-risk.

Require:

authentication
authorization
confirmation for destructive actions
audit logging

Never expose admin UI publicly.

Even if frontend route is hidden, backend endpoint must enforce
Admin authorization.

============================================================
110. PAYMENT WEBHOOK
====================

Payment provider webhook endpoint:

POST /api/v1/payments/webhooks/{provider}

Must:

1. Validate signature
2. Validate provider event
3. Find payment
4. Verify provider reference
5. Check idempotency
6. Update payment state
7. Update donation state
8. Update campaign funding
9. Audit
10. Return success

Duplicate webhook:

must not duplicate donation.

============================================================
111. REFUNDS
============

Refunds must be server-controlled.

Never let client decide:

refund amount
refund status
payment status

Refund operation must be:

authorized
idempotent
audited

============================================================
112. PAYOUT SAFETY
==================

Payout destination information is highly sensitive.

Never return payout destination reference to public clients.

Payout operation:

permission check
state check
financial validation
transaction
provider request
state update
audit

============================================================
113. REPORT / DISPUTE SECURITY
==============================

Users can report.

Only authorized Moderator/Admin can investigate private report
details.

Report resolution must include:

decision
rationale
actor
timestamp

============================================================
114. LOGGING RULES
==================

Never log:

password
access token
refresh token
NID
medical report content
full bank information
private secrets

Logs should contain safe IDs and request IDs.

============================================================
115. BACKUP
===========

PostgreSQL:

regular backups
point-in-time recovery where supported

Object storage:

versioning
backup strategy

Test restores periodically.

A backup that has never been restored is not considered validated.

============================================================
116. DISASTER RECOVERY
======================

Document:

database restore
media restore
secret rotation
payment incident
security incident
system failure

Define:

RPO
RTO

before production launch.

============================================================
117. PRODUCTION ENVIRONMENT
===========================

Production architecture:

```
         INTERNET
            |
       Load Balancer
            |
      Reverse Proxy
            |
      FastAPI API
            |
   ┌────────┴────────┐
   |                 |
```

PostgreSQL         Object Storage
|
Backup/PITR

External:

Payment Provider
APNs
Email/SMS

============================================================
118. SCALABILITY ROADMAP
========================

PHASE 1:

Modular monolith
PostgreSQL
S3-compatible storage

PHASE 2:

Redis
background workers

PHASE 3:

advanced observability

PHASE 4:

search engine if required

PHASE 5:

event streaming if required

PHASE 6:

extract individual modules into services ONLY if measured
bottlenecks justify it.

============================================================
119. MVP DEVELOPMENT ORDER
==========================

DO NOT build randomly.

Build in this order:

PHASE 0
Repository
documentation
Docker
CI
environment

PHASE 1
Database foundation

PHASE 2
Authentication

PHASE 3
RBAC

PHASE 4
User profiles

PHASE 5
Help Requests

PHASE 6
Agent application

PHASE 7
Agent verification

PHASE 8
Campaigns

PHASE 9
Evidence

PHASE 10
Moderator workflow

PHASE 11
Public campaign discovery

PHASE 12
Donation

PHASE 13
Payment provider sandbox

PHASE 14
Payment verification

PHASE 15
Payout

PHASE 16
Assistance proof

PHASE 17
Reports/disputes

PHASE 18
Notifications

PHASE 19
iOS

PHASE 20
Admin

PHASE 21
E2E testing

PHASE 22
Security review

PHASE 23
Production deployment

============================================================
120. PHASE 0 IMPLEMENTATION
===========================

Create:

repository
README
.env.example
Docker Compose
FastAPI
Next.js
iOS project
PostgreSQL
CI

Verify:

API starts
Web starts
Postgres starts
iOS builds

============================================================
121. PHASE 1 DATABASE
=====================

Implement:

users
roles
permissions
user_roles
role_permissions

Then:

agent_profiles
agent_verifications

Then:

help_requests
help_request_agents
help_request_events

Then:

campaign_categories
campaigns
campaign_evidence
campaign_updates

Then:

donations
payments
payouts

Then:

reports
reviews
disputes

Then:

follows
notifications
media
audit_logs

Run migration tests.

============================================================
122. PHASE 2 AUTH
=================

Implement:

register
verification
login
refresh
logout
current user

Write tests before moving forward.

============================================================
123. PHASE 3 AUTHORIZATION
==========================

Implement reusable:

require_authenticated_user()
require_permission()
require_role()
require_agent_verified()
require_object_owner()
require_state()

Do not duplicate permission logic throughout routers.

============================================================
124. PHASE 4 HELP REQUEST
=========================

Implement:

create
list
detail
claim
investigation
events
status

Add state-machine tests.

============================================================
125. PHASE 5 AGENT
==================

Implement:

application
moderator review
verification
suspension
restriction
revoke boundary

Add permission matrix tests.

============================================================
126. PHASE 6 CAMPAIGN
=====================

Implement:

create from help request
draft
evidence
submit
review
approve
reject
activate
updates
funding
assistance
final review
successful

Add every state transition test.

============================================================
127. PHASE 7 DONATION
=====================

Implement:

amount
fee
payment initialization
provider adapter
webhook
server verification
confirmation
receipt

Test:

duplicate webhook
replay
race
invalid payment
forged success

============================================================
128. PHASE 8 MODERATION
=======================

Implement:

campaign queue
campaign review
agent review
report review
dispute review
finance review
audit

============================================================
129. PHASE 9 IOS
================

Connect iOS to actual API.

Do not create fake local-only workflows.

Implement:

Auth
Home
Explore
Campaign
Donation
Activity
Help Request
Profile
Notifications

============================================================
130. PHASE 10 WEB
=================

Implement:

public site
auth
user dashboard
agent portal
moderator portal
admin portal

All use same API.

============================================================
131. PHASE 11 TESTING
=====================

Run:

unit
integration
API
security
web E2E
iOS E2E

Then:

load
accessibility

============================================================
132. DEFINITION OF DONE
=======================

A feature is NOT DONE until:

[ ] requirement identified
[ ] backend implemented
[ ] database migration if needed
[ ] authorization implemented
[ ] state transitions implemented
[ ] API implemented
[ ] web UI implemented if applicable
[ ] iOS UI implemented if applicable
[ ] loading state
[ ] error state
[ ] empty state
[ ] accessibility
[ ] audit logging where required
[ ] unit tests
[ ] integration/API tests
[ ] security tests
[ ] documentation
[ ] CI passes

============================================================
133. PULL REQUEST CHECKLIST
===========================

Before merge:

[ ] No secrets committed
[ ] Tests pass
[ ] Lint passes
[ ] Type checks pass
[ ] Migration reviewed
[ ] Permission changes documented
[ ] State changes documented
[ ] API changes documented
[ ] Audit behavior verified
[ ] Security implications reviewed

============================================================
134. ACCEPTANCE CRITERIA
========================

MVP must demonstrate:

1. User registration
2. User verification
3. User login
4. Help Request submission
5. Agent application
6. Moderator Agent approval
7. Verified Agent claim
8. Investigation
9. Evidence
10. Campaign creation
11. Campaign submission
12. Moderator approval/rejection
13. Public discovery
14. Why Verified
15. Sandbox donation
16. Fee breakdown
17. Server payment verification
18. Receipt
19. Campaign funding update
20. Campaign update
21. Payout
22. Assistance delivery workflow
23. Proof submission
24. Final moderator review
25. SUCCESSFUL status
26. User reporting
27. Moderator report resolution
28. Audit logs

============================================================
135. CRITICAL CROSS-ENTITY RULES
================================

RULE:

help_requests.status -> CONVERTED_TO_CAMPAIGN

only after campaign row is successfully created.

RULE:

campaigns.status -> ACTIVE

only after APPROVED.

RULE:

campaigns.status -> TARGET_REACHED

only from confirmed donation total.

RULE:

donations.status -> CONFIRMED

only when linked payment is provider VERIFIED.

RULE:

campaigns.status -> ASSISTANCE_PENDING

only after payout completion where required.

RULE:

campaigns.status -> SUCCESSFUL

only after:

FINAL_REVIEW
+
Moderator approval
+
assistance/proof requirements

RULE:

AGENT campaign:create

requires:

role AGENT
+
verification_status VERIFIED

============================================================
136. NEVER IMPLEMENT THESE SHORTCUTS
====================================

DO NOT:

allow User to directly create campaign.

DO NOT:

trust frontend role.

DO NOT:

trust frontend payment status.

DO NOT:

update funding from client response.

DO NOT:

skip moderation.

DO NOT:

allow Agent before verification.

DO NOT:

expose sensitive documents publicly.

DO NOT:

delete financial history.

DO NOT:

use float for money.

DO NOT:

use boolean for complex lifecycle.

DO NOT:

create separate role-specific login systems.

DO NOT:

make Kafka mandatory.

DO NOT:

make Redis mandatory.

DO NOT:

make AI the final verifier.

DO NOT:

build microservices before actual need.

============================================================
137. FOLDER-TO-RESPONSIBILITY MAP
=================================

# backend/app/modules/auth

authentication

# backend/app/modules/users

user accounts

# backend/app/modules/agents

agent application/status

# backend/app/modules/help_requests

humanitarian intake

# backend/app/modules/campaigns

fundraising workflow

# backend/app/modules/verification

verification logic

# backend/app/modules/donations

donor transaction intent

# backend/app/modules/payments

provider integration + verification

# backend/app/modules/payouts

assistance money transfer

# backend/app/modules/reports

reports

# backend/app/modules/disputes

formal financial/assistance disputes

# backend/app/modules/notifications

notification delivery

# backend/app/modules/moderation

moderator workflows

# backend/app/modules/admin

administration

# backend/app/modules/media

media storage

# backend/app/modules/audit

audit trail

============================================================
138. AI CODING AGENT BEHAVIOR
=============================

When implementing this project:

1. Read this blueprint first.
2. Inspect existing repository.
3. Never overwrite working code blindly.
4. Implement incrementally.
5. Run tests after every major module.
6. Keep migrations synchronized with models.
7. Keep API schemas synchronized with clients.
8. Never invent a conflicting state transition.
9. Never weaken authorization to make tests pass.
10. Never remove security checks for convenience.
11. Prefer small commits.
12. Document architectural decisions.
13. When uncertain, choose the safest minimal implementation.
14. Do not introduce unnecessary infrastructure.

============================================================
139. CODE QUALITY
=================

Backend:

PEP8
type hints
Pydantic validation
SQLAlchemy best practices
service/repository separation

Web:

strict TypeScript
component reuse
server/client boundaries
accessible HTML
schema validation

iOS:

Swift concurrency
SwiftUI best practices
MVVM
dependency injection
protocol-based abstractions where useful
testable ViewModels

============================================================
140. COMMIT STRATEGY
====================

Examples:

feat(auth): implement registration
feat(auth): implement refresh tokens
feat(hr): implement help request lifecycle
feat(agent): implement verification workflow
feat(campaign): implement campaign state machine
feat(payment): implement sandbox payment adapter
feat(donation): implement donation confirmation
feat(mod): implement campaign review
feat(ios): implement campaign detail
feat(web): implement campaign discovery

============================================================
141. FINAL PROJECT ARCHITECTURE
===============================

```
                 PLUMIHOPE
                     |
    +----------------+----------------+
    |                |                |
   iOS              WEB          WEB PORTALS
SwiftUI          Next.js        Agent/Mod/Admin
    |                |                |
    +----------------+----------------+
                     |
                   HTTPS
                     |
             +-------▼-------+
             |    FastAPI    |
             | Modular Mono  |
             +-------+-------+
                     |
      +--------------+--------------+
      |              |              |
 PostgreSQL      Object Storage   External
                               Payment/APNs
      |
System of Record
```

============================================================
142. FINAL DATA FLOW
====================

USER
|
| help request
v
HELP REQUEST
|
| verified agent investigates
v
AGENT
|
| evidence
v
CAMPAIGN
|
| moderator review
v
APPROVED
|
| public
v
DONOR
|
| donation
v
PAYMENT
|
| provider verification
v
CONFIRMED DONATION
|
v
CAMPAIGN FUNDING
|
v
PAYOUT
|
v
ASSISTANCE
|
v
PROOF
|
v
FINAL REVIEW
|
v
SUCCESSFUL

============================================================
143. FINAL TRUST LOOP
=====================

IDENTITY
+
CASE
+
AGENT
+
EVIDENCE
+
MODERATOR
+
PAYMENT
+
PAYOUT
+
ASSISTANCE
+
PROOF
+
AUDIT

=

PLUMIHOPE ACCOUNTABILITY LOOP

============================================================
144. FINAL RELEASE GATE
=======================

DO NOT call MVP production-ready until:

[ ] All MUST functional requirements implemented
[ ] All MUST requirements have tests
[ ] State machines exhaustively tested
[ ] Authorization matrix tested
[ ] Security suite passes
[ ] Payment sandbox E2E passes
[ ] Donation idempotency verified
[ ] Payout safety verified
[ ] Audit logging verified
[ ] Sensitive data access verified
[ ] File upload security verified
[ ] Accessibility reviewed
[ ] Performance reviewed
[ ] Backup tested
[ ] Restore tested
[ ] Privacy policy completed
[ ] Refund policy completed
[ ] Security review completed
[ ] Production secrets configured
[ ] Monitoring configured
[ ] Incident response documented

============================================================
145. MASTER IMPLEMENTATION COMMAND
==================================

If this document is supplied to an AI coding agent, the agent should
execute the project in the following sequence:

STEP 1
Create repository structure.

STEP 2
Create documentation.

STEP 3
Create Docker development environment.

STEP 4
Create FastAPI application.

STEP 5
Create PostgreSQL connection.

STEP 6
Create SQLAlchemy models.

STEP 7
Create Alembic migrations.

STEP 8
Create seed system.

STEP 9
Implement authentication.

STEP 10
Implement RBAC.

STEP 11
Implement Help Requests.

STEP 12
Implement Agent workflow.

STEP 13
Implement Campaign workflow.

STEP 14
Implement Evidence.

STEP 15
Implement Moderation.

STEP 16
Implement Donation.

STEP 17
Implement Payment provider abstraction.

STEP 18
Implement sandbox provider.

STEP 19
Implement webhook verification.

STEP 20
Implement Payout.

STEP 21
Implement Reports and Disputes.

STEP 22
Implement Notifications.

STEP 23
Implement Audit.

STEP 24
Implement public Next.js site.

STEP 25
Implement User dashboard.

STEP 26
Implement Agent portal.

STEP 27
Implement Moderator dashboard.

STEP 28
Implement Admin dashboard.

STEP 29
Implement iOS application.

STEP 30
Connect iOS to production-quality API layer.

STEP 31
Implement local SwiftData caching.

STEP 32
Implement Keychain.

STEP 33
Write unit tests.

STEP 34
Write integration tests.

STEP 35
Write API tests.

STEP 36
Write security tests.

STEP 37
Write Web E2E.

STEP 38
Write iOS E2E.

STEP 39
Run load tests.

STEP 40
Run accessibility tests.

STEP 41
Run full CI.

STEP 42
Perform security review.

STEP 43
Prepare staging.

STEP 44
Run complete MVP journey.

STEP 45
Prepare production.

============================================================
146. FINAL INSTRUCTION
======================

This blueprint is the master implementation contract.

Do not treat PlumiHope as a generic crowdfunding application.

The defining architecture is:

HELP REQUEST
->
VERIFIED AGENT
->
EVIDENCE
->
CAMPAIGN
->
MODERATOR
->
APPROVAL
->
DONATION
->
SERVER-SIDE PAYMENT VERIFICATION
->
PAYOUT
->
ASSISTANCE
->
PROOF
->
FINAL REVIEW
->
SUCCESSFUL
->
AUDITABLE HISTORY

The system must always preserve the distinction between:

money raised

and

assistance delivered.

The system must always preserve the distinction between:

role

and

status.

The system must always preserve the distinction between:

verification

and

absolute certainty.

The system must always preserve the distinction between:

client information

and

server authority.

Build for trust first.

Build for correctness second.

Build for scale only when scale requires it.

============================================================
END OF PLUMIHOPE MASTER BLUEPRINT
=================================




====================================================================
147. FINAL ENHANCEMENTS FROM PRODUCT TRUST BLUEPRINT
====================================================================

These rules extend the implementation blueprint.
They do not replace any previous architecture, security rule,
state machine, permission rule, or business rule.

====================================================================
147.1 TRUST AND VERIFICATION SEMANTICS
====================================================================

RULE 1

"VERIFIED" must NEVER be presented as an absolute guarantee that
a humanitarian case is true.

Verification means that the platform performed the checks defined
by its verification policy.

RULE 2

The system must distinguish between:

evidence_uploaded
and
evidence_verified

These are different states and must not be represented by one field.

RULE 3

For every completed verification where appropriate, record:

- what was checked
- who performed the review
- when the review occurred
- the verification result
- relevant verification notes
- the verification policy/version used

RULE 4

Public campaign pages should expose a safe verification summary
without exposing restricted or highly-sensitive information.

Example:

WHY VERIFIED?

- Agent identity reviewed
- Field investigation completed
- Supporting documentation reviewed
- Target amount reviewed
- Required evidence submitted
- Moderator approval completed

Last reviewed:
<date>

RULE 5

Verification information must communicate evidence and review scope,
not imply certainty beyond what the platform actually established.

====================================================================
147.2 EVIDENCE MODEL
====================================================================

The system must support clear evidence lifecycle semantics.

At minimum distinguish:

UPLOADED
UNDER_REVIEW
VERIFIED
REJECTED
RESTRICTED
EXPIRED
SUPERSEDED

Where appropriate, evidence should also record:

- evidence type
- uploader
- related case/campaign
- created_at
- reviewed_at
- reviewer
- visibility classification
- verification status
- retention metadata

Sensitive evidence must remain protected by access control.

Examples of restricted/highly-sensitive evidence include:

- national ID
- medical reports
- prescriptions
- private address
- private phone number
- bank/payout information
- sensitive family information
- internal moderator notes

Never expose such information through ordinary public API responses.

====================================================================
147.3 DONOR DISCOVERY REQUIREMENTS
====================================================================

Campaign discovery should support structured filtering and search.

Supported discovery dimensions should include where applicable:

- keyword
- category
- subcategory
- condition
- location
- age group
- urgency
- target amount
- remaining amount
- funding progress
- campaign status
- Agent
- Agent verification status
- recently updated
- campaigns from followed Agents

Example natural-language intent:

"I want to help an elderly person with cancer."

This may map to:

category = MEDICAL
condition = CANCER
age_group = ELDERLY

The search implementation should remain simple initially.
Do not introduce a search engine solely to support MVP discovery.

====================================================================
147.4 AGENT FOLLOWING
====================================================================

Users may follow and unfollow verified Agents.

The system should support:

- follow Agent
- unfollow Agent
- list followed Agents
- view Agent campaigns
- receive eligible new-campaign notifications
- receive eligible Agent update notifications

Following an Agent is an application relationship and must not depend
on external social-media platforms.

A user must not receive notifications for an Agent relationship that
does not exist.

Notification preferences and opt-out rules must be respected.

====================================================================
147.5 FINANCIAL TRANSPARENCY
====================================================================

Before donation confirmation, the donor should be shown a clear
financial breakdown.

Example:

Donation:
৳1,000.00

Payment/Processing Fee:
৳XX.XX

Platform Fee:
৳XX.XX

Agent/Service Fee:
৳XX.XX

Recipient / Campaign Amount:
৳XXX.XX

The exact fee categories and percentages must be configurable through
an explicit policy/configuration mechanism rather than hidden
hard-coded deductions.

RULE:

No hidden deduction.

The donor-facing amount must agree with the server-side financial
calculation.

The client must never calculate the authoritative financial result.

====================================================================
147.6 OVERFUNDING POLICY
====================================================================

The platform must explicitly define what happens when confirmed
donations exceed the campaign target.

Example:

Target = ৳500,000
Confirmed raised = ৳503,000

The system must use an explicit policy.

Possible policy options include:

- stop accepting additional donations
- allow settlement already in progress
- refund excess
- redirect excess only with explicit donor consent
- allocate excess under a published policy

Do not invent a silent overfunding behavior.

Do not automatically redirect donor money without an explicit
approved policy.

The chosen production policy must be documented before enabling
real public fundraising.

====================================================================
147.7 MONEY RAISED VS ASSISTANCE DELIVERED
====================================================================

The platform must always preserve the distinction between:

MONEY RAISED

and

ASSISTANCE DELIVERED

A campaign must never be marked SUCCESSFUL merely because the target
amount was reached.

The preferred lifecycle remains:

TARGET_REACHED
    ->
PAYOUT_PENDING
    ->
PAYOUT_COMPLETED
    ->
ASSISTANCE_DELIVERED
    ->
PROOF_SUBMITTED
    ->
FINAL_REVIEW
    ->
SUCCESSFUL

Financial totals and assistance outcomes are separate concepts.

====================================================================
147.8 LEGAL AND COMPLIANCE BOUNDARY
====================================================================

The implementation must NOT invent legal or regulatory requirements.

Country-specific requirements must be verified before production use.

The platform may require review of:

- payment regulations
- financial reporting
- consumer protection
- donation/crowdfunding rules
- data protection
- medical information privacy
- identity/KYC requirements
- tax implications
- platform liability
- terms of service
- privacy policy
- refund policy
- dispute policy
- Agent compensation
- charitable organization requirements

Architecture and code should avoid embedding unverified legal
assumptions as permanent technical rules.

Where practical, policy-driven behavior should be represented through
configuration or explicit business-policy modules.

Production fundraising must not be enabled until the applicable legal,
financial, privacy, and operational requirements have been reviewed
and approved.

====================================================================
147.9 TRUST QUESTIONS
====================================================================

The product should consistently help a donor answer:

WHO?

Who is the Agent?

WHY?

Why does this person need help?

EVIDENCE?

What evidence supports the case?

WHO REVIEWED?

Who reviewed and approved the campaign?

WHERE DID THE MONEY GO?

What happened to the donated funds?

WHAT HAPPENED IN THE END?

Was assistance actually delivered?

These questions should influence public campaign information,
verification UX, financial transparency, campaign updates, and
accountability reporting.

====================================================================
147.10 SOCIAL MEDIA INTEGRATION PRINCIPLE
====================================================================

Facebook, YouTube, TikTok, and similar platforms may be treated as
distribution channels rather than sources of truth.

External social content may be linked as supporting/public media where
appropriate.

External follower counts must NOT determine Agent verification.

Follower count is only one possible signal among many.

Trust should be based primarily on:

- identity verification
- campaign history
- evidence quality
- update consistency
- outcome history
- complaint history
- donor feedback
- platform verification
- moderation history

====================================================================
147.11 POLICY VERSIONING
====================================================================

Important trust, verification, financial, refund, dispute, and
moderation policies should be versioned.

Where a policy affects a financial or verification decision, preserve
the policy version associated with that decision.

Historical records must remain understandable even after policy
changes.

Do not silently reinterpret historical financial or verification
records using a newer policy.

====================================================================
147.12 IMPLEMENTATION PRIORITY
====================================================================

These enhancements must be integrated into the existing architecture
without weakening the existing rules.

Priority:

1. Trust and verification semantics
2. Evidence lifecycle and privacy
3. Financial transparency
4. Overfunding policy
5. Legal/compliance boundary
6. Discovery and Agent following
7. Policy versioning

MVP implementation must remain a modular monolith.

Do not introduce microservices, Kafka, Redis, or a dedicated search
engine solely because these enhancements exist.

Use the simplest production-quality implementation consistent with
the existing PlumiHope architecture.

====================================================================
147.13 FINAL AI CODING AGENT RULE
====================================================================

When implementing any feature related to trust, verification,
evidence, money, payouts, disputes, privacy, or moderation:

- do not infer missing policy silently
- do not weaken existing security controls
- do not bypass state machines
- do not trust client-provided authoritative values
- do not expose sensitive information for convenience
- do not mark financial or humanitarian outcomes complete early
- ask for an explicit implementation decision only when the missing
  decision materially affects correctness, security, financial safety,
  privacy, or architecture

Otherwise choose the safest minimal implementation consistent with
this blueprint.

====================================================================
END OF FINAL ENHANCEMENTS
====================================================================