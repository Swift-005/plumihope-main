====================================================================
                         PLUMIHOPE
          TRUSTED HUMANITARIAN DONATION PLATFORM
====================================================================

MASTER UI/UX + ASCII WIREFRAME + USER FLOW SPECIFICATION
VERSION: 1.0
STATUS: PRE-DEVELOPMENT / DESIGN SOURCE OF TRUTH
DATE: SEPTEMBER 2026

====================================================================
                    IMPORTANT IMPLEMENTATION NOTE
====================================================================

THIS DOCUMENT IS BOTH:

1. UI/UX DESIGN SPECIFICATION
2. ASCII WIREFRAME SPECIFICATION
3. USER FLOW SPECIFICATION
4. SCREEN INVENTORY
5. NAVIGATION SPECIFICATION
6. COMPONENT SPECIFICATION
7. DESIGN-SYSTEM SPECIFICATION
8. IMPLEMENTATION PROMPT FOR AI CODING AGENTS

The implementation must NOT invent a different product model.

The uploaded PlumiHope SRS, Master Blueprint, Role & Permission Matrix,
State Machine Specification, and Test Strategy are the authoritative
product/engineering references.

This document translates those requirements into a concrete visual
and interaction architecture.

====================================================================
                         PRODUCT NORTH STAR
====================================================================

The product must continuously answer:

"How confidently can a donor support a real case and later understand
what happened?"

The UX must therefore prioritize:

    TRUST
    CLARITY
    VERIFICATION
    ACCOUNTABILITY
    HUMAN DIGNITY
    TRANSPARENCY
    ACCESSIBILITY
    LOW COGNITIVE LOAD

Never optimize only for:

    "Donate Now"

Optimize for:

    "Understand → Trust → Decide → Donate → Follow Outcome"


====================================================================
                         PRODUCT ECOSYSTEM
====================================================================

PLUMIHOPE
|
+---------------------------------------------------------------+
|                                                               |
|                    PUBLIC / DONOR EXPERIENCE                  |
|                                                               |
|  iOS App                                                      |
|  Public Web                                                   |
|                                                               |
+---------------------------------------------------------------+
|
+---------------------------------------------------------------+
|                                                               |
|                    OPERATIONS EXPERIENCE                      |
|                                                               |
|  Agent Portal                                                 |
|  Moderator Dashboard                                          |
|  Admin Dashboard                                               |
|                                                               |
+---------------------------------------------------------------+
|
+---------------------------------------------------------------+
|                                                               |
|                       BACKEND                                 |
|                                                               |
|  FastAPI                                                      |
|  PostgreSQL                                                    |
|  Object Storage                                                |
|  Payment Provider                                               |
|  APNs / Email / SMS                                             |
|                                                               |
+---------------------------------------------------------------+


====================================================================
                         CORE HUMANITARIAN LOOP
====================================================================

                         DISCOVER
                            |
                            v
                         REQUEST
                            |
                            v
                       INVESTIGATE
                            |
                            v
                          VERIFY
                            |
                            v
                       FUNDRAISE
                            |
                            v
                         DONATE
                            |
                            v
                         ASSIST
                            |
                            v
                       DOCUMENT
                            |
                            v
                         REVIEW
                            |
                            v
                         OUTCOME
                            |
                            v
                       REPUTATION
                            |
                            v
                         DISCOVERY
                            |
                            +--------------------->


====================================================================
                        DESIGN PHILOSOPHY
====================================================================

The visual language should feel:

    HUMAN
    TRUSTWORTHY
    MODERN
    CALM
    PREMIUM
    PROFESSIONAL
    HOPEFUL

Avoid:

    cheap charity aesthetics
    excessive gradients
    excessive emotional manipulation
    aggressive donation popups
    clutter
    gamification of suffering
    excessive red
    giant "DONATE!!!" buttons everywhere
    social-media-like vanity metrics

The platform should look closer to:

    premium fintech
    modern civic technology
    trustworthy healthcare
    humanitarian operations software

combined with:

    warmth
    humanity
    hope


====================================================================
                    GLOBAL DESIGN SYSTEM
====================================================================

COLOR SYSTEM
------------

Primary:

    Hope Green
    Used for:
        primary actions
        verified states
        success
        progress

Secondary:

    Deep Navy
    Used for:
        navigation
        headings
        trust information
        professional dashboard UI

Background:

    Soft Warm White

Surface:

    White

Neutral:

    Slate / Gray family

Warning:

    Amber

Danger:

    Red

Info:

    Blue

Do NOT use color as the only indication of status.

Every important status must include:

    icon + text + visual state


TYPOGRAPHY
----------

Display:

    Large / bold / calm

Heading:

    Semibold

Body:

    Regular

Metadata:

    Small / medium contrast

Numbers:

    Strong emphasis

Currency:

    Clear numeric typography

Example:

    ৳ 125,000
    raised

Never:

    ৳125000

Prefer:

    ৳125,000


CORNER RADIUS
-------------

Cards:

    16–20 px

Buttons:

    12–14 px

Inputs:

    12–14 px

Sheets:

    24 px top corners


SPACING
-------

Use a consistent 4/8 point spacing system.

Common:

    4
    8
    12
    16
    20
    24
    32
    40
    48
    64


SHADOWS
-------

Use subtle shadows.

Cards should primarily rely on:

    spacing
    borders
    surface contrast

rather than heavy shadows.


ICONS
-----

Use a consistent icon family.

Icons should never be decorative when they represent:

    verification
    warning
    payment
    privacy
    security
    state
    evidence


====================================================================
                     TRUST VISUAL LANGUAGE
====================================================================

The most important visual component is:

                    VERIFIED

But "Verified" must NOT simply be a green check.

Instead:

+----------------------------------------------------------+
|  ✓  VERIFIED CASE                                        |
|                                                          |
|  Identity checked                                        |
|  Supporting evidence reviewed                            |
|  Case investigated by verified Agent                     |
|  Campaign reviewed by PlumiHope Moderator                |
|                                                          |
|                 [ Why verified? ]                         |
+----------------------------------------------------------+

The user can expand:

+----------------------------------------------------------+
| WHY THIS CAMPAIGN IS VERIFIED                             |
|                                                          |
| ✓ Case submitted                                          |
| ✓ Agent identity verified                                 |
| ✓ Field investigation completed                           |
| ✓ Supporting evidence reviewed                            |
| ✓ Campaign reviewed by Moderator                          |
|                                                          |
| Some sensitive evidence is protected for privacy.        |
+----------------------------------------------------------+


====================================================================
                         STATUS DESIGN
====================================================================

Do NOT design status as arbitrary badges.

Use:

    state
    description
    next action
    timestamp

Example:

+----------------------------------------------------------+
| ● ACTIVE                                                   |
| Campaign is currently accepting donations                 |
|                                                          |
| 14 days remaining                                         |
+----------------------------------------------------------+


Example:

+----------------------------------------------------------+
| ✓ ASSISTANCE DELIVERED                                    |
| Agent confirmed that assistance reached the recipient.    |
|                                                          |
| Final review pending                                      |
+----------------------------------------------------------+


====================================================================
                         GLOBAL WEB HEADER
====================================================================

+--------------------------------------------------------------------------------+
|  PLUMIHOPE       Discover   Causes   Agents   How It Works      [Search]       |
|                                                        [Sign In] [Get Started] |
+--------------------------------------------------------------------------------+

Desktop authenticated:

+--------------------------------------------------------------------------------+
|  PLUMIHOPE     Discover   Following   My Donations     Search       🔔  Avatar|
+--------------------------------------------------------------------------------+


====================================================================
                       GLOBAL WEB FOOTER
====================================================================

+--------------------------------------------------------------------------------+
| PLUMIHOPE                                                                       |
| Trusted humanitarian assistance platform                                      |
|                                                                                 |
| Discover      About       How it works      Safety                              |
| Help          Privacy     Terms             Contact                             |
|                                                                                 |
| © PlumiHope                                                                     |
+--------------------------------------------------------------------------------+


====================================================================
                    PUBLIC WEBSITE SCREEN MAP
====================================================================

WEB PUBLIC
|
+-- Landing / Home
|
+-- Discover Campaigns
|   |
|   +-- Search
|   +-- Filters
|   +-- Category
|   +-- Location
|   +-- Urgency
|   +-- Status
|
+-- Campaign Detail
|   |
|   +-- Overview
|   +-- Why Verified
|   +-- Agent
|   +-- Updates
|   +-- Accountability
|   +-- Donation
|   +-- Report
|
+-- Agent Directory
|   |
|   +-- Agent Profile
|   +-- Campaign History
|
+-- About PlumiHope
|
+-- How PlumiHope Works
|
+-- Trust & Safety
|
+-- Help
|
+-- Authentication
|   |
|   +-- Sign Up
|   +-- Sign In
|   +-- Verify
|   +-- Forgot Password
|   +-- Reset Password
|
+-- Authenticated Donor
    |
    +-- Home
    +-- Following
    +-- Saved
    +-- Donations
    +-- Help Requests
    +-- Notifications
    +-- Profile
    +-- Agent Application


====================================================================
                    WEB — LANDING PAGE
====================================================================

SCREEN: W01_HOME

+--------------------------------------------------------------------------------+
| PLUMIHOPE                                                                       |
|                                                                                 |
| Discover trusted humanitarian cases                                             |
|                                                                                 |
| Support real people.                                                           |
| Understand where your donation goes.                                           |
| Follow what happens next.                                                       |
|                                                                                 |
| [ Explore verified campaigns ]    [ Request help ]                             |
|                                                                                 |
|                    ┌──────────────────────────┐                                 |
|                    │ Search a cause...        │                                 |
|                    └──────────────────────────┘                                 |
+--------------------------------------------------------------------------------+

                     ↓

+--------------------------------------------------------------------------------+
| TRUSTED CAMPAIGNS                                                               |
|                                                                                 |
| Help a child receive urgent medical treatment                                  |
| [IMAGE]                                                                        |
|                                                                                 |
| ✓ Verified Case                                                                 |
| ৳245,000 raised of ৳300,000                                                    |
| ████████████████░░░░ 82%                                                       |
|                                                                                 |
| [ View campaign ]                                                               |
+--------------------------------------------------------------------------------+

                     ↓

+--------------------------------------------------------------------------------+
| HOW PLUMIHOPE WORKS                                                            |
|                                                                                 |
|  01                  02                  03                  04                 |
| REQUEST       →      INVESTIGATE   →      VERIFY       →      ASSIST            |
|                                                                                 |
| A case begins       A verified Agent     A Moderator       Donors support      |
| with a help         investigates        reviews evidence  the campaign        |
| request.            locally.             before publishing.                    |
+--------------------------------------------------------------------------------+

                     ↓

+--------------------------------------------------------------------------------+
| WHY TRUST PLUMIHOPE?                                                           |
|                                                                                 |
| ✓ Verified Agents                                                              |
| ✓ Evidence-backed campaigns                                                   |
| ✓ Moderator review                                                             |
| ✓ Transparent campaign timeline                                                |
| ✓ Donation receipts                                                            |
| ✓ Assistance outcome tracking                                                  |
+--------------------------------------------------------------------------------+

                     ↓

+--------------------------------------------------------------------------------+
| READY TO HELP?                                                                 |
|                                                                                 |
| [ Explore campaigns ]                      [ Learn how verification works ]    |
+--------------------------------------------------------------------------------+


====================================================================
                     WEB — DISCOVER PAGE
====================================================================

SCREEN: W02_DISCOVER

+--------------------------------------------------------------------------------+
| Discover                                                                         |
|                                                                                 |
| ┌───────────────────────────────────────────────────────────────────────────┐  |
| │ 🔍 Search campaigns, causes, locations...                                 │  |
| └───────────────────────────────────────────────────────────────────────────┘  |
|                                                                                 |
| Categories:                                                                    |
| [All] [Medical] [Education] [Emergency] [Livelihood] [Disaster] [Food]       |
| [Housing] [Disability] [Community]                                             |
|                                                                                 |
| Filters ▾          Sort: Recommended ▾                                        |
+--------------------------------------------------------------------------------+

+--------------------------+  +--------------------------+
| [IMAGE]                  |  | [IMAGE]                  |
| ✓ VERIFIED CASE          |  | ✓ VERIFIED CASE          |
|                          |  |                          |
| Cancer treatment         |  | School education        |
| for Rahim                |  | support                  |
|                          |  |                          |
| ৳245K / ৳300K            |  | ৳80K / ৳120K            |
| ████████████░░           |  | █████████░░░             |
|                          |  |                          |
| 14 days left             |  | 9 days left              |
|                          |  |                          |
| [View campaign]          |  | [View campaign]          |
+--------------------------+  +--------------------------+


FILTER SHEET

+---------------------------------------+
| Filters                               |
|                                       |
| Cause                                 |
| ○ Medical                             |
| ○ Education                           |
| ○ Emergency                           |
|                                       |
| Location                              |
| [ Select location ]                   |
|                                       |
| Urgency                               |
| ○ Urgent                              |
| ○ Normal                              |
|                                       |
| Campaign status                       |
| □ Active                              |
| □ Target reached                      |
|                                       |
| [ Reset ]              [ Apply ]      |
+---------------------------------------+


====================================================================
                   WEB — CAMPAIGN DETAIL
====================================================================

SCREEN: W03_CAMPAIGN_DETAIL

+--------------------------------------------------------------------------------+
| ← Back                                                                         |
+--------------------------------------------------------------------------------+

+---------------------------------------+----------------------------------------+
|                                       |                                        |
|            CAMPAIGN IMAGE             |  ✓ VERIFIED CASE                      |
|                                       |                                        |
|                                       |  Urgent cancer treatment               |
|                                       |                                        |
|                                       |  Help Maria receive treatment          |
|                                       |                                        |
+---------------------------------------+----------------------------------------+

+--------------------------------------------------------------------------------+
| ৳245,000 raised                                                               |
| of ৳300,000                                                                   |
|                                                                                 |
| █████████████████░░░░░ 82%                                                    |
|                                                                                 |
| 1,240 donors                    14 days left                                   |
+--------------------------------------------------------------------------------+

+---------------------------------------+----------------------------------------+
| ABOUT THE CASE                        | DONATE                                 |
|                                       |                                        |
| Maria is receiving treatment...       | Amount                                 |
|                                       |                                        |
| Category: Medical                     | [ ৳500 ] [ ৳1,000 ] [ ৳2,000 ]       |
| Location: Dhaka                       |                                        |
|                                       | [ ৳________ ]                          |
|                                       |                                        |
| [ Read full story ]                   | [ Continue to donate ]                 |
+---------------------------------------+----------------------------------------+

+--------------------------------------------------------------------------------+
| WHY VERIFIED?                                                        [Open]  |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| ✓ Agent identity verified                                                    |
| ✓ Field investigation completed                                              |
| ✓ Evidence reviewed                                                          |
| ✓ Campaign reviewed by Moderator                                             |
|                                                                                 |
| [ View verification details ]                                                 |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| THE ACCOUNTABILITY TIMELINE                                                    |
|                                                                                 |
| ● Sep 07   Campaign approved                                                   |
| │                                                                               |
| ● Sep 05   Evidence reviewed                                                   |
| │                                                                               |
| ● Sep 03   Field investigation completed                                       |
| │                                                                               |
| ● Sep 01   Help request submitted                                              |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| ABOUT THE AGENT                                                                |
|                                                                                 |
| [AVATAR]  Rahim Humanitarian Network    ✓ Verified Agent                      |
|                                                                                 |
| 42 completed campaigns    97% update completion    4.9 rating                  |
|                                                                                 |
| [ View agent profile ]        [ Follow ]                                       |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| CAMPAIGN UPDATES                                                               |
|                                                                                 |
| Sep 08                                                                        |
| "Treatment started today..."                                                  |
|                                                                                 |
| [Photo] [Photo]                                                               |
|                                                                                 |
| [ View all updates ]                                                          |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| DONATION TRANSPARENCY                                                          |
|                                                                                 |
| Your donation: ৳1,000                                                         |
| Payment fee: ...                                                               |
| Platform fee: ...                                                              |
| Net assistance amount: ...                                                     |
|                                                                                 |
| [ View fee details ]                                                           |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| SAFETY                                                                          |
|                                                                                 |
| Something doesn't look right?                                                  |
|                                                                                 |
| [ Report campaign ]                                                            |
+--------------------------------------------------------------------------------+


====================================================================
                 WEB — "WHY VERIFIED?" DETAIL
====================================================================

SCREEN: W04_WHY_VERIFIED

+---------------------------------------------------------------+
| ← Campaign                                                    |
|                                                               |
| Why is this campaign verified?                                |
|                                                               |
| PlumiHope uses a multi-step verification workflow.            |
+---------------------------------------------------------------+

+---------------------------------------------------------------+
| ✓ CASE                                                        |
| Help request exists and was investigated.                     |
|                                                               |
| ✓ AGENT                                                       |
| The campaign was created by a verified Agent.                  |
|                                                               |
| ✓ EVIDENCE                                                    |
| Supporting evidence was submitted and reviewed.               |
|                                                               |
| ✓ MODERATOR                                                   |
| A Moderator reviewed the campaign before publication.         |
|                                                               |
| ✓ ACCOUNTABILITY                                              |
| Updates and assistance outcome are tracked.                   |
+---------------------------------------------------------------+

[ Close ]


====================================================================
                     WEB — AGENT PROFILE
====================================================================

SCREEN: W05_AGENT_PROFILE

+--------------------------------------------------------------------------------+
| ← Agents                                                                       |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| [AVATAR]                                                                       |
|                                                                                 |
| RAHIM HUMANITARIAN NETWORK                                                     |
| ✓ VERIFIED AGENT                                                               |
|                                                                                 |
| 42 Completed       4 Active       18K Followers                                |
| ৳61.4L Raised                                                                  |
| 97% Update Completion                                                          |
| 4.9 ★ Donor Rating                                                             |
|                                                                                 |
| [ Follow ]                                                                      |
+--------------------------------------------------------------------------------+

Tabs:

[Active Campaigns] [Completed] [Updates] [About]

+--------------------------------------------------------------------------------+
| ACTIVE CAMPAIGNS                                                               |
|                                                                                 |
| [Campaign Card]                                                               |
| [Campaign Card]                                                               |
+--------------------------------------------------------------------------------+


====================================================================
                     WEB — SIGN UP
====================================================================

SCREEN: W06_SIGN_UP

+--------------------------------------------------------------+
|                         PLUMIHOPE                             |
|                                                              |
| Create your account                                         |
|                                                              |
| Full name                                                    |
| [________________________]                                  |
|                                                              |
| Email or phone                                               |
| [________________________]                                  |
|                                                              |
| Password                                                     |
| [________________________]                                  |
|                                                              |
| □ I agree to Terms and Privacy Policy                        |
|                                                              |
| [ Create account ]                                           |
|                                                              |
| Already have an account? [ Sign in ]                         |
+--------------------------------------------------------------+


====================================================================
                     WEB — SIGN IN
====================================================================

+--------------------------------------------------------------+
| PLUMIHOPE                                                    |
|                                                              |
| Welcome back                                                 |
|                                                              |
| Email / Phone                                                |
| [________________________]                                  |
|                                                              |
| Password                                                     |
| [________________________]                                  |
|                                                              |
| [ Sign in ]                                                  |
|                                                              |
| Forgot password?                                             |
|                                                              |
| Don't have an account? [ Create account ]                    |
+--------------------------------------------------------------+


====================================================================
                  WEB — VERIFICATION
====================================================================

+--------------------------------------------------------------+
| Verify your account                                          |
|                                                              |
| We sent a verification code to:                              |
| r••••@example.com                                            |
|                                                              |
| [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]                         |
|                                                              |
| Resend code in 00:42                                         |
|                                                              |
| [ Verify ]                                                   |
+--------------------------------------------------------------+


====================================================================
                 AUTHENTICATED DONOR WEB APP
====================================================================

NAVIGATION

+-------------------------------------------------------------+
| Home                                                         |
| Discover                                                     |
| Following                                                    |
| Saved                                                        |
| My Donations                                                 |
| Help Requests                                                |
| Notifications                                                |
| Profile                                                      |
|                                                             |
| --------------------------------                            |
| Become an Agent                                              |
| Help & Safety                                                |
| Sign out                                                     |
+-------------------------------------------------------------+


====================================================================
                 DONOR — DASHBOARD / HOME
====================================================================

SCREEN: W10_DONOR_HOME

+--------------------------------------------------------------------------------+
| Good morning, Rafi                                                            |
|                                                                                 |
| Find a cause you can confidently support.                                     |
|                                                                                 |
| [ 🔍 Search campaigns... ]                                                     |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| RECOMMENDED                                                                     |
|                                                                                 |
| [Campaign Card] [Campaign Card] [Campaign Card]                               |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| CONTINUE SUPPORTING                                                             |
|                                                                                 |
| Your saved campaigns                                                           |
| [Campaign Card]                                                                |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| FOLLOWING                                                                       |
|                                                                                 |
| New update from an Agent you follow                                            |
| [ Update Card ]                                                                |
+--------------------------------------------------------------------------------+


====================================================================
                    DONOR — SAVED
====================================================================

SCREEN: W11_SAVED

+---------------------------------------------------------------+
| Saved campaigns                                               |
|                                                               |
| [All] [Active] [Completed]                                   |
|                                                               |
| +---------------------------------------------------------+ |
| | [IMG]  Medical treatment                                | |
| | ✓ Verified                                               | |
| | ৳120K / ৳200K                                           | |
| |                                     ♡ Saved             | |
| +---------------------------------------------------------+ |
+---------------------------------------------------------------+


====================================================================
                  DONOR — FOLLOWING
====================================================================

SCREEN: W12_FOLLOWING

+---------------------------------------------------------------+
| Following                                                     |
|                                                               |
| Agents                                                        |
|                                                               |
| +---------------------------------------------------------+ |
| | [Avatar] Rahim Humanitarian Network ✓                   | |
| | 42 campaigns                                            | |
| |                                             [Following] | |
| +---------------------------------------------------------+ |
|                                                               |
| New campaigns and updates from followed Agents appear here.  |
+---------------------------------------------------------------+


====================================================================
                  DONOR — DONATION HISTORY
====================================================================

SCREEN: W13_DONATIONS

+--------------------------------------------------------------------------------+
| My donations                                                                  |
|                                                                                 |
| Total donated                                                                  |
| ৳18,500                                                                       |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Sep 08                                                                        |
| Cancer treatment                                                              |
| ৳1,000                                                                        |
| ✓ Confirmed                                                                    |
| [ View receipt ]                                                               |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Aug 24                                                                        |
| Education support                                                             |
| ৳2,000                                                                        |
| ✓ Confirmed                                                                    |
| [ View receipt ]                                                               |
+--------------------------------------------------------------------------------+


====================================================================
                  DONOR — RECEIPT
====================================================================

SCREEN: W14_RECEIPT

+---------------------------------------------------------------+
| Donation receipt                                              |
|                                                               |
| PLUMIHOPE                                                     |
|                                                               |
| Donation ID                                                   |
| PH-DON-000184                                                 |
|                                                               |
| Campaign                                                      |
| Maria's Treatment                                            |
|                                                               |
| Amount                                                        |
| ৳1,000                                                        |
|                                                               |
| Payment status                                                |
| ✓ CONFIRMED                                                   |
|                                                               |
| Date                                                          |
| September 8, 2026                                             |
|                                                               |
| [ Download receipt ]                                          |
| [ Share ]                                                     |
+---------------------------------------------------------------+


====================================================================
                  DONOR — HELP REQUEST
====================================================================

SCREEN: W15_HELP_REQUESTS

+--------------------------------------------------------------------------------+
| My Help Requests                                                               |
|                                                                                 |
| [ + Request help ]                                                             |
|                                                                                 |
| ACTIVE                                                                         |
|                                                                                 |
| Medical treatment                                                              |
| Dhaka                                                                          |
| ● INVESTIGATING                                                                |
|                                                                                 |
| Submitted Sep 07                                                               |
|                                                                                 |
| [ View request ]                                                               |
+--------------------------------------------------------------------------------+


====================================================================
                DONOR — CREATE HELP REQUEST
====================================================================

SCREEN: W16_CREATE_HELP_REQUEST

+---------------------------------------------------------------+
| Request help                                                  |
|                                                               |
| What kind of help is needed?                                  |
|                                                               |
| [ Medical              ▾ ]                                    |
|                                                               |
| Subcategory                                                 |
| [ Treatment            ▾ ]                                    |
|                                                               |
| Describe the situation                                       |
| [                                                           ] |
| [                                                           ] |
| [                                                           ] |
|                                                               |
| Location                                                      |
| [ Select location ]                                          |
|                                                               |
| Contact information                                          |
| [____________________]                                       |
|                                                               |
| [ Continue ]                                                 |
+---------------------------------------------------------------+

NOTE:

Submitting a Help Request does NOT create a fundraising campaign.

The request enters the Help Request workflow.


====================================================================
                HELP REQUEST — STATUS DETAIL
====================================================================

+---------------------------------------------------------------+
| Help Request #HR-1828                                         |
|                                                               |
| Medical / Treatment                                           |
|                                                               |
| ● INVESTIGATING                                               |
|                                                               |
| A verified Agent is currently investigating this case.        |
|                                                               |
| TIMELINE                                                      |
|                                                               |
| ● Submitted                                                   |
| │                                                             |
| ● Available to eligible Agents                                |
| │                                                             |
| ● Agent claimed                                               |
| │                                                             |
| ● Investigation started                                       |
|                                                               |
| [ View timeline ]                                             |
+---------------------------------------------------------------+


====================================================================
                  DONOR — NOTIFICATIONS
====================================================================

SCREEN: W17_NOTIFICATIONS

+---------------------------------------------------------------+
| Notifications                                                 |
|                                                               |
| TODAY                                                         |
|                                                               |
| ✓ New update                                                  |
| Rahim posted an update to a campaign you follow.              |
| 10 min ago                                                    |
|                                                               |
| 💰 Donation confirmed                                         |
| Your donation of ৳1,000 was confirmed.                        |
| 2 hours ago                                                   |
|                                                               |
| YESTERDAY                                                     |
|                                                               |
| ✓ Campaign completed                                          |
| Assistance has been delivered.                                |
+---------------------------------------------------------------+


====================================================================
                    DONOR — PROFILE
====================================================================

SCREEN: W18_PROFILE

+---------------------------------------------------------------+
| Profile                                                       |
|                                                               |
| [Avatar]                                                      |
|                                                               |
| Rafi                                                         |
| r••••@example.com                                             |
|                                                               |
| [ Edit profile ]                                              |
|                                                               |
| ACCOUNT                                                       |
|                                                               |
| Saved campaigns                                               |
| Donation history                                              |
| Following                                                     |
| Help requests                                                 |
|                                                               |
| PLATFORM                                                      |
|                                                               |
| Notifications                                                 |
| Privacy                                                       |
| Security                                                      |
|                                                               |
| [ Apply to become an Agent ]                                  |
|                                                               |
| [ Sign out ]                                                  |
+---------------------------------------------------------------+


====================================================================
                   AGENT APPLICATION FLOW
====================================================================

USER
 |
 | Tap "Become an Agent"
 v
AGENT INTRODUCTION
 |
 v
APPLICATION
 |
 v
IDENTITY / KYC
 |
 v
SUBMITTED
 |
 v
UNDER REVIEW
 |
 +---------------------------+
 |                           |
 v                           v
MORE INFORMATION          APPROVED
 |                           |
 v                           v
UPDATE APPLICATION        VERIFIED
                             |
                             v
                      AGENT DASHBOARD


====================================================================
               AGENT — INTRODUCTION SCREEN
====================================================================

SCREEN: A01_AGENT_INTRO

+---------------------------------------------------------------+
| Become a PlumiHope Agent                                      |
|                                                               |
| Help investigate real humanitarian cases.                     |
|                                                               |
| As a verified Agent, you can:                                 |
|                                                               |
| ✓ Investigate help requests                                  |
| ✓ Collect evidence                                           |
| ✓ Create campaigns                                           |
| ✓ Publish updates                                            |
| ✓ Document assistance                                        |
|                                                               |
| Verification is required before campaign creation.            |
|                                                               |
| [ Start application ]                                        |
+---------------------------------------------------------------+


====================================================================
                AGENT — APPLICATION
====================================================================

SCREEN: A02_AGENT_APPLICATION

+--------------------------------------------------------------------------------+
| Agent Application                                               2 of 4          |
+--------------------------------------------------------------------------------+

Personal information

Full name
[____________________________]

Phone
[____________________________]

Email
[____________________________]

Location
[____________________________]

Humanitarian experience

[                                                                      ]

Social / public profile

Facebook
[____________________________]

YouTube
[____________________________]

Other
[____________________________]

[ Back ]                                  [ Continue ]


====================================================================
                 AGENT — IDENTITY / KYC
====================================================================

SCREEN: A03_AGENT_KYC

+---------------------------------------------------------------+
| Verification                                                  |
|                                                               |
| Your identity information is protected and restricted.        |
|                                                               |
| Identity document                                             |
|                                                               |
| [ Upload document ]                                           |
|                                                               |
| Document type                                                 |
| [ Select ▾ ]                                                  |
|                                                               |
| Additional verification                                      |
|                                                               |
| [ Upload supporting document ]                                |
|                                                               |
| 🔒 Sensitive information is not publicly displayed.           |
|                                                               |
| [ Submit application ]                                        |
+---------------------------------------------------------------+


====================================================================
                 AGENT — APPLICATION STATUS
====================================================================

SCREEN: A04_AGENT_STATUS

+---------------------------------------------------------------+
| Agent application                                             |
|                                                               |
| ● UNDER REVIEW                                                |
|                                                               |
| Our moderation team is reviewing your application.             |
|                                                               |
| Submitted: Sep 08, 2026                                       |
|                                                               |
| STATUS                                                        |
|                                                               |
| ✓ Application submitted                                       |
| ✓ Review started                                              |
| ● Verification in progress                                   |
| ○ Decision                                                    |
|                                                               |
| We may request additional information.                         |
+---------------------------------------------------------------+


====================================================================
                  VERIFIED AGENT HOME
====================================================================

SCREEN: A10_AGENT_DASHBOARD

+--------------------------------------------------------------------------------+
| PLUMIHOPE AGENT                                                                |
|                                                                                 |
| Good morning, Rahim                                     ✓ VERIFIED AGENT       |
+--------------------------------------------------------------------------------+

+-------------------+-------------------+-------------------+--------------------+
| AVAILABLE         | ACTIVE CASES      | CAMPAIGNS         | RAISED             |
| REQUESTS          |                   |                   |                    |
| 12                | 4                 | 7                 | ৳2.4M              |
+-------------------+-------------------+-------------------+--------------------+

+--------------------------------------------------------------------------------+
| ACTION CENTER                                                                  |
|                                                                                 |
| 3 requests available                                                           |
| 1 campaign needs update                                                        |
| 1 assistance proof pending                                                     |
|                                                                                 |
| [ Review requests ]                                                            |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| MY ACTIVE CASES                                                                |
|                                                                                 |
| Medical — Dhaka                    ● INVESTIGATING                             |
| Education — Gazipur                ● VERIFIED_CASE                             |
| Emergency — Sylhet                  ● CAMPAIGN ACTIVE                          |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| CAMPAIGNS                                                                      |
|                                                                                 |
| Active: 4     Under review: 1     Completed: 42                                |
+--------------------------------------------------------------------------------+


====================================================================
                  AGENT — AVAILABLE REQUESTS
====================================================================

SCREEN: A11_AVAILABLE_REQUESTS

+--------------------------------------------------------------------------------+
| Help Requests                                                                  |
|                                                                                 |
| [Available] [My Cases] [History]                                               |
|                                                                                 |
| Search [_________________________]                                             |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| MEDICAL • DHAKA                                                                |
| Urgent treatment support                                                        |
|                                                                                 |
| Submitted 2h ago                                                               |
|                                                                                 |
| Description preview...                                                         |
|                                                                                 |
| ● AVAILABLE                                                                    |
|                                                                                 |
| [ View case ]                                      [ Express interest ]        |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| EDUCATION • GAZIPUR                                                            |
| School support for student                                                     |
|                                                                                 |
| ● AVAILABLE                                                                    |
|                                                                                 |
| [ View case ]                                      [ Express interest ]        |
+--------------------------------------------------------------------------------+


====================================================================
                  AGENT — HELP REQUEST DETAIL
====================================================================

SCREEN: A12_REQUEST_DETAIL

+--------------------------------------------------------------------------------+
| ← Requests                                                                     |
|                                                                                 |
| Medical / Cancer                                                               |
| Dhaka                                                                          |
|                                                                                 |
| ● AVAILABLE                                                                    |
+--------------------------------------------------------------------------------+

CASE INFORMATION

Recipient situation:
[Protected / relevant public case information]

Location:
Dhaka

Need:
Treatment assistance

Submitted:
Sep 07, 2026

+--------------------------------------------------------------------------------+
| INVESTIGATION                                                                  |
|                                                                                 |
| Before claiming this case, review the available information.                   |
|                                                                                 |
| [ Claim this case ]                                                            |
+--------------------------------------------------------------------------------+


====================================================================
                    AGENT CLAIM FLOW
====================================================================

AVAILABLE
   |
   v
[Claim]
   |
   v
CLAIM CONFIRMATION
   |
   v
CLAIMED
   |
   v
INVESTIGATING


CONFIRMATION SHEET:

+---------------------------------------------------------------+
| Claim this case?                                             |
|                                                               |
| You will become the primary investigating Agent.              |
|                                                               |
| This may notify other interested Agents.                      |
|                                                               |
| [ Cancel ]                        [ Confirm claim ]            |
+---------------------------------------------------------------+


====================================================================
                  AGENT — INVESTIGATION
====================================================================

SCREEN: A13_INVESTIGATION

+--------------------------------------------------------------------------------+
| Case investigation                                                             |
|                                                                                 |
| Case #HR-1828                                                                  |
| ● INVESTIGATING                                                                |
+--------------------------------------------------------------------------------+

CHECKLIST

[✓] Recipient identity / case information checked
[✓] Location visit completed
[ ] Supporting documents collected
[ ] Need assessed
[ ] Evidence uploaded
[ ] Investigation completed

+--------------------------------------------------------------------------------+
| FIELD NOTES                                                                    |
|                                                                                 |
| [                                                                       ]      |
| [                                                                       ]      |
+--------------------------------------------------------------------------------+

MEDIA

[ + Take photo ] [ + Record video ] [ + Scan document ]

+--------------------------------------------------------------------------------+
| EVIDENCE                                                                       |
|                                                                                 |
| [Medical document]     RESTRICTED     Uploaded                                 |
| [Photo]                RESTRICTED     Uploaded                                 |
| [Receipt]              RESTRICTED     Uploaded                                 |
+--------------------------------------------------------------------------------+

[ Save investigation ]


====================================================================
                  AGENT — CAMERA / MEDIA
====================================================================

SCREEN: A14_CAPTURE

+---------------------------------------------------------------+
|                       Camera                                  |
|                                                               |
|                                                               |
|                     [ CAMERA PREVIEW ]                        |
|                                                               |
|                                                               |
|                                                               |
|                    ○                                          |
|                                                               |
| Photo     Video      Scan                                      |
+---------------------------------------------------------------+

After capture:

+---------------------------------------------------------------+
| Evidence captured                                             |
|                                                               |
| [IMAGE PREVIEW]                                               |
|                                                               |
| Media type: Photo                                             |
| Visibility: [ Restricted ▾ ]                                  |
|                                                               |
| [ Retake ]                         [ Save evidence ]           |
+---------------------------------------------------------------+


====================================================================
                    AGENT — EVIDENCE REVIEW
====================================================================

+---------------------------------------------------------------+
| Evidence                                                      |
|                                                               |
| [IMAGE]                                                       |
|                                                               |
| Visibility                                                    |
| ● Restricted                                                  |
| ○ Public                                                      |
|                                                               |
| Attach to:                                                    |
| ○ Help Request                                                |
| ○ Campaign                                                    |
| ○ Update                                                      |
|                                                               |
| [ Save ]                                                      |
+---------------------------------------------------------------+


====================================================================
             AGENT — VERIFIED CASE DECISION
====================================================================

SCREEN: A15_VERIFY_CASE

+---------------------------------------------------------------+
| Investigation complete                                        |
|                                                               |
| Are you confident this case is legitimate and suitable       |
| for a campaign?                                               |
|                                                               |
| Investigation checklist:                                      |
|                                                               |
| ✓ Recipient confirmed                                         |
| ✓ Need confirmed                                              |
| ✓ Evidence collected                                          |
| ✓ Location confirmed                                          |
|                                                               |
| [ Case not suitable ]                                         |
|                                                               |
| [ Confirm verified case ]                                     |
+---------------------------------------------------------------+


====================================================================
                  AGENT — CREATE CAMPAIGN
====================================================================

SCREEN: A20_CREATE_CAMPAIGN

+--------------------------------------------------------------------------------+
| Create campaign                                                                |
| Case: HR-1828                                                                  |
| Step 1 of 5                                                                    |
+--------------------------------------------------------------------------------+

Campaign title

[ Help Maria receive cancer treatment __________________________ ]

Description

[                                                                        ]
[                                                                        ]
[                                                                        ]

Category

[ Medical ▾ ]

Subcategory

[ Cancer ▾ ]

Target amount

[ ৳________________ ]

End date

[ Select date ]

[ Save draft ]                            [ Continue ]


IMPORTANT:

Campaign creation is only available when:

    role = AGENT
    AND
    agent verification_status = VERIFIED
    AND
    campaign:create permission exists
    AND
    Help Request = VERIFIED_CASE


====================================================================
               AGENT — CAMPAIGN EVIDENCE
====================================================================

SCREEN: A21_CAMPAIGN_EVIDENCE

+--------------------------------------------------------------------------------+
| Create campaign                                                                |
| Step 2 of 5                                                                    |
+--------------------------------------------------------------------------------+

Evidence required

+--------------------------------------------------------------------------------+
| ✓ Identity / case evidence                                                    |
|                                                                                 |
| [ View uploaded evidence ]                                                     |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Medical / supporting documents                                                 |
|                                                                                 |
| [ + Upload document ]                                                          |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Photos / video                                                                 |
|                                                                                 |
| [ + Add media ]                                                                |
+--------------------------------------------------------------------------------+

Visibility:

    Public
    Restricted

Restricted evidence must never appear on public campaign pages.


====================================================================
               AGENT — RECIPIENT INFORMATION
====================================================================

SCREEN: A22_RECIPIENT

+---------------------------------------------------------------+
| Recipient information                                         |
|                                                               |
| Name                                                          |
| [________________________]                                   |
|                                                               |
| Public display name                                           |
| [________________________]                                   |
|                                                               |
| Contact                                                       |
| [________________________]                                   |
|                                                               |
| Location                                                      |
| [________________________]                                   |
|                                                               |
| IMPORTANT                                                     |
|                                                               |
| Sensitive information is stored securely and only exposed     |
| according to authorization rules.                             |
|                                                               |
| [ Continue ]                                                 |
+---------------------------------------------------------------+


====================================================================
                AGENT — PAYOUT INFORMATION
====================================================================

SCREEN: A23_PAYOUT

+---------------------------------------------------------------+
| Payout information                                            |
|                                                               |
| Recipient payout method                                       |
| [ Select ▾ ]                                                  |
|                                                               |
| Account / wallet information                                  |
| [________________________]                                   |
|                                                               |
| 🔒 Restricted information                                     |
|                                                               |
| This information is not publicly displayed.                   |
|                                                               |
| [ Continue ]                                                 |
+---------------------------------------------------------------+


====================================================================
                AGENT — CAMPAIGN PREVIEW
====================================================================

SCREEN: A24_CAMPAIGN_PREVIEW

+--------------------------------------------------------------------------------+
| Campaign preview                                                               |
|                                                                                 |
| ✓ Verified Agent                                                               |
|                                                                                 |
| Help Maria receive cancer treatment                                            |
|                                                                                 |
| [IMAGE]                                                                        |
|                                                                                 |
| Goal: ৳300,000                                                                 |
| Category: Medical                                                              |
|                                                                                 |
| Description...                                                                 |
|                                                                                 |
| Verification evidence                                                          |
| ✓ Case investigated                                                            |
| ✓ Evidence uploaded                                                           |
|                                                                                 |
| [ Edit ]                                                                       |
|                                                                                 |
| [ Submit for Moderator review ]                                                |
+--------------------------------------------------------------------------------+


====================================================================
               AGENT — SUBMISSION CONFIRMATION
====================================================================

+---------------------------------------------------------------+
| Submit campaign for review?                                  |
|                                                               |
| After submission, the campaign enters Moderator review.       |
|                                                               |
| You can no longer freely edit reviewed content.               |
|                                                               |
| [ Cancel ]                         [ Submit ]                  |
+---------------------------------------------------------------+


====================================================================
                AGENT — CAMPAIGN MANAGEMENT
====================================================================

SCREEN: A30_MY_CAMPAIGNS

+--------------------------------------------------------------------------------+
| My Campaigns                                                                   |
|                                                                                 |
| [All] [Draft] [Review] [Active] [Completed]                                  |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Help Maria receive treatment                                                   |
|                                                                                 |
| ● ACTIVE                                                                        |
| ৳245K / ৳300K                                                                  |
| █████████████████░░░                                                            |
|                                                                                 |
| [ Manage ]                                                                     |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Education support                                                              |
|                                                                                 |
| ● UNDER_REVIEW                                                                 |
| Submitted Sep 08                                                               |
|                                                                                 |
| [ View ]                                                                       |
+--------------------------------------------------------------------------------+


====================================================================
                  AGENT — CAMPAIGN DETAIL
====================================================================

+--------------------------------------------------------------------------------+
| Campaign                                                                       |
|                                                                                 |
| Help Maria receive treatment                                                   |
| ● ACTIVE                                                                        |
+--------------------------------------------------------------------------------+

QUICK ACTIONS

[ Add update ]
[ View donations ]
[ View timeline ]
[ Add assistance proof ]

+--------------------------------------------------------------------------------+
| FUNDING                                                                       |
|                                                                                 |
| ৳245,000 / ৳300,000                                                           |
| █████████████████░░░                                                            |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| ACCOUNTABILITY                                                                |
|                                                                                 |
| Campaign approved                                                              |
| Donation collection                                                            |
| Payout pending                                                                 |
| Assistance pending                                                             |
| Assistance delivered                                                           |
| Final review                                                                   |
+--------------------------------------------------------------------------------+


====================================================================
                    AGENT — POST UPDATE
====================================================================

SCREEN: A31_POST_UPDATE

+---------------------------------------------------------------+
| Campaign update                                               |
|                                                               |
| Update title                                                  |
| [________________________]                                   |
|                                                               |
| What happened?                                                |
| [                                                           ] |
| [                                                           ] |
|                                                               |
| Add media                                                     |
| [ + Photo ] [ + Video ]                                      |
|                                                               |
| [ Save draft ]                   [ Submit update ]             |
+---------------------------------------------------------------+


====================================================================
              AGENT — ASSISTANCE PROOF
====================================================================

SCREEN: A32_ASSISTANCE_PROOF

+--------------------------------------------------------------------------------+
| Assistance proof                                                               |
|                                                                                 |
| Campaign: Maria Treatment                                                      |
|                                                                                 |
| Payout: ✓ COMPLETED                                                            |
|                                                                                 |
| Confirm assistance delivery                                                    |
|                                                                                 |
| Delivery date                                                                  |
| [ Select date ]                                                                |
|                                                                                 |
| Amount delivered                                                               |
| [ ৳________ ]                                                                  |
|                                                                                 |
| Proof                                                                           |
| [ + Upload receipt ]                                                           |
| [ + Photo ]                                                                    |
| [ + Document ]                                                                 |
|                                                                                 |
| Notes                                                                           |
| [                                                                        ]      |
|                                                                                 |
| [ Submit proof ]                                                               |
+--------------------------------------------------------------------------------+


====================================================================
                  AGENT — ANALYTICS
====================================================================

SCREEN: A33_ANALYTICS

+--------------------------------------------------------------------------------+
| Agent analytics                                                                |
|                                                                                 |
| CAMPAIGNS                                                                      |
|                                                                                 |
| Active       4                                                                 |
| Completed    42                                                                |
|                                                                                 |
| FUNDS                                                                           |
|                                                                                 |
| Total raised     ৳61.4L                                                        |
|                                                                                 |
| ACCOUNTABILITY                                                                  |
|                                                                                 |
| Update completion     97%                                                      |
| Outcome completion    95%                                                       |
|                                                                                 |
| DONOR FEEDBACK                                                                  |
|                                                                                 |
| Rating               4.9 ★                                                     |
|                                                                                 |
+--------------------------------------------------------------------------------+


====================================================================
                MODERATOR DASHBOARD
====================================================================

IMPORTANT:

Moderator permissions are individually configurable by Admin.

The UI must therefore be permission-aware.

A Moderator who does not have:

    campaign:approve

must NOT see the Approve action.

A Moderator who has:

    agent:verify

may see Agent verification work.

Never simply show all Moderator controls to every Moderator.


====================================================================
                  MODERATOR — HOME
====================================================================

SCREEN: M01_MODERATOR_HOME

+--------------------------------------------------------------------------------+
| PLUMIHOPE MODERATION                                                           |
|                                                                                 |
| Good morning                                                                   |
+--------------------------------------------------------------------------------+

+----------------------+----------------------+----------------------+-----------+
| CAMPAIGNS TO REVIEW  | AGENTS TO REVIEW     | REPORTS              | DISPUTES  |
| 14                   | 6                    | 8                   | 3         |
+----------------------+----------------------+----------------------+-----------+

+--------------------------------------------------------------------------------+
| PRIORITY QUEUE                                                                 |
|                                                                                 |
| 🔴 High-risk report                                                            |
| Campaign #CMP-1838                                                             |
| [ Review ]                                                                     |
|                                                                                 |
| 🟠 Agent verification                                                          |
| Application #AGT-921                                                           |
| [ Review ]                                                                     |
+--------------------------------------------------------------------------------+


====================================================================
              MODERATOR — CAMPAIGN QUEUE
====================================================================

SCREEN: M02_CAMPAIGN_QUEUE

+--------------------------------------------------------------------------------+
| Campaign Review Queue                                                          |
|                                                                                 |
| [All] [New] [High Priority] [Assigned to me]                                 |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| CMP-1838                                                                       |
| Medical / Cancer                                                              |
| Agent: Rahim ✓ Verified                                                        |
| Submitted: 2h ago                                                             |
|                                                                                 |
| Evidence: 7 files                                                             |
| Risk signals: 1                                                                |
|                                                                                 |
| [ Open review ]                                                                |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| CMP-1837                                                                       |
| Education                                                                     |
| Agent: Karim ✓ Verified                                                        |
| Submitted: 5h ago                                                             |
|                                                                                 |
| [ Open review ]                                                                |
+--------------------------------------------------------------------------------+


====================================================================
               MODERATOR — CAMPAIGN REVIEW
====================================================================

SCREEN: M03_CAMPAIGN_REVIEW

+--------------------------------------------------------------------------------+
| Campaign Review                                                                |
|                                                                                 |
| CMP-1838                                                                       |
|                                                                                 |
| STATUS: UNDER_REVIEW                                                           |
+--------------------------------------------------------------------------------+

+-----------------------------------+--------------------------------------------+
| CAMPAIGN                          | EVIDENCE                                   |
|                                   |                                            |
| Title                             | [Document]                                 |
| Description                       | [Document]                                 |
| Category                          | [Medical]                                  |
| Target                            | ৳300,000                                   |
|                                   |                                            |
| Agent                             | [View Agent]                               |
|                                   |                                            |
|                                   | [Photo] [Photo]                            |
|                                   |                                            |
|                                   | Restricted documents                       |
|                                   | [Authorized access]                        |
+-----------------------------------+--------------------------------------------+

+--------------------------------------------------------------------------------+
| VERIFICATION CHECKLIST                                                         |
|                                                                                 |
| [ ] Recipient information consistent                                           |
| [ ] Evidence current                                                           |
| [ ] Amount justified                                                           |
| [ ] Location consistent                                                        |
| [ ] No obvious duplicate                                                      |
| [ ] Agent investigation adequate                                               |
| [ ] Sensitive evidence reviewed where authorized                              |
+--------------------------------------------------------------------------------+

REVIEW NOTES

[                                                                        ]

+--------------------------------------------------------------------------------+
| [ Request more information ]   [ Reject ]             [ Approve ]              |
+--------------------------------------------------------------------------------+

IMPORTANT:

Reviewer cannot approve their own submitted content.

Reviewer identity must be different from submitter where applicable.


====================================================================
             MODERATOR — REQUEST MORE INFORMATION
====================================================================

+---------------------------------------------------------------+
| Request more information                                     |
|                                                               |
| Tell the Agent what is missing.                              |
|                                                               |
| [                                                           ] |
| [                                                           ] |
|                                                               |
| Required items:                                              |
| □ Updated medical document                                   |
| □ Recipient clarification                                    |
| □ Amount explanation                                         |
| □ Additional field evidence                                  |
|                                                               |
| [ Cancel ]                         [ Send request ]            |
+---------------------------------------------------------------+


====================================================================
                  MODERATOR — AGENT QUEUE
====================================================================

SCREEN: M04_AGENT_QUEUE

+--------------------------------------------------------------------------------+
| Agent Applications                                                             |
|                                                                                 |
| [Pending] [Under Review] [Restricted] [Suspended]                              |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| [AVATAR] Rahim Ahmed                                                           |
|                                                                                 |
| Application #AGT-921                                                           |
| Submitted Sep 08                                                               |
|                                                                                 |
| Identity documents: 4                                                          |
| Social profiles: 3                                                             |
|                                                                                 |
| ● UNDER_REVIEW                                                                 |
|                                                                                 |
| [ Open application ]                                                           |
+--------------------------------------------------------------------------------+


====================================================================
                MODERATOR — AGENT REVIEW
====================================================================

+--------------------------------------------------------------------------------+
| Agent Verification                                                             |
|                                                                                 |
| Rahim Ahmed                                                                    |
|                                                                                 |
| Identity                                                                       |
| ✓ Document uploaded                                                            |
| ✓ Contact verified                                                             |
|                                                                                 |
| Background                                                                     |
| [information]                                                                  |
|                                                                                 |
| Public profiles                                                                |
| [Facebook] [YouTube]                                                           |
+--------------------------------------------------------------------------------+

DECISION

[ Reject ]
[ Request more information ]
[ Approve ]



====================================================================
                  MODERATOR — REPORT QUEUE
====================================================================

SCREEN: M05_REPORTS

+--------------------------------------------------------------------------------+
| Reports                                                                        |
|                                                                                 |
| [Open] [Investigating] [Resolved] [Escalated]                                 |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| REPORT #RPT-882                                                                |
| Campaign: CMP-1838                                                             |
| Reason: Misleading information                                                 |
| Reporter: User                                                                 |
| Submitted: 20 min ago                                                          |
|                                                                                 |
| ● OPEN                                                                         |
|                                                                                 |
| [ Investigate ]                                                                |
+--------------------------------------------------------------------------------+


====================================================================
                 MODERATOR — REPORT DETAIL
====================================================================

+--------------------------------------------------------------------------------+
| Report #RPT-882                                                                |
|                                                                                 |
| Campaign: CMP-1838                                                             |
|                                                                                 |
| Report reason                                                                  |
| Misleading information                                                         |
|                                                                                 |
| Reporter statement                                                             |
| [text]                                                                         |
|                                                                                 |
| Evidence                                                                       |
| [attachments]                                                                  |
|                                                                                 |
| CAMPAIGN STATE                                                                 |
| ● ACTIVE                                                                       |
|                                                                                 |
| ACTIONS                                                                        |
| [ Resolve ] [ Escalate ] [ Suspend campaign ]                                 |
+--------------------------------------------------------------------------------+


====================================================================
                  MODERATOR — DISPUTE
====================================================================

SCREEN: M06_DISPUTE

+--------------------------------------------------------------------------------+
| Dispute #DSP-118                                                               |
|                                                                                 |
| ● UNDER_REVIEW                                                                 |
|                                                                                 |
| Related donation: DON-1828                                                     |
| Related campaign: CMP-1838                                                     |
|                                                                                 |
| Issue                                                                           |
| Donation / assistance concern                                                  |
|                                                                                 |
| Evidence                                                                       |
| [documents]                                                                    |
|                                                                                 |
| OUTCOME                                                                        |
| ○ NO_ISSUE                                                                     |
| ○ REFUND                                                                       |
| ○ PARTIAL_REFUND                                                               |
| ○ CAMPAIGN_SUSPENDED                                                           |
| ○ AGENT_RESTRICTED                                                             |
| ○ PAYMENT_INVESTIGATION                                                        |
| ○ ESCALATED                                                                    |
|                                                                                 |
| [ Record resolution ]                                                           |
+--------------------------------------------------------------------------------+


====================================================================
                     ADMIN DASHBOARD
====================================================================

ADMIN IS THE HIGHEST OPERATIONAL ROLE.

ADMIN controls:

    users
    agents
    moderators
    permissions
    financial oversight
    system configuration
    audit access
    operational policy


====================================================================
                    ADMIN — OVERVIEW
====================================================================

SCREEN: D01_ADMIN_HOME

+--------------------------------------------------------------------------------+
| PLUMIHOPE ADMIN                                                                |
|                                                                                 |
| System Overview                                                                |
+--------------------------------------------------------------------------------+

+--------------------+--------------------+--------------------+--------------------+
| USERS              | AGENTS             | CAMPAIGNS          | DONATIONS          |
| 84,291             | 1,842              | 12,482             | ৳82.4M             |
+--------------------+--------------------+--------------------+--------------------+

+--------------------+--------------------+--------------------+--------------------+
| REPORTS            | DISPUTES           | PAYOUTS            | SYSTEM             |
| 82                 | 17                 | 21 pending         | Healthy            |
+--------------------+--------------------+--------------------+--------------------+

+--------------------------------------------------------------------------------+
| ADMIN ACTION CENTER                                                            |
|                                                                                 |
| 6 Moderator applications / permission changes                                  |
| 21 pending payouts                                                             |
| 8 security alerts                                                              |
|                                                                                 |
| [ Review ]                                                                     |
+--------------------------------------------------------------------------------+


====================================================================
                     ADMIN — USERS
====================================================================

SCREEN: D02_USERS

+--------------------------------------------------------------------------------+
| Users                                                                          |
|                                                                                 |
| Search [_______________________________]                                      |
|                                                                                 |
| Filter: [All statuses ▾]                                                       |
+--------------------------------------------------------------------------------+

| USER       | ROLE       | STATUS     | CREATED       | ACTION                 |
|------------|------------|------------|---------------|------------------------|
| Rahim      | AGENT      | VERIFIED   | Sep 01        | [View]                 |
| Karim      | USER       | ACTIVE     | Aug 29        | [View]                 |
| ...        | ...        | ...        | ...           | ...                    |

ADMIN ONLY:

    Suspend user
    Reinstate user


====================================================================
                  ADMIN — USER DETAIL
====================================================================

+--------------------------------------------------------------------------------+
| User                                                                           |
|                                                                                 |
| Rahim Ahmed                                                                    |
|                                                                                 |
| Status: ACTIVE                                                                 |
| Roles: USER, AGENT                                                             |
| Agent status: VERIFIED                                                         |
|                                                                                 |
| ACCOUNT                                                                        |
| Email                                                                          |
| Phone                                                                          |
| Created                                                                        |
|                                                                                 |
| ROLES                                                                          |
| USER ✓                                                                         |
| AGENT ✓                                                                        |
|                                                                                 |
| [ Suspend account ]                                                            |
+--------------------------------------------------------------------------------+


====================================================================
                 ADMIN — MODERATOR MANAGEMENT
====================================================================

SCREEN: D03_MODERATORS

+--------------------------------------------------------------------------------+
| Moderators                                                                     |
|                                                                                 |
| [ + Create Moderator ]                                                         |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| [Avatar] Moderator A                                                           |
| Permissions: campaign.review, campaign.approve                                |
| Status: ACTIVE                                                                 |
|                                                                                 |
| [ Manage permissions ]                                                         |
+--------------------------------------------------------------------------------+


====================================================================
             ADMIN — CREATE MODERATOR
====================================================================

+---------------------------------------------------------------+
| Create Moderator                                              |
|                                                               |
| Select existing user                                         |
| [ Search user ]                                               |
|                                                               |
| Permissions                                                   |
|                                                               |
| □ campaign.review                                             |
| □ campaign.approve                                            |
| □ campaign.reject                                             |
| □ agent.review                                                |
| □ agent.verify                                                |
| □ agent.suspend                                               |
| □ report.review                                               |
| □ report.resolve                                              |
| □ dispute.resolve                                             |
| □ finance.view                                                |
| □ audit.view                                                  |
|                                                               |
| [ Cancel ]                         [ Create moderator ]         |
+---------------------------------------------------------------+


IMPORTANT:

A Moderator cannot:

    grant themselves permissions
    grant ADMIN
    become ADMIN
    expand their own permissions


====================================================================
              ADMIN — PERMISSION MANAGEMENT
====================================================================

SCREEN: D04_PERMISSION_MANAGEMENT

+--------------------------------------------------------------------------------+
| Moderator permissions                                                          |
|                                                                                 |
| Moderator: A                                                                    |
|                                                                                 |
| CAMPAIGNS                                                                      |
|                                                                                 |
| campaign.review                    [ ON ]                                      |
| campaign.approve                   [ ON ]                                      |
| campaign.reject                    [ ON ]                                      |
|                                                                                 |
| AGENTS                                                                         |
|                                                                                 |
| agent.review                       [ ON ]                                      |
| agent.verify                       [ OFF ]                                     |
| agent.suspend                      [ OFF ]                                     |
|                                                                                 |
| REPORTS                                                                        |
| report.review                      [ ON ]                                      |
| report.resolve                     [ ON ]                                      |
|                                                                                 |
| AUDIT                                                                          |
| audit.view                         [ OFF ]                                     |
|                                                                                 |
| [ Save permission changes ]                                                     |
+--------------------------------------------------------------------------------+


====================================================================
                  ADMIN — FINANCE
====================================================================

SCREEN: D05_FINANCE

+--------------------------------------------------------------------------------+
| Financial Overview                                                             |
|                                                                                 |
| Total donations                                                                |
| ৳82,400,000                                                                    |
|                                                                                 |
| Confirmed donations                                                             |
| ৳79,820,000                                                                    |
|                                                                                 |
| Pending payouts                                                                |
| ৳4,200,000                                                                     |
|                                                                                 |
| Completed assistance                                                           |
| ৳71,400,000                                                                    |
+--------------------------------------------------------------------------------+

TABS:

[Donations] [Payouts] [Refunds] [Fees] [Financial health]


====================================================================
                   ADMIN — PAYOUT QUEUE
====================================================================

+--------------------------------------------------------------------------------+
| Payout Queue                                                                   |
+--------------------------------------------------------------------------------+

+--------------------------------------------------------------------------------+
| Campaign CMP-1838                                                             |
| Amount: ৳280,000                                                               |
| Status: PENDING                                                                |
|                                                                                 |
| Recipient payout information                                                   |
| 🔒 Restricted                                                                  |
|                                                                                 |
| [ View authorized details ]                                                    |
| [ Initiate payout ]                                                            |
+--------------------------------------------------------------------------------+


====================================================================
                  ADMIN — AUDIT LOG
====================================================================

SCREEN: D06_AUDIT

+--------------------------------------------------------------------------------+
| Audit Log                                                                      |
|                                                                                 |
| Timestamp        Actor       Action                 Entity                     |
| ----------------------------------------------------------------------------- |
| Sep 08 10:32     Admin       PERMISSIONS_UPDATED    Moderator A               |
| Sep 08 10:21     Mod A       CAMPAIGN_APPROVED      CMP-1838                  |
| Sep 08 10:12     Admin       USER_SUSPENDED         User 1828                 |
| Sep 08 09:48     System      DONATION_CONFIRMED     DON-1828                  |
+--------------------------------------------------------------------------------+

Filters:

[ Actor ] [ Action ] [ Entity ] [ Date range ]


====================================================================
                ADMIN — SYSTEM SETTINGS
====================================================================

SCREEN: D07_SYSTEM_SETTINGS

+--------------------------------------------------------------------------------+
| Platform Configuration                                                         |
|                                                                                 |
| DONATION                                                                       |
|                                                                                 |
| Platform fee                                                                  |
| [ ____ % ]                                                                     |
|                                                                                 |
| Agent fee                                                                      |
| [ ____ % ]                                                                     |
|                                                                                 |
| Overfunding policy                                                             |
| [ Select policy ▾ ]                                                            |
|                                                                                 |
| FEATURE FLAGS                                                                   |
|                                                                                 |
| New discovery UI                         [ ON ]                                |
| Agent analytics                          [ ON ]                                |
| Experimental AI                           [ OFF ]                               |
|                                                                                 |
| [ Save changes ]                                                               |
+--------------------------------------------------------------------------------+

All configuration changes must be audited.


====================================================================
                ADMIN — SECURITY / OPERATIONS
====================================================================

+--------------------------------------------------------------------------------+
| Security & Operations                                                          |
|                                                                                 |
| Authentication                                                                 |
| Active sessions: 1,248                                                        |
|                                                                                 |
| Failed login attempts: 38                                                     |
|                                                                                 |
| Payment webhook errors: 0                                                     |
|                                                                                 |
| Suspicious activity: 4                                                        |
|                                                                                 |
| [ View security events ]                                                       |
+--------------------------------------------------------------------------------+


====================================================================
                         iOS APPLICATION
====================================================================

The iOS application is the PRIMARY CLIENT.

Technology:

    Swift
    SwiftUI
    URLSession
    SwiftData
    Keychain
    PhotosUI
    AVFoundation
    Vision / VisionKit
    MapKit
    APNs

The iOS app must feel:

    native
    fluid
    premium
    accessible
    human

Do not simply wrap the web application in a mobile shell.


====================================================================
                     iOS TAB BAR — USER
====================================================================

+---------------------------------------------------------------+
|                                                               |
|                       SCREEN CONTENT                          |
|                                                               |
+---------------------------------------------------------------+
|   Home      Discover      Saved      Donations      Profile   |
+---------------------------------------------------------------+

Notifications should be accessible from the top-right.

Authenticated Agent mode may provide an Agent-specific workspace.


====================================================================
                     iOS — LAUNCH
====================================================================

SCREEN: I00_SPLASH

+---------------------------------------------------------------+
|                                                               |
|                                                               |
|                         PLUMIHOPE                             |
|                                                               |
|                  Trusted humanitarian help                   |
|                                                               |
|                         ○ loading                             |
|                                                               |
+---------------------------------------------------------------+


====================================================================
                   iOS — ONBOARDING
====================================================================

SCREEN: I01_ONBOARDING_01

+---------------------------------------------------------------+
|                                                               |
|                         [ILLUSTRATION]                         |
|                                                               |
|             Give with confidence.                             |
|                                                               |
| Discover genuine humanitarian cases and                       |
| understand what happens after you give.                       |
|                                                               |
|                    ● ○ ○                                      |
|                                                               |
| [ Continue ]                                                  |
|                                                               |
| Skip                                                          |
+---------------------------------------------------------------+


SCREEN: I02_ONBOARDING_02

+---------------------------------------------------------------+
|                         [ILLUSTRATION]                         |
|                                                               |
|              Every case has a story.                          |
|                                                               |
| Verified Agents investigate cases before                      |
| fundraising campaigns are published.                          |
|                                                               |
|                    ○ ● ○                                      |
|                                                               |
| [ Continue ]                                                  |
+---------------------------------------------------------------+


SCREEN: I03_ONBOARDING_03

+---------------------------------------------------------------+
|                         [ILLUSTRATION]                         |
|                                                               |
|              Follow what happens next.                        |
|                                                               |
| See updates, assistance progress and outcomes.                 |
|                                                               |
|                    ○ ○ ●                                      |
|                                                               |
| [ Get started ]                                               |
+---------------------------------------------------------------+


====================================================================
                    iOS — AUTH FLOW
====================================================================

SCREEN: I10_WELCOME

+---------------------------------------------------------------+
|                                                               |
|                         PLUMIHOPE                             |
|                                                               |
|             Trusted humanitarian assistance                   |
|                                                               |
| [ Create account ]                                            |
|                                                               |
| [ Sign in ]                                                   |
|                                                               |
|                                                               |
| By continuing you agree to our Terms and Privacy Policy.      |
+---------------------------------------------------------------+


SCREEN: I11_REGISTER

+---------------------------------------------------------------+
| ← Back                                                        |
|                                                               |
| Create your account                                           |
|                                                               |
| Name                                                          |
| [________________________]                                   |
|                                                               |
| Email or phone                                                |
| [________________________]                                   |
|                                                               |
| Password                                                      |
| [________________________]                                   |
|                                                               |
| [ Create account ]                                            |
+---------------------------------------------------------------+


SCREEN: I12_VERIFY

+---------------------------------------------------------------+
| ← Back                                                        |
|                                                               |
| Verify your account                                           |
|                                                               |
| Code sent to                                                   |
| r••••@example.com                                             |
|                                                               |
| [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]                          |
|                                                               |
| Didn't receive it? Resend                                     |
+---------------------------------------------------------------+


SCREEN: I13_LOGIN

+---------------------------------------------------------------+
|                                                               |
| Welcome back                                                  |
|                                                               |
| Email or phone                                                |
| [________________________]                                   |
|                                                               |
| Password                                                      |
| [________________________]                                   |
|                                                               |
| Forgot password?                                              |
|                                                               |
| [ Sign in ]                                                   |
|                                                               |
| Don't have an account? [Create one]                           |
+---------------------------------------------------------------+


====================================================================
                    iOS — HOME
====================================================================

SCREEN: I20_HOME

+---------------------------------------------------------------+
| Good morning                                                  |
|                                                               |
|                         🔔                                    |
|                                                               |
| Find a cause you can confidently support.                     |
|                                                               |
| ┌─────────────────────────────────────────────────────────┐   |
| │ 🔍 Search campaigns...                                  │   |
| └─────────────────────────────────────────────────────────┘   |
|                                                               |
| FOR YOU                                                       |
|                                                               |
| [ Large Campaign Card ]                                       |
|                                                               |
| ✓ Verified                                                   |
| Cancer treatment                                             |
| ৳245K / ৳300K                                                |
| ████████████████░░                                           |
|                                                               |
| [ View campaign ]                                             |
|                                                               |
| NEAR YOU / DISCOVER                                          |
|                                                               |
| [Campaign Card]                                               |
| [Campaign Card]                                               |
|                                                               |
+---------------------------------------------------------------+
| Home | Discover | Saved | Donations | Profile                 |
+---------------------------------------------------------------+


====================================================================
                   iOS — DISCOVER
====================================================================

SCREEN: I21_DISCOVER

+---------------------------------------------------------------+
| Discover                                                      |
|                                                               |
| ┌─────────────────────────────────────────────────────────┐   |
| │ 🔍 Search                                               │   |
| └─────────────────────────────────────────────────────────┘   |
|                                                               |
| [Medical] [Education] [Emergency]                             |
| [Food] [Housing] [Disaster]                                   |
|                                                               |
| Filters                                                       |
|                                                               |
| [Campaign Card]                                               |
|                                                               |
| [Campaign Card]                                               |
|                                                               |
| [Campaign Card]                                               |
+---------------------------------------------------------------+


====================================================================
                    iOS — SEARCH
====================================================================

SCREEN: I22_SEARCH

+---------------------------------------------------------------+
| ← Search                                                      |
|                                                               |
| ┌─────────────────────────────────────────────────────────┐   |
| │ cancer treatment                                       × │   |
| └─────────────────────────────────────────────────────────┘   |
|                                                               |
| Recent                                                        |
| Medical treatment                                             |
| Education                                                     |
|                                                               |
| RESULTS                                                       |
|                                                               |
| [Campaign result]                                             |
| [Campaign result]                                             |
+---------------------------------------------------------------+


====================================================================
               iOS — CAMPAIGN DETAIL
====================================================================

SCREEN: I23_CAMPAIGN_DETAIL

+---------------------------------------------------------------+
| ←                                                           ♡ |
|                                                               |
|                       [CAMPAIGN IMAGE]                         |
|                                                               |
| ✓ VERIFIED CASE                                               |
|                                                               |
| Help Maria receive cancer treatment                           |
|                                                               |
| ৳245,000 raised                                               |
| of ৳300,000                                                   |
|                                                               |
| █████████████████░░░                                         |
|                                                               |
| 82%       1,240 donors       14 days                          |
|                                                               |
| [ Donate ৳1,000 ]                                             |
|                                                               |
| ABOUT                                                         |
| Maria needs...                                                |
|                                                               |
| [ Read more ]                                                 |
|                                                               |
| WHY VERIFIED?                                                |
| ✓ Agent verified                                              |
| ✓ Evidence reviewed                                           |
| ✓ Moderator approved                                          |
|                                                               |
| [ See verification ]                                          |
|                                                               |
| ACCOUNTABILITY                                                |
| ● Campaign approved                                           |
| ● Investigation completed                                    |
| ● Help request submitted                                      |
|                                                               |
| AGENT                                                         |
| [Avatar] Rahim Humanitarian Network ✓                         |
| [ Follow ]                                                    |
|                                                               |
| UPDATES                                                       |
| [ Update card ]                                               |
|                                                               |
| [ Report campaign ]                                           |
+---------------------------------------------------------------+


====================================================================
                    iOS — DONATION
====================================================================

SCREEN: I30_DONATION_AMOUNT

+---------------------------------------------------------------+
| ← Donate                                                       |
|                                                               |
| Help Maria receive treatment                                  |
|                                                               |
| Choose amount                                                 |
|                                                               |
| [ ৳500 ]    [ ৳1,000 ]    [ ৳2,000 ]                         |
|                                                               |
| [ ৳___________ ]                                              |
|                                                               |
| Your donation helps fund verified assistance.                 |
|                                                               |
| [ Continue ]                                                  |
+---------------------------------------------------------------+


SCREEN: I31_DONATION_PAYMENT

+---------------------------------------------------------------+
| ← Donation                                                    |
|                                                               |
| Donation amount                                               |
| ৳1,000                                                        |
|                                                               |
| Payment method                                                |
|                                                               |
| ○ bKash                                                       |
| ○ Nagad                                                       |
| ○ Card                                                        |
|                                                               |
| Fee                                                           |
| ৳...                                                          |
|                                                               |
| Platform fee                                                  |
| ৳...                                                          |
|                                                               |
| Net campaign contribution                                     |
| ৳...                                                          |
|                                                               |
| [ Continue to payment ]                                       |
+---------------------------------------------------------------+


SCREEN: I32_PAYMENT_REDIRECT

+---------------------------------------------------------------+
|                                                               |
|                     Secure payment                            |
|                                                               |
| Redirecting you to the payment provider...                    |
|                                                               |
|                     ○                                          |
|                                                               |
| Do not close the app.                                         |
+---------------------------------------------------------------+


SCREEN: I33_DONATION_PENDING

+---------------------------------------------------------------+
| Donation processing                                           |
|                                                               |
| Your payment is being verified.                               |
|                                                               |
| ○ Processing...                                               |
|                                                               |
| We'll confirm the donation once the payment provider           |
| confirms the transaction.                                     |
+---------------------------------------------------------------+


IMPORTANT:

Never show:

    "Donation successful"

merely because the client returned from a payment screen.

Donation becomes CONFIRMED only after server-side payment-provider
verification.

The client must never be the source of truth for payment success.


====================================================================
                  iOS — DONATION CONFIRMED
====================================================================

SCREEN: I34_DONATION_CONFIRMED

+---------------------------------------------------------------+
|                                                               |
|                           ✓                                   |
|                                                               |
|                  Donation confirmed                           |
|                                                               |
|                         ৳1,000                                |
|                                                               |
| Your donation has been verified.                              |
|                                                               |
| [ View receipt ]                                              |
|                                                               |
| [ Follow campaign ]                                           |
|                                                               |
| [ Done ]                                                      |
+---------------------------------------------------------------+


====================================================================
                     iOS — RECEIPT
====================================================================

SCREEN: I35_RECEIPT

+---------------------------------------------------------------+
| ← Receipt                                                      |
|                                                               |
| PLUMIHOPE                                                     |
|                                                               |
| Donation                                                       |
| ৳1,000                                                        |
|                                                               |
| Campaign                                                       |
| Maria's Treatment                                             |
|                                                               |
| Status                                                         |
| ✓ CONFIRMED                                                   |
|                                                               |
| Donation ID                                                    |
| PH-DON-000184                                                  |
|                                                               |
| Date                                                           |
| Sep 08, 2026                                                   |
|                                                               |
| [ Share receipt ]                                              |
+---------------------------------------------------------------+


====================================================================
                    iOS — SAVED
====================================================================

SCREEN: I40_SAVED

+---------------------------------------------------------------+
| Saved                                                         |
|                                                               |
| [Campaign Card]                                               |
|                                                               |
| [Campaign Card]                                               |
|                                                               |
| Empty state:                                                  |
|                                                               |
|              [Bookmark Illustration]                           |
|                                                               |
| Save campaigns to follow them later.                          |
+---------------------------------------------------------------+


====================================================================
                  iOS — FOLLOWING
====================================================================

SCREEN: I41_FOLLOWING

+---------------------------------------------------------------+
| Following                                                      |
|                                                               |
| AGENTS                                                        |
|                                                               |
| [Avatar] Rahim Humanitarian Network ✓                         |
| 42 campaigns                                                 |
| [Following]                                                   |
|                                                               |
| CAMPAIGN UPDATES                                              |
|                                                               |
| [Update card]                                                 |
+---------------------------------------------------------------+


====================================================================
                 iOS — NOTIFICATIONS
====================================================================

SCREEN: I42_NOTIFICATIONS

+---------------------------------------------------------------+
| Notifications                                                 |
|                                                               |
| TODAY                                                         |
|                                                               |
| ✓ Donation confirmed                                         |
| ৳1,000 donation confirmed                                     |
|                                                               |
| ✓ New campaign update                                        |
| Rahim posted a new update                                     |
|                                                               |
| YESTERDAY                                                     |
|                                                               |
| ✓ Assistance delivered                                       |
| A campaign you supported reached its assistance milestone.    |
+---------------------------------------------------------------+


====================================================================
                  iOS — PROFILE
====================================================================

SCREEN: I43_PROFILE

+---------------------------------------------------------------+
| Profile                                                       |
|                                                               |
| [Avatar]                                                      |
| Rafi                                                          |
|                                                               |
| [ Edit profile ]                                              |
|                                                               |
| MY ACTIVITY                                                   |
|                                                               |
| Donations                                                     |
| Saved campaigns                                               |
| Following                                                     |
| Help requests                                                 |
|                                                               |
| BECOME AN AGENT                                               |
|                                                               |
| [ Apply ]                                                     |
|                                                               |
| SETTINGS                                                      |
| Notifications                                                 |
| Privacy                                                       |
| Security                                                      |
|                                                               |
| [ Sign out ]                                                  |
+---------------------------------------------------------------+


====================================================================
                iOS — REQUEST HELP
====================================================================

SCREEN: I50_REQUEST_HELP

+---------------------------------------------------------------+
| Request help                                                  |
|                                                               |
| What kind of help?                                            |
|                                                               |
| [ Medical ]                                                   |
| [ Education ]                                                 |
| [ Emergency ]                                                 |
| [ Livelihood ]                                                |
| [ Disaster Relief ]                                           |
| [ Food ]                                                      |
| [ Housing ]                                                   |
| [ Disability ]                                                |
| [ Community Support ]                                         |
| [ Other ]                                                     |
|                                                               |
| [ Continue ]                                                  |
+---------------------------------------------------------------+


SCREEN: I51_REQUEST_HELP_DETAILS

+---------------------------------------------------------------+
| Medical                                                        |
|                                                               |
| Subcategory                                                   |
| [ Cancer ▾ ]                                                  |
|                                                               |
| Description                                                   |
| [                                                           ] |
| [                                                           ] |
|                                                               |
| Location                                                      |
| [ Select location ]                                           |
|                                                               |
| [ Continue ]                                                  |
+---------------------------------------------------------------+


SCREEN: I52_REQUEST_HELP_REVIEW

+---------------------------------------------------------------+
| Review your request                                           |
|                                                               |
| Category: Medical                                             |
| Subcategory: Cancer                                           |
| Location: Dhaka                                               |
|                                                               |
| Description:                                                  |
| [summary]                                                     |
|                                                               |
| Important:                                                    |
| Submitting a Help Request does not automatically create        |
| a campaign.                                                   |
|                                                               |
| [ Edit ]                         [ Submit request ]             |
+---------------------------------------------------------------+


SCREEN: I53_REQUEST_HELP_SUBMITTED

+---------------------------------------------------------------+
|                           ✓                                   |
|                                                               |
| Help request submitted                                        |
|                                                               |
| Your request has been received.                               |
|                                                               |
| Eligible Agents may now investigate the case.                 |
|                                                               |
| Request ID: HR-1828                                           |
|                                                               |
| [ View request ]                                              |
+---------------------------------------------------------------+


====================================================================
               iOS — HELP REQUEST STATUS
====================================================================

+---------------------------------------------------------------+
| Help Request #HR-1828                                         |
|                                                               |
| Medical / Cancer                                              |
|                                                               |
| ● INVESTIGATING                                               |
|                                                               |
| TIMELINE                                                      |
|                                                               |
| ✓ Submitted                                                   |
| │                                                             |
| ✓ Available                                                   |
| │                                                             |
| ✓ Agent claimed                                               |
| │                                                             |
| ● Investigation                                               |
|                                                               |
| [ View details ]                                              |
+---------------------------------------------------------------+


====================================================================
                 iOS — AGENT MODE ENTRY
====================================================================

When a User becomes VERIFIED AGENT:

PROFILE

+---------------------------------------------------------------+
| Rafi                                                          |
|                                                               |
| ✓ VERIFIED AGENT                                              |
|                                                               |
| [ Switch to Agent Workspace ]                                 |
+---------------------------------------------------------------+


====================================================================
                 iOS — AGENT TAB BAR
====================================================================

+---------------------------------------------------------------+
|                                                               |
|                  AGENT WORKSPACE                              |
|                                                               |
+---------------------------------------------------------------+
| Cases | Campaigns | Capture | Notifications | More             |
+---------------------------------------------------------------+


====================================================================
              iOS AGENT — CASE DASHBOARD
====================================================================

SCREEN: IA01_CASES

+---------------------------------------------------------------+
| Agent Workspace                                               |
|                                                               |
| 12 Available                                                  |
| 4 Active Cases                                                |
| 2 Need Action                                                 |
|                                                               |
| AVAILABLE                                                     |
|                                                               |
| Medical — Dhaka                                               |
| ● AVAILABLE                                                   |
|                                                               |
| Education — Gazipur                                           |
| ● AVAILABLE                                                   |
|                                                               |
| MY CASES                                                       |
|                                                               |
| Cancer treatment                                              |
| ● INVESTIGATING                                               |
+---------------------------------------------------------------+


====================================================================
            iOS AGENT — CASE DETAIL
====================================================================

+---------------------------------------------------------------+
| ← Case                                                        |
|                                                               |
| Medical / Cancer                                              |
| Dhaka                                                         |
|                                                               |
| ● AVAILABLE                                                   |
|                                                               |
| Case information                                              |
|                                                               |
| [details]                                                     |
|                                                               |
| [ Claim case ]                                                |
+---------------------------------------------------------------+


====================================================================
                iOS AGENT — INVESTIGATION
====================================================================

+---------------------------------------------------------------+
| Investigation                                                |
|                                                               |
| Case #HR-1828                                                 |
| ● INVESTIGATING                                               |
|                                                               |
| CHECKLIST                                                      |
|                                                               |
| ✓ Recipient information                                       |
| ✓ Location visit                                              |
| □ Supporting document                                        |
| □ Need assessment                                             |
| □ Evidence                                                    |
| □ Complete investigation                                     |
|                                                               |
| FIELD NOTES                                                   |
| [                                                           ] |
|                                                               |
| [ Save ]                                                      |
+---------------------------------------------------------------+


====================================================================
               iOS AGENT — CAPTURE CENTER
====================================================================

SCREEN: IA04_CAPTURE_CENTER

+---------------------------------------------------------------+
| Capture evidence                                              |
|                                                               |
|                       +-------------+                          |
|                       |             |                          |
|                       |   CAMERA    |                          |
|                       |             |                          |
|                       +-------------+                          |
|                                                               |
| [ Photo ]                                                     |
| [ Video ]                                                     |
| [ Scan document ]                                             |
| [ Choose from Photos ]                                        |
|                                                               |
| Evidence captured here is uploaded securely.                  |
+---------------------------------------------------------------+


====================================================================
               iOS AGENT — DOCUMENT SCANNER
====================================================================

+---------------------------------------------------------------+
| Scan document                                                 |
|                                                               |
|          ┌───────────────────────────────┐                    |
|          │                               │                    |
|          │       DOCUMENT FRAME          │                    |
|          │                               │                    |
|          └───────────────────────────────┘                    |
|                                                               |
|                 ○ Capture                                     |
|                                                               |
| [ Cancel ]                                                    |
+---------------------------------------------------------------+


====================================================================
               iOS AGENT — MEDIA QUEUE
====================================================================

+---------------------------------------------------------------+
| Upload queue                                                  |
|                                                               |
| [Photo] Medical evidence                                     |
| █████████████████░░ 82%                                      |
|                                                               |
| [Video] Field interview                                      |
| Waiting...                                                    |
|                                                               |
| [Document] Receipt                                           |
| ✓ Uploaded                                                    |
+---------------------------------------------------------------+

Offline behavior:

    capture
      ↓
    local queue
      ↓
    upload when network available
      ↓
    server confirmation

Local data is never authoritative for:

    authorization
    payment
    final status
    moderation decision


====================================================================
             iOS AGENT — CAMPAIGN CREATION
====================================================================

Same information architecture as web, but optimized for:

    one-handed use
    field conditions
    camera
    photos
    document scanning
    offline drafts
    network interruptions

STEP INDICATOR:

    ●────○────○────○────○

    Basics
      |
    Evidence
      |
    Recipient
      |
    Payout
      |
    Review


====================================================================
             iOS AGENT — CAMPAIGN STATUS
====================================================================

+---------------------------------------------------------------+
| Campaign                                                      |
|                                                               |
| Help Maria receive treatment                                  |
|                                                               |
| ● UNDER_REVIEW                                                |
|                                                               |
| Submitted Sep 08                                              |
|                                                               |
| REVIEW TIMELINE                                               |
|                                                               |
| ✓ Draft created                                               |
| ✓ Submitted                                                  |
| ● Moderator reviewing                                        |
| ○ Approved                                                   |
| ○ Active                                                     |
+---------------------------------------------------------------+


====================================================================
              iOS AGENT — CAMPAIGN ACTIVE
====================================================================

+---------------------------------------------------------------+
| Help Maria receive treatment                                  |
| ● ACTIVE                                                       |
|                                                               |
| ৳245K / ৳300K                                                 |
| █████████████████░░                                           |
|                                                               |
| [ Add update ]                                                |
|                                                               |
| [ View donations ]                                            |
|                                                               |
| [ Assistance ]                                                |
|                                                               |
| ACCOUNTABILITY                                                |
| ✓ Campaign approved                                           |
| ✓ Donations received                                          |
| ● Fundraising active                                          |
+---------------------------------------------------------------+


====================================================================
                 iOS AGENT — ASSISTANCE
====================================================================

+---------------------------------------------------------------+
| Assistance                                                     |
|                                                               |
| Campaign: Maria Treatment                                     |
|                                                               |
| PAYOUT                                                        |
| ✓ COMPLETED                                                   |
|                                                               |
| ASSISTANCE                                                    |
| ● PENDING                                                     |
|                                                               |
| [ Confirm assistance delivered ]                              |
+---------------------------------------------------------------+


====================================================================
              iOS AGENT — FINAL PROOF
====================================================================

+---------------------------------------------------------------+
| Submit assistance proof                                       |
|                                                               |
| Delivery date                                                 |
| [ Sep 09, 2026 ]                                              |
|                                                               |
| Evidence                                                      |
| [ + Receipt ]                                                 |
| [ + Photo ]                                                   |
| [ + Document ]                                                |
|                                                               |
| Notes                                                         |
| [                                                           ] |
|                                                               |
| [ Submit proof ]                                              |
+---------------------------------------------------------------+


====================================================================
                   iOS AGENT — RESTRICTED
====================================================================

If Agent status becomes:

    RESTRICTED

show:

+---------------------------------------------------------------+
| Agent account                                                   |
|                                                               |
| ⚠ Restricted                                                   |
|                                                               |
| Some Agent capabilities are temporarily limited while a       |
| review is in progress.                                        |
|                                                               |
| Existing obligations may remain visible.                       |
|                                                               |
| [ Contact support ]                                           |
+---------------------------------------------------------------+


If:

    SUSPENDED

+---------------------------------------------------------------+
| Agent account                                                   |
|                                                               |
| ⚠ SUSPENDED                                                    |
|                                                               |
| You cannot create new campaigns while your account is          |
| suspended.                                                     |
|                                                               |
| Existing information remains available where appropriate.      |
+---------------------------------------------------------------+


If:

    REVOKED

+---------------------------------------------------------------+
| Agent access                                                   |
|                                                               |
| Your Agent status has been revoked.                            |
|                                                               |
| Agent operations are no longer available.                     |
|                                                               |
| [ Contact support ]                                           |
+---------------------------------------------------------------+


====================================================================
                 CAMPAIGN STATE UI
====================================================================

The following campaign states must have corresponding UI states:

    DRAFT
    SUBMITTED
    UNDER_REVIEW
    REJECTED
    APPROVED
    ACTIVE
    EXPIRED
    TARGET_REACHED
    PAYOUT_PENDING
    ASSISTANCE_PENDING
    ASSISTANCE_DELIVERED
    FINAL_REVIEW
    SUCCESSFUL
    DISPUTED
    CANCELLED
    SUSPENDED
    FRAUDULENT
    CLOSED

Do not collapse these into:

    active
    inactive

The UI must communicate the actual lifecycle state.


====================================================================
                  CAMPAIGN STATE VISUALS
====================================================================

DRAFT

    ● Draft
    Continue editing

SUBMITTED

    ● Submitted
    Waiting for review

UNDER_REVIEW

    ● Under review
    Moderator is reviewing evidence

REJECTED

    ✕ Rejected
    Review the reason

APPROVED

    ✓ Approved
    Preparing publication

ACTIVE

    ● Active
    Accepting donations

EXPIRED

    ● Expired
    Fundraising period ended

TARGET_REACHED

    ✓ Target reached
    Funding target met; assistance process continues

PAYOUT_PENDING

    ● Payout pending
    Funds are being prepared for assistance

ASSISTANCE_PENDING

    ● Assistance pending
    Payout completed; assistance delivery in progress

ASSISTANCE_DELIVERED

    ✓ Assistance delivered
    Agent confirmed delivery

FINAL_REVIEW

    ● Final review
    Moderator reviewing outcome evidence

SUCCESSFUL

    ✓ Successful
    Assistance and final review complete

DISPUTED

    ⚠ Disputed
    Issue requires formal resolution

CANCELLED

    Cancelled

SUSPENDED

    Suspended

FRAUDULENT

    Fraudulent

CLOSED

    Closed


====================================================================
                  DONATION STATE UI
====================================================================

INITIATED
    →
PENDING
    →
PAID
    →
CONFIRMED

Failure branches:

PENDING → FAILED
INITIATED/PENDING → CANCELLED

Later:

CONFIRMED → REFUNDED
CONFIRMED → DISPUTED

User-visible examples:

PENDING:

    "Payment processing"

CONFIRMED:

    "Donation confirmed"

FAILED:

    "Payment failed"

CANCELLED:

    "Donation cancelled"

REFUNDED:

    "Donation refunded"

DISPUTED:

    "Donation under review"


====================================================================
                   PAYMENT UX RULE
====================================================================

NEVER create UI logic:

    if paymentReturnedFromProvider {
        showSuccess()
    }

Instead:

    provider
       ↓
    webhook
       ↓
    FastAPI verification
       ↓
    database transaction
       ↓
    donation CONFIRMED
       ↓
    client refreshes authoritative state

The user interface should explicitly distinguish:

    payment return
from
    payment confirmation.


====================================================================
                 PAYOUT UI
====================================================================

PAYOUT_PENDING

+---------------------------------------------------------------+
| Payout                                                        |
|                                                               |
| ● PENDING                                                     |
|                                                               |
| Funds are queued for transfer.                                |
+---------------------------------------------------------------+

PROCESSING

+---------------------------------------------------------------+
| Payout                                                        |
|                                                               |
| ● PROCESSING                                                  |
|                                                               |
| Transfer submitted to payment provider.                       |
+---------------------------------------------------------------+

COMPLETED

+---------------------------------------------------------------+
| Payout                                                        |
|                                                               |
| ✓ COMPLETED                                                   |
|                                                               |
| Funds transferred successfully.                               |
+---------------------------------------------------------------+

FAILED

+---------------------------------------------------------------+
| Payout                                                        |
|                                                               |
| ✕ FAILED                                                      |
|                                                               |
| This payout attempt failed.                                   |
| A new payout attempt may be created.                          |
+---------------------------------------------------------------+


====================================================================
                 REPORTING UX
====================================================================

USER:

Campaign detail
    ↓
Report
    ↓
Reason
    ↓
Description
    ↓
Submit
    ↓
Report confirmation


REPORT REASONS:

    Fake / misleading campaign
    Duplicate campaign
    Suspicious Agent
    Incorrect information
    Other


REPORT SCREEN:

+---------------------------------------------------------------+
| Report campaign                                               |
|                                                               |
| What's wrong?                                                |
|                                                               |
| ○ Fake / misleading information                               |
| ○ Duplicate campaign                                         |
| ○ Suspicious Agent                                            |
| ○ Other                                                       |
|                                                               |
| Details                                                       |
| [                                                           ] |
|                                                               |
| [ Submit report ]                                             |
+---------------------------------------------------------------+


====================================================================
                  DISPUTE UX
====================================================================

Dispute is different from a simple report.

Donation / Campaign issue
        ↓
Report escalation OR direct issue
        ↓
Dispute OPEN
        ↓
UNDER_REVIEW
        ↓
RESOLVED

Possible outcomes:

    NO_ISSUE
    REFUND
    PARTIAL_REFUND
    CAMPAIGN_SUSPENDED
    AGENT_RESTRICTED
    PAYMENT_INVESTIGATION
    ESCALATED


====================================================================
                     EMPTY STATES
====================================================================

Never show empty screens.

SAVED EMPTY:

+---------------------------------------------------------------+
|                         [Illustration]                        |
|                                                               |
| Nothing saved yet                                            |
|                                                               |
| Save campaigns you want to follow later.                     |
|                                                               |
| [ Discover campaigns ]                                       |
+---------------------------------------------------------------+


DONATIONS EMPTY:

+---------------------------------------------------------------+
|                         [Illustration]                        |
|                                                               |
| Your donation history will appear here.                       |
|                                                               |
| [ Discover campaigns ]                                       |
+---------------------------------------------------------------+


FOLLOWING EMPTY:

+---------------------------------------------------------------+
|                         [Illustration]                        |
|                                                               |
| You're not following any Agents yet.                          |
|                                                               |
| [ Discover Agents ]                                           |
+---------------------------------------------------------------+


====================================================================
                       LOADING STATES
====================================================================

Use skeleton UI.

Campaign card:

+---------------------------------------------------------------+
| █████████████████████████                                    |
|                                                               |
| █████████████████                                             |
| ███████████████                                               |
|                                                               |
| ████████████████████                                          |
+---------------------------------------------------------------+

Never show a blank screen while waiting.


====================================================================
                       ERROR STATES
====================================================================

NETWORK ERROR:

+---------------------------------------------------------------+
|                     [Network icon]                            |
|                                                               |
| Couldn't load this page                                      |
|                                                               |
| Check your connection and try again.                          |
|                                                               |
| [ Try again ]                                                 |
+---------------------------------------------------------------+


SERVER ERROR:

+---------------------------------------------------------------+
| Something went wrong                                          |
|                                                               |
| We couldn't complete that request.                             |
|                                                               |
| [ Try again ]                                                 |
+---------------------------------------------------------------+


PERMISSION ERROR:

+---------------------------------------------------------------+
| Access unavailable                                            |
|                                                               |
| You don't have permission to perform this action.              |
+---------------------------------------------------------------+


====================================================================
                  FORM VALIDATION
====================================================================

Use inline errors.

BAD:

    "Invalid input"

GOOD:

    Target amount must be greater than ৳0.

GOOD:

    Please select a campaign category.

GOOD:

    This document type is not supported.

Never rely only on red borders.


====================================================================
                      CONFIRMATION SHEETS
====================================================================

Destructive action:

+---------------------------------------------------------------+
| Suspend campaign?                                             |
|                                                               |
| This will stop public activity while the case is investigated. |
|                                                               |
| [ Cancel ]                         [ Suspend ]                 |
+---------------------------------------------------------------+


Important action:

+---------------------------------------------------------------+
| Submit campaign for review?                                  |
|                                                               |
| You will be unable to freely edit the submitted campaign.      |
|                                                               |
| [ Cancel ]                         [ Submit ]                  |
+---------------------------------------------------------------+


====================================================================
                     ACCESSIBILITY
====================================================================

The UI must support:

    Dynamic Type
    VoiceOver
    Screen readers
    sufficient contrast
    keyboard navigation on web
    focus states
    large tap targets
    meaningful accessibility labels
    semantic headings
    reduced motion

Never encode:

    "green = verified"

without text.

Use:

    "✓ Verified case"


====================================================================
                    PRIVACY UX
====================================================================

Sensitive data includes examples such as:

    NID
    medical reports
    bank information
    private address
    private phone
    internal moderator notes

Public campaign page:

    SHOW PUBLIC INFORMATION

Moderator / authorized Agent:

    SHOW RESTRICTED INFORMATION WHEN AUTHORIZED

Unauthorised user:

    DO NOT EXPOSE

The UI must never accidentally leak restricted data through:

    previews
    search
    notifications
    logs
    URLs
    thumbnails
    browser cache
    share sheets


====================================================================
                PUBLIC CAMPAIGN CARD COMPONENT
====================================================================

+---------------------------------------------------------------+
| [                    IMAGE                                    ]|
|                                                               |
| ✓ VERIFIED CASE                                               |
|                                                               |
| Medical                                                     |
| Help Maria receive treatment                                  |
|                                                               |
| ৳245,000                                                     |
| raised of ৳300,000                                           |
|                                                               |
| █████████████████░░                                           |
|                                                               |
| 82%                         14 days left                       |
|                                                               |
| [ View campaign ]                                      ♡      |
+---------------------------------------------------------------+


====================================================================
                 AGENT CARD COMPONENT
====================================================================

+---------------------------------------------------------------+
| [Avatar]                                                      |
|                                                               |
| Rahim Humanitarian Network                                   |
| ✓ VERIFIED AGENT                                              |
|                                                               |
| 42 campaigns                                                 |
| 97% update completion                                        |
| 4.9 ★                                                        |
|                                                               |
| [ Follow ]                                                   |
+---------------------------------------------------------------+


====================================================================
                   TIMELINE COMPONENT
====================================================================

+---------------------------------------------------------------+
| ACCOUNTABILITY                                                |
|                                                               |
| ✓ Campaign approved                                           |
| │                                                             |
| ✓ Investigation completed                                    |
| │                                                             |
| ✓ Evidence reviewed                                          |
| │                                                             |
| ● Donations active                                           |
| │                                                             |
| ○ Assistance                                                  |
| │                                                             |
| ○ Final review                                                |
+---------------------------------------------------------------+


====================================================================
                PROGRESS COMPONENT
====================================================================

Target:

    ৳245,000 / ৳300,000

    █████████████████░░░░

    82%


When target is reached:

    ✓ Target reached

    BUT DO NOT show:

    ✓ Successful

until:

    assistance delivered
    +
    final review
    +
    moderator approval


====================================================================
                 TRUST / EVIDENCE COMPONENT
====================================================================

+---------------------------------------------------------------+
| WHY VERIFIED                                                  |
|                                                               |
| ✓ Agent identity verified                                     |
| ✓ Case investigated                                           |
| ✓ Evidence reviewed                                           |
| ✓ Campaign reviewed                                           |
|                                                               |
| [ Learn more ]                                                |
+---------------------------------------------------------------+


====================================================================
                     TOASTS
====================================================================

Success:

    ✓ Campaign saved

Information:

    Donation is being verified.

Warning:

    This Agent is currently suspended.

Error:

    We couldn't upload the document.


====================================================================
                  MOBILE SHEET PATTERN
====================================================================

For filters, sort, payment method, confirmation:

+---------------------------------------------------------------+
|                                                               |
|                    SHEET TITLE                                |
|                                                               |
| Option 1                                                      |
| Option 2                                                      |
| Option 3                                                      |
|                                                               |
| [ Done ]                                                      |
+---------------------------------------------------------------+


====================================================================
                   MOBILE NAVIGATION RULE
====================================================================

Use:

    Tab navigation
for
    top-level persistent areas.

Use:

    NavigationStack
for
    hierarchical screens.

Use:

    Sheet
for
    temporary choices / filters / confirmations.

Use:

    Full-screen cover
for
    immersive workflows such as camera/document capture.


====================================================================
                  WEB RESPONSIVE BREAKPOINTS
====================================================================

DESKTOP:

    max content width ~1200–1280

TABLET:

    responsive two-column layout

MOBILE WEB:

    one-column layout
    bottom-oriented actions where appropriate
    sticky donation action

Campaign mobile:

+---------------------------------------------------------------+
| ←                                                             |
| [IMAGE]                                                       |
|                                                               |
| ✓ VERIFIED                                                    |
| Campaign title                                               |
|                                                               |
| ৳245K / ৳300K                                                |
| ████████████████                                             |
|                                                               |
| ...                                                           |
|                                                               |
| [ Donate ]                                                    |
+---------------------------------------------------------------+


====================================================================
                  STICKY DONATION ACTION
====================================================================

On mobile campaign detail:

+---------------------------------------------------------------+
|                                                               |
|                      page content                             |
|                                                               |
+---------------------------------------------------------------+
| ৳1,000                                      [ Donate ]         |
+---------------------------------------------------------------+

The sticky action must not hide important content.


====================================================================
                 GLOBAL SEARCH EXPERIENCE
====================================================================

SEARCH STATES:

EMPTY:

    Search campaigns, causes, locations...

TYPING:

    Searching...

RESULTS:

    Campaigns
    Agents
    Categories

NO RESULTS:

+---------------------------------------------------------------+
| No campaigns found                                            |
|                                                               |
| Try another search term or remove a filter.                   |
|                                                               |
| [ Clear filters ]                                             |
+---------------------------------------------------------------+


====================================================================
               iOS NOTIFICATION DEEP LINKS
====================================================================

Notification:

    Donation confirmed
        ↓
    Donation receipt

Notification:

    Campaign update
        ↓
    Campaign detail → Updates

Notification:

    Assistance delivered
        ↓
    Campaign accountability

Notification:

    Agent application updated
        ↓
    Agent application status


====================================================================
                 WEB ROUTE ARCHITECTURE
====================================================================

PUBLIC

/
 /discover
 /campaigns
 /campaigns/[id]
 /agents
 /agents/[id]
 /how-it-works
 /trust
 /about
 /help
 /auth/login
 /auth/register
 /auth/verify
 /auth/forgot-password
 /auth/reset-password


DONOR

/app
/app/discover
/app/following
/app/saved
/app/donations
/app/donations/[id]
/app/help-requests
/app/help-requests/new
/app/help-requests/[id]
/app/notifications
/app/profile
/app/profile/edit
/app/agent-application


AGENT

/agent
/agent/requests
/agent/requests/[id]
/agent/cases
/agent/cases/[id]
/agent/campaigns
/agent/campaigns/new
/agent/campaigns/[id]
/agent/campaigns/[id]/edit
/agent/campaigns/[id]/updates
/agent/campaigns/[id]/assistance
/agent/analytics
/agent/profile


MODERATOR

/moderator
/moderator/campaigns
/moderator/campaigns/[id]
/moderator/agents
/moderator/agents/[id]
/moderator/reports
/moderator/reports/[id]
/moderator/disputes
/moderator/disputes/[id]


ADMIN

/admin
/admin/users
/admin/users/[id]
/admin/agents
/admin/moderators
/admin/moderators/[id]
/admin/permissions
/admin/campaigns
/admin/donations
/admin/payouts
/admin/reports
/admin/disputes
/admin/finance
/admin/audit
/admin/settings
/admin/security


====================================================================
                   iOS SCREEN INVENTORY
====================================================================

LAUNCH

I00 Splash
I01 Onboarding 1
I02 Onboarding 2
I03 Onboarding 3

AUTH

I10 Welcome
I11 Register
I12 Verify
I13 Login
I14 Forgot Password
I15 Reset Password

DONOR

I20 Home
I21 Discover
I22 Search
I23 Campaign Detail
I24 Why Verified
I25 Agent Profile
I30 Donation Amount
I31 Donation Payment
I32 Payment Redirect
I33 Donation Pending
I34 Donation Confirmed
I35 Receipt
I40 Saved
I41 Following
I42 Notifications
I43 Profile

HELP

I50 Request Help
I51 Request Help Details
I52 Request Help Review
I53 Request Help Submitted
I54 Help Request Status
I55 Help Request Timeline

AGENT

IA00 Agent Introduction
IA01 Cases
IA02 Available Requests
IA03 Request Detail
IA04 Capture Center
IA05 Investigation
IA06 Evidence
IA07 Verify Case
IA10 Create Campaign
IA11 Campaign Evidence
IA12 Recipient
IA13 Payout
IA14 Preview
IA15 Submit
IA20 My Campaigns
IA21 Campaign Detail
IA22 Campaign Updates
IA23 Assistance
IA24 Assistance Proof
IA25 Analytics
IA30 Agent Status
IA31 Restricted
IA32 Suspended
IA33 Revoked


====================================================================
                COMPLETE USER JOURNEY — DONOR
====================================================================

OPEN APP
   ↓
ONBOARDING
   ↓
REGISTER
   ↓
VERIFY
   ↓
HOME
   ↓
DISCOVER
   ↓
SEARCH / FILTER
   ↓
CAMPAIGN DETAIL
   ↓
WHY VERIFIED?
   ↓
UNDERSTAND CASE
   ↓
SELECT DONATION
   ↓
PAYMENT
   ↓
PAYMENT PROVIDER
   ↓
WEBHOOK VERIFICATION
   ↓
DONATION CONFIRMED
   ↓
RECEIPT
   ↓
FOLLOW CAMPAIGN
   ↓
RECEIVE UPDATE
   ↓
ASSISTANCE DELIVERED
   ↓
FINAL OUTCOME


====================================================================
             COMPLETE JOURNEY — HELP SEEKER
====================================================================

USER
 ↓
REQUEST HELP
 ↓
CATEGORY
 ↓
SUBCATEGORY
 ↓
DESCRIPTION
 ↓
LOCATION
 ↓
REVIEW
 ↓
SUBMIT
 ↓
SUBMITTED
 ↓
AVAILABLE
 ↓
AGENT CLAIMS
 ↓
INVESTIGATING
 ↓
VERIFIED CASE
 ↓
CAMPAIGN CREATED
 ↓
MODERATOR REVIEW
 ↓
APPROVED
 ↓
ACTIVE
 ↓
DONATIONS
 ↓
TARGET REACHED / FUNDRAISING ENDS
 ↓
PAYOUT
 ↓
ASSISTANCE
 ↓
PROOF
 ↓
FINAL REVIEW
 ↓
SUCCESSFUL
 ↓
CLOSED


====================================================================
               COMPLETE JOURNEY — AGENT
====================================================================

USER
 ↓
APPLY
 ↓
PENDING
 ↓
UNDER REVIEW
 ↓
MODERATOR DECISION
 |
 +---- REJECTED
 |
 +---- MORE INFORMATION
 |
 +---- VERIFIED
          ↓
      AGENT DASHBOARD
          ↓
      AVAILABLE REQUEST
          ↓
      CLAIM
          ↓
      INVESTIGATE
          ↓
      COLLECT EVIDENCE
          ↓
      VERIFIED CASE
          ↓
      CREATE CAMPAIGN
          ↓
      DRAFT
          ↓
      SUBMIT
          ↓
      MODERATOR REVIEW
          ↓
      APPROVED
          ↓
      ACTIVE
          ↓
      POST UPDATES
          ↓
      TARGET REACHED
          ↓
      PAYOUT
          ↓
      ASSISTANCE
          ↓
      PROOF
          ↓
      FINAL REVIEW
          ↓
      SUCCESSFUL


====================================================================
            COMPLETE JOURNEY — MODERATOR
====================================================================

LOGIN
 ↓
MODERATOR DASHBOARD
 ↓
CAMPAIGN QUEUE
 ↓
OPEN CAMPAIGN
 ↓
REVIEW EVIDENCE
 ↓
REVIEW RISK SIGNALS
 ↓
REVIEW AGENT
 ↓
DECISION
 |
 +---- REQUEST MORE INFORMATION
 |
 +---- REJECT
 |
 +---- APPROVE
          ↓
        ACTIVE

OTHER FLOWS:

Agent Queue
 ↓
Agent Review
 ↓
Approve / Reject / More Information

Report Queue
 ↓
Investigate
 ↓
Resolve / Escalate

Dispute Queue
 ↓
Investigate
 ↓
Resolution


====================================================================
                 COMPLETE JOURNEY — ADMIN
====================================================================

LOGIN
 ↓
ADMIN DASHBOARD
 |
 +--> Users
 |
 +--> Agents
 |
 +--> Moderators
 |       |
 |       +--> Create moderator
 |       +--> Configure permissions
 |
 +--> Finance
 |       |
 |       +--> Donations
 |       +--> Payouts
 |       +--> Refunds
 |
 +--> Reports
 |
 +--> Disputes
 |
 +--> Audit
 |
 +--> System Settings
 |
 +--> Security


====================================================================
                  STATE MACHINE UI RULE
====================================================================

The frontend must never independently invent state transitions.

The backend is authoritative.

Example:

Campaign:

DRAFT
  ↓
SUBMITTED
  ↓
UNDER_REVIEW
  ↓
APPROVED
  ↓
ACTIVE
  ↓
TARGET_REACHED
  ↓
PAYOUT_PENDING
  ↓
ASSISTANCE_PENDING
  ↓
ASSISTANCE_DELIVERED
  ↓
FINAL_REVIEW
  ↓
SUCCESSFUL

The frontend renders available actions based on:

    authenticated user
    server role
    server permission
    object ownership
    object state
    agent status

Never based on a client-controlled role value.


====================================================================
                  ROLE-BASED UI RULE
====================================================================

USER:

    campaign:view
    donation:create
    donation:view_own
    help_request:create
    follow:manage
    report:create
    agent:apply

AGENT:

    USER permissions
    +
    verified-agent permissions

MODERATOR:

    individually configured permissions

ADMIN:

    full permissions


IMPORTANT:

A UI button being hidden is NOT security.

The backend must independently enforce authorization.

Frontend:

    hides unavailable action

Backend:

    rejects unauthorized action


====================================================================
                OBJECT OWNERSHIP UX
====================================================================

Example:

Agent A owns Campaign A.

Agent B opens Campaign A.

Agent B may:

    view public campaign

but cannot:

    edit Agent A's draft

The UI should not display:

    [Edit]

to Agent B.

If Agent B manually calls the API anyway:

    backend → 403 / 404


====================================================================
               RESTRICTED EVIDENCE UX
====================================================================

PUBLIC USER:

+---------------------------------------------------------------+
| Supporting evidence                                           |
|                                                               |
| ✓ Evidence reviewed                                          |
|                                                               |
| Some evidence is restricted to protect personal privacy.     |
|                                                               |
| [ Why? ]                                                      |
+---------------------------------------------------------------+

AUTHORIZED MODERATOR:

+---------------------------------------------------------------+
| Restricted evidence                                           |
|                                                               |
| 🔒 Authorized access                                          |
|                                                               |
| [ Open document ]                                             |
+---------------------------------------------------------------+

UNAUTHORIZED:

    DO NOT RETURN THE FILE.


====================================================================
                 DONATION TRANSPARENCY
====================================================================

Donation screen:

+---------------------------------------------------------------+
| Your donation                                                 |
|                                                               |
| Campaign contribution             ৳1,000                       |
| Payment fee                       ৳...                         |
| Platform fee                      ৳...                         |
| Agent fee                         ৳...                         |
| Net amount                        ৳...                         |
|                                                               |
| Total charged                      ৳1,000                      |
+---------------------------------------------------------------+

The calculation must reconcile:

    payment_fee
    +
    platform_fee
    +
    agent_fee
    +
    net_amount

    =
    donation amount

Use backend-calculated values.


====================================================================
                     NO DARK PATTERNS
====================================================================

Do NOT:

    hide fees
    force donation amounts
    shame users for not donating
    repeatedly popup donation requests
    use misleading urgency
    expose private recipient information
    artificially inflate trust indicators
    present target reached as successful
    present uploaded evidence as verified evidence


====================================================================
                  HUMAN DIGNITY RULE
====================================================================

Images and stories should represent recipients respectfully.

Avoid:

    sensational thumbnails
    humiliating framing
    unnecessary medical graphic imagery
    exploitative wording

Prefer:

    dignified portrait
    clear situation
    factual language
    contextual information
    privacy protection


====================================================================
                 COMPONENT LIBRARY
====================================================================

Create reusable components:

GLOBAL

    PHButton
    PHSecondaryButton
    PHTextField
    PHSearchField
    PHCard
    PHBadge
    PHAvatar
    PHDivider
    PHSkeleton
    PHEmptyState
    PHErrorState
    PHLoadingState
    PHToast
    PHBottomSheet
    PHConfirmationDialog
    PHStatusBadge

TRUST

    PHVerifiedBadge
    PHVerificationSummary
    PHVerificationTimeline
    PHEvidenceIndicator
    PHRestrictedBadge

CAMPAIGN

    PHCampaignCard
    PHCampaignHeader
    PHCampaignProgress
    PHCampaignTimeline
    PHCampaignUpdateCard
    PHDonationSummary
    PHCampaignStateView

AGENT

    PHAgentCard
    PHAgentVerification
    PHAgentStats
    PHCaseCard
    PHInvestigationChecklist
    PHEvidenceCard

DONATION

    PHDonationAmountSelector
    PHPaymentMethodSelector
    PHPaymentStatus
    PHReceipt

MODERATION

    PHReviewQueue
    PHReviewChecklist
    PHRiskSignal
    PHDecisionBar

ADMIN

    PHMetricCard
    PHDataTable
    PHAuditLog
    PHPermissionMatrix


====================================================================
                iOS ARCHITECTURE EXPECTATION
====================================================================

SwiftUI:

    View
      ↓
    ViewModel
      ↓
    Use Case / Service
      ↓
    Repository
      ↓
    API Client
      ↓
    FastAPI

SwiftData:

    cache
    offline drafts
    saved campaigns
    local state

Keychain:

    access token
    refresh token
    security credentials

FileManager:

    temporary media
    upload queue

The server remains authoritative.

This matches the project's architecture specification.


====================================================================
                WEB ARCHITECTURE EXPECTATION
====================================================================

Next.js / React

    Route
      ↓
    Page
      ↓
    UI Components
      ↓
    Client state / server state
      ↓
    API client
      ↓
    FastAPI

Use reusable:

    layouts
    components
    forms
    tables
    status systems
    error boundaries
    loading states


====================================================================
                   DESIGN FILE STRUCTURE
====================================================================

Figma should be organized:

PLUMIHOPE
|
+-- 00 Foundations
|   |
|   +-- Colors
|   +-- Typography
|   +-- Spacing
|   +-- Icons
|   +-- Shadows
|
+-- 01 Components
|   |
|   +-- Buttons
|   +-- Inputs
|   +-- Cards
|   +-- Campaign
|   +-- Trust
|   +-- Donation
|   +-- Navigation
|
+-- 02 Public Web
|
+-- 03 Donor Web
|
+-- 04 Agent Web
|
+-- 05 Moderator Web
|
+-- 06 Admin Web
|
+-- 07 iOS
|
+-- 08 User Flows
|
+-- 09 States
|
+-- 10 Prototypes


====================================================================
                  FIGMA COMPONENT VARIANTS
====================================================================

BUTTON

    Primary
    Secondary
    Tertiary
    Destructive
    Disabled
    Loading

CAMPAIGN STATUS

    Draft
    Submitted
    Under Review
    Approved
    Active
    Target Reached
    Assistance Pending
    Assistance Delivered
    Final Review
    Successful
    Disputed
    Suspended
    Fraudulent
    Closed

AGENT STATUS

    Pending
    Under Review
    Verified
    Restricted
    Suspended
    Revoked

DONATION STATUS

    Initiated
    Pending
    Paid
    Confirmed
    Failed
    Cancelled
    Refunded
    Disputed


====================================================================
                 Figma FLOW PROTOTYPES
====================================================================

FLOW 01:

Donor discovers campaign

Home
 ↓
Discover
 ↓
Campaign
 ↓
Why Verified
 ↓
Donate
 ↓
Payment
 ↓
Confirmation
 ↓
Receipt


FLOW 02:

Request help

Profile
 ↓
Request Help
 ↓
Category
 ↓
Details
 ↓
Review
 ↓
Submitted
 ↓
Request Status


FLOW 03:

Become Agent

Profile
 ↓
Become Agent
 ↓
Introduction
 ↓
Application
 ↓
Identity
 ↓
Submit
 ↓
Under Review
 ↓
Verified / Rejected / More Info


FLOW 04:

Agent investigates

Agent Home
 ↓
Available Requests
 ↓
Request Detail
 ↓
Claim
 ↓
Investigation
 ↓
Capture Evidence
 ↓
Verify Case
 ↓
Create Campaign


FLOW 05:

Campaign moderation

Moderator Home
 ↓
Campaign Queue
 ↓
Review
 ↓
Evidence
 ↓
Checklist
 ↓
Approve / Reject / More Info


FLOW 06:

Donation → outcome

Campaign
 ↓
Donate
 ↓
Payment
 ↓
Confirmed
 ↓
Campaign Update
 ↓
Target Reached
 ↓
Payout
 ↓
Assistance
 ↓
Proof
 ↓
Final Review
 ↓
Successful


====================================================================
                 MVP PRIORITY FOR DESIGN
====================================================================

MUST DESIGN FIRST:

01 Authentication
02 Donor Home
03 Campaign Discovery
04 Campaign Detail
05 Why Verified
06 Donation
07 Receipt
08 Help Request
09 Agent Application
10 Agent Dashboard
11 Help Request Investigation
12 Evidence Capture
13 Campaign Creation
14 Moderator Campaign Review
15 Campaign Approval / Rejection
16 Campaign Updates
17 Donation History
18 Notifications
19 Reports
20 Basic Admin Dashboard


====================================================================
                    MVP EXCLUDED / LATER
====================================================================

Do not make advanced features appear as MVP requirements.

Deferred:

    AI donation assistant
    semantic search
    recommendation engine
    advanced fraud ML
    complex realtime chat
    multi-country payments
    enterprise analytics
    Kafka
    Kubernetes
    advanced event-driven architecture

Design placeholders only if needed for future extensibility.


====================================================================
                     AI DESIGN PRINCIPLE
====================================================================

Future AI may:

    summarize
    recommend
    search
    extract
    detect inconsistencies
    assist moderators

AI must NOT autonomously:

    approve campaign
    confirm payment
    declare fraud
    make irreversible humanitarian decisions

Therefore future AI UI should say:

    "AI-assisted insight"

not:

    "AI verified this person"


====================================================================
                     SECURITY UI RULES
====================================================================

Never trust:

    client role
    client permission
    client payment success
    client evidence verification
    client state transitions

Always reflect:

    server-authoritative state.


====================================================================
                     RESPONSIVE RULES
====================================================================

WEB DESKTOP:

    sidebar for operational dashboards

WEB MOBILE:

    compact navigation
    stacked cards
    sticky actions

iOS:

    native navigation
    tab bar
    sheets
    full-screen capture
    native camera
    native document scanner


====================================================================
                DASHBOARD SIDEBAR — AGENT
====================================================================

+--------------------------------+
| PLUMIHOPE                      |
|                                |
| Overview                       |
| Help Requests                  |
| My Cases                       |
| Campaigns                      |
| Updates                        |
| Assistance                     |
| Analytics                      |
|                                |
| ----------------------------   |
| Profile                        |
| Settings                       |
+--------------------------------+


====================================================================
             DASHBOARD SIDEBAR — MODERATOR
====================================================================

+--------------------------------+
| PLUMIHOPE MODERATION           |
|                                |
| Overview                       |
| Campaign Review                |
| Agent Review                   |
| Reports                        |
| Disputes                       |
|                                |
| ----------------------------   |
| Notifications                  |
| Profile                        |
+--------------------------------+


====================================================================
                DASHBOARD SIDEBAR — ADMIN
====================================================================

+--------------------------------+
| PLUMIHOPE ADMIN                |
|                                |
| Overview                       |
| Users                          |
| Agents                         |
| Moderators                     |
| Campaigns                      |
| Donations                      |
| Payouts                        |
| Reports                        |
| Disputes                       |
| Finance                        |
| Audit Log                      |
| Security                       |
| Settings                       |
+--------------------------------+


====================================================================
                 UI DATA FRESHNESS
====================================================================

Financial and authorization data must be refreshed from server.

Example:

User opens:

    Campaign Detail

Client cache says:

    ACTIVE

Server says:

    SUSPENDED

UI must show:

    SUSPENDED

not:

    ACTIVE

Likewise:

    donation status
    payout status
    agent status
    permissions
    campaign state


====================================================================
                  OFFLINE IOS BEHAVIOR
====================================================================

Allowed offline:

    view cached campaigns
    view saved campaigns
    write investigation draft
    capture media
    queue upload
    write campaign draft

Not authoritative offline:

    payment confirmation
    permission changes
    campaign approval
    Agent verification
    final campaign state
    payout confirmation

When connection returns:

    sync
      ↓
    server response
      ↓
    resolve conflicts
      ↓
    update local state


====================================================================
                  DEEP LINK ARCHITECTURE
====================================================================

plumihope://campaign/{id}

plumihope://agent/{id}

plumihope://donation/{id}

plumihope://help-request/{id}

plumihope://notification/{id}


Web equivalents:

    /campaigns/{id}
    /agents/{id}
    /app/donations/{id}
    /app/help-requests/{id}


====================================================================
                 ACCESSIBILITY LABEL EXAMPLES
====================================================================

Campaign card:

    "Medical campaign, Help Maria receive treatment,
     245 thousand taka raised of 300 thousand,
     82 percent funded, verified case."

Verified badge:

    "Verified case."

Donation button:

    "Donate one thousand taka."

Progress:

    "82 percent funded."


====================================================================
                 UX COPY STYLE
====================================================================

Use:

    "Verified case"

not:

    "100% guaranteed"

Use:

    "Evidence reviewed"

not:

    "Absolutely authentic"

Use:

    "Assistance delivered"

not:

    "Problem solved forever"

Use factual language.

Trust must be earned through evidence.


====================================================================
                   DESIGN QA CHECKLIST
====================================================================

Every screen must answer:

[ ] Who am I?
[ ] Where am I?
[ ] What is happening?
[ ] What can I do?
[ ] Why can I do it?
[ ] What happens next?

Every important workflow must show:

[ ] Current state
[ ] Previous meaningful event
[ ] Next possible action
[ ] Timestamp where relevant


====================================================================
                 ENGINEERING HANDOFF RULE
====================================================================

Every Figma screen should map to:

    Screen ID
    Route
    User role
    Required permission
    Required object state
    API data
    Components
    Loading state
    Empty state
    Error state
    Success state
    Accessibility labels


Example:

SCREEN:

    A20_CREATE_CAMPAIGN

ROLE:

    AGENT

STATUS:

    agent_status = VERIFIED

PERMISSION:

    campaign:create

SOURCE:

    VERIFIED_CASE Help Request

API:

    POST /campaigns

STATES:

    loading
    validation error
    success
    authorization failure
    network failure


====================================================================
                 FINAL IMPLEMENTATION COMMAND
====================================================================

AI CODING AGENT:

You are implementing PlumiHope from the provided product documentation
and this UI/UX specification.

DO NOT treat the ASCII diagrams as decorative documentation.

Treat every screen as an implementation contract.

For every screen:

1. Create the correct route/view.
2. Create the correct navigation behavior.
3. Implement loading state.
4. Implement empty state.
5. Implement error state.
6. Implement success state.
7. Implement permission-aware actions.
8. Implement state-aware actions.
9. Implement responsive behavior.
10. Implement accessibility.
11. Connect to the appropriate backend API.
12. Never trust client-side role or payment state.
13. Keep server state authoritative.
14. Preserve sensitive-data boundaries.
15. Use reusable components.
16. Do not duplicate UI logic unnecessarily.
17. Keep business rules out of purely presentational components.
18. Follow the documented state machines.
19. Follow the Role & Permission Matrix.
20. Add tests for important interaction and authorization boundaries.

====================================================================
                    IMPLEMENTATION ORDER
====================================================================

BUILD IN THIS ORDER:

PHASE 01
Design system
    ↓
components
    ↓
navigation
    ↓
authentication UI

PHASE 02
Donor experience
    ↓
Home
    ↓
Discover
    ↓
Campaign Detail
    ↓
Why Verified
    ↓
Donation
    ↓
Receipt

PHASE 03
Help Request
    ↓
Create
    ↓
Status
    ↓
Timeline

PHASE 04
Agent
    ↓
Application
    ↓
Dashboard
    ↓
Requests
    ↓
Investigation
    ↓
Evidence
    ↓
Campaign creation

PHASE 05
Moderator
    ↓
Queue
    ↓
Campaign review
    ↓
Agent review
    ↓
Reports
    ↓
Disputes

PHASE 06
Admin
    ↓
Overview
    ↓
Users
    ↓
Moderators
    ↓
Permissions
    ↓
Finance
    ↓
Payouts
    ↓
Audit
    ↓
Settings

PHASE 07
Polish
    ↓
Loading
    ↓
Errors
    ↓
Empty states
    ↓
Accessibility
    ↓
Responsive
    ↓
Animations
    ↓
Micro-interactions


====================================================================
                 FINAL PRODUCT EXPERIENCE
====================================================================

A DONOR SHOULD FEEL:

    "I understand this case."

    "I understand why it is verified."

    "I know who investigated it."

    "I know where my money goes."

    "I can see what happened afterward."


AN AGENT SHOULD FEEL:

    "This app helps me do humanitarian field work."

    "I can investigate efficiently."

    "I can collect evidence from my phone."

    "I can manage campaigns responsibly."

    "The system protects sensitive information."


A MODERATOR SHOULD FEEL:

    "I can review cases efficiently."

    "I can see the evidence I am authorized to access."

    "The workflow makes decisions traceable."

    "The system prevents accidental invalid transitions."


AN ADMIN SHOULD FEEL:

    "I can govern the platform."

    "I can control permissions."

    "I can see financial and operational health."

    "Every sensitive action is auditable."


====================================================================
                       THE PLUMIHOPE RULE
====================================================================

DO NOT DESIGN A DONATION WEBSITE.

DESIGN A TRUST SYSTEM.

The product experience should make this loop visible:

    HELP REQUEST
         ↓
    INVESTIGATION
         ↓
    EVIDENCE
         ↓
    VERIFICATION
         ↓
    CAMPAIGN
         ↓
    DONATION
         ↓
    PAYOUT
         ↓
    ASSISTANCE
         ↓
    PROOF
         ↓
    FINAL REVIEW
         ↓
    OUTCOME

The user should never have to wonder:

    "What happened to my donation?"

The system should be designed so that the answer is always traceable.

====================================================================
                         END OF SPEC
====================================================================