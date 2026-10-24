# Okta IAM Lab Series - Hands-On Architecture & Implementation
## Architecture Overview
Conceptual HR Source (simulated) → AD `allenlab.local` → Okta `*.okta.com - redacted` → RBAC Groups → Apps (Slack, Workspace, SharePoint) → Adaptive MFA / Zero Trust → JML Automation
 ![Architecture_Overview](screenshots/Architecture_Overview.png)
 
**Author:** Sanjeev Shrestha | Dallas–Fort Worth Area, TX (Shrestha Technologies)  
**Target Roles:** IAM Engineer / IAM Developer (2027)  
**Certification Focus:** Preparing for Okta Certified Professional (OCP)  
**Environment:** Okta Developer Tenant (*.okta.com - redacted) 

---



## Executive Summary & Business Impact

Enterprise IAM across 6 labs using Okta, AD, SAML 2.0, and Adaptive MFA.

* **Tenant Foundation (Lab 1):** Core Okta tenant `*.okta.com - redacted`, custom profile attributes, Groups RBAC, Global Session + Auth + Enrollment Policies.
* **Access Governance (Lab 3+4):** Group-based provisioning, access-sprawl audit via System Log `application.user_membership.add`, least-privilege via group app assignments for Slack, Workspace, SharePoint.
* **Lifecycle Automation (Lab 2+6):** AD `allenlab.local` as source with DelAuth + Full/Incremental Import via AD Agent, JML automation with PowerShell + CSV batch `jml-batch.csv`, Unassigned → Confirm → Active/Deactivated.
* **Centralized Auth (Lab 4):** SAML 2.0 federation with attribute mapping across Slack, Google Workspace, SharePoint.
* **Zero Trust (Lab 5):** Network Zones Trusted/Untrusted IP, Adaptive Sign-On + Step-Up High Assurance for SharePoint, Passwordless Okta Verify Push with Number Matching.

---

## Key Skills Demonstrated

* Okta Tenant Administration & Profile Editor
* Active Directory (AD) Integration & Delegated Authentication
* Role-Based Access Control (RBAC) Design
* SAML 2.0 SSO Federation & Attribute Mapping
* Adaptive Risk-Based Authentication & Network Zones
* Step-Up Authentication & Passwordless Policies
* User Lifecycle Management (JML) & Access Sprawl Audit

---
## Lab Execution Status

| Lab Phase | Focus Area | Status | Completion Date |
| :--- | :--- | :---: | :---: |
| **Lab 1** | [Tenant Setup & Core Identity Foundation](#lab-1-okta-tenant-setup--configuration) | Completed | Oct 19, 2026 |
| **Lab 2** | [Active Directory Integration & DelAuth](#lab-2-active-directory-integration--delegated-authentication) | Completed | Oct 21, 2026 |
| **Lab 3** | [RBAC Design & Access Sprawl Investigation](#lab-3-rbac-design--access-sprawl-investigation) | Completed | Oct 21, 2026 |
| **Lab 4** | [SAML 2.0 SSO Application Integration](#lab-4-saml-20-application-integration) | Completed | Oct 21, 2026 |
| **Lab 5** | [MFA, Adaptive Authentication & Step-Up](#lab-5-adaptive-mfa-step-up-authentication--zero-trust) | Completed | Oct 22, 2026 |
| **Lab 6** | [Advanced JML Lifecycle Automation](#lab-6---okta-jml-lifecycle-automation) | Completed | Oct 23, 2026 |

---


## Detailed Lab Implementations & Visual Proof

### Lab 1: Okta Tenant Setup & Configuration

**Key Learnings & Takeaways:**
* Established core tenant infrastructure including branding, directory schema, custom profile attributes, and group structures prior to app assignments.
* Isolated Global Session Policies from application-level Authentication Policies and Authenticator Enrollment Policies to maintain granular access control.

<details>
<summary>📸 <b>Click to view Lab 1 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab1/Architecture_Diagram.png)

#### Administration & Configuration Captures
* **Organization Contact:**  
  ![Organization Contact](screenshots/lab1/Image1.png)
* **People Directory:**  
  ![People](screenshots/lab1/People.png)
* **Custom Profile Attributes:**  
  ![Custom Profile Attributes](screenshots/lab1/Custom_Profile_Attributes.png)
* **Group Management:**  
  ![Groups](screenshots/lab1/Groups.png)
* **Automated Group Rules:**  
  ![Group Rules](screenshots/lab1/Group_Rules.png)
* **Global Session Policy:**  
  ![Global Session Policy](screenshots/lab1/Global_Session_Policy.png)
* **Authentication Policies:**  
  ![Authentication Policies](screenshots/lab1/Authentication_Policies.png)
* **Authenticator Enrollment Policy:**  
  ![Authenticator Enrollment Policy](screenshots/lab1/Authenticator_Enrollment_Policy.png)

</details>

---
**[↑ Back to Lab Execution Status](#lab-execution-status)**

### Lab 2: Active Directory Integration & Delegated Authentication

**Key Learnings & Takeaways:**
* Configured Active Directory as the authoritative source of truth for user lifecycle operations (`allenlab.local`).
* Evaluated standard import workflows: **Incremental Import** for daily delta synchronization vs. **Full Import** for initial reconciliation and bulk schema updates.

<details>
<summary>📸 <b>Click to view Lab 2 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab2/Architecture_Diagram.png)

#### Active Directory Integration Proof
* **AD to Okta Provisioning Pipeline:**  
  ![From AD To Okta](screenshots/lab2/FromAD_To_Okta.png)
* **Delegated Authentication Enabled:**  
  ![Enabled Delegated Authentication](screenshots/lab2/Enabled_Delegated_Authentication.png)
* **AD Profile Mapping:**  
  ![User Profile Mapping AD](screenshots/lab2/User_Profile_Mapping_AD.png)
* **Okta User Profile Mapping:**  
  ![User Profile Mapping Okta](screenshots/lab2/User_Profile_Mapping_Okta.png)

</details>

---
**[↑ Back to Lab Execution Status](#lab-execution-status)**

### Lab 3: RBAC Design & Access Sprawl Investigation

**Key Learnings & Takeaways:**
* Enforced end-to-end lifecycle flow: `HR → AD → Okta`. Tested AD account disablement and verified the resulting Okta lifecycle state. Session revocation and downstream application access require separate validation.
* Audited governance bypasses in Okta System Logs (`application.user_membership.add`) to detect direct user-to-app assignments and restore strict RBAC posture.

<details>
<summary>📸 <b>Click to view Lab 3 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab3/Architecture_Diagram.png)

#### RBAC & Deprovisioning Proof
* **Group Sync Verification:**  
  ![Okta Group Sync](screenshots/lab3/Okta_Group_Sync.png)
* **Full Reconciliation Import:**  
  ![Full Import](screenshots/lab3/Full_Import.png)
* **Lifecycle Deactivation (AD side):**  
  ![Sarah Disabled AD](screenshots/lab3/Sarah_Disabled_AD.png)
* **Lifecycle Deactivation (Okta side):**  
  ![Sarah Deactivated Okta](screenshots/lab3/Sarah_Deactivated_Okta.png)
* **Access Sprawl Investigation & Audit Report:**  
  ![Access Sprawl Investigation](screenshots/lab3/Access_Sprawl_Investigation.png)  
  ![Access Sprawl Report](screenshots/lab3/Access_Sprawl_Report.png)

</details>

---
**[↑ Back to Lab Execution Status](#lab-execution-status)**

### Lab 4: SAML 2.0 Application Integration

**Key Learnings & Takeaways:**
* Configured custom SAML 2.0 integrations with multiple Service Providers (Slack, Google Workspace, SharePoint).
* Applied least-privilege entitlements through group memberships rather than direct assignments. Verified user access segregation across distinct user profiles in Incognito test sessions.

<details>
<summary>📸 <b>Click to view Lab 4 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab4/Architecture_Diagram.png)

#### SAML Integration Proof
* **Custom SAML Configuration:**  
  ![SAML Creation 1](screenshots/lab4/Slack_SP_Shrestha_Technology_1.png)  
  ![SAML Creation 2](screenshots/lab4/Slack_SP_Shrestha_Technology_2.png)  
  ![SAML Creation 3](screenshots/lab4/Slack_SP_Shrestha_Technology_3.png)
* **Group-Based Application Assignments:**  
  ![Group Based App Access 1](screenshots/lab4/Group_Based_App_Access_1.png)  
  ![Group Based App Access 2](screenshots/lab4/Group_Based_App_Access_2.png)
* **Least Privilege Access Verification:**  
  * *Finance User (John Smith - Limited Access):*  
    ![John App Access](screenshots/lab4/John_App_Access.png)
  * *HR & Cloud Admin (Lisa Park - Extended Access):*  
    ![Lisa App Access](screenshots/lab4/Lisa_App_Access.png)

</details>

---
**[↑ Back to Lab Execution Status](#lab-execution-status)**

### Lab 5: Adaptive MFA, Step-Up Authentication & Zero Trust

**Key Learnings & Takeaways:**
* Defined trusted vs. untrusted IP Network Zones. Constructed Adaptive Sign-On Rules to require MFA or block access based on client network context.
* Enforced step-up authentication policies on high-value resources (e.g., SharePoint) to challenge active sessions upon accessing sensitive data.

<details>
<summary>📸 <b>Click to view Lab 5 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab5/Architecture_Diagram.png)

#### MFA & Policy Verification
* **Authenticator Enrollment & Passwordless Setup:**  
  ![Enroll Okta Verify](screenshots/lab5/Enroll_Okta_Verify.png)  
  ![Passwordless Enrollment](screenshots/lab5/Passwordless_Enrollment_1.png)
* **Network Zones & Adaptive Rules:**  
  ![Network Zones](screenshots/lab5/Network_Zones.png)  
  ![Adaptive Policy Outside Network](screenshots/lab5/Risk_Based_Adaptive_MFA_Policy_OutsideNetwork.png)  
  ![Adaptive Policy Corporate Network](screenshots/lab5/Risk_Based_Adaptive_MFA_Policy_Corporate.png)
* **Step-Up Authentication Engine:**  
  ![Step Up Policy](screenshots/lab5/Step_Up_Authentication_Policy.png)  
  ![Step Up Rule](screenshots/lab5/Step_Up_Authentication_Rule.png)  
  ![Step Up High Assurance](screenshots/lab5/Step_Up_Authentication_High_Assurance_Policy.png)
* **User Authentication Testing:**  
  ![John Smith Access](screenshots/lab5/John_Smith_Access.png)  
  ![Jane Doe Access](screenshots/lab5/Jane_Doe_Access.png)

</details>

---
**[↑ Back to Lab Execution Status](#lab-execution-status)**

### Lab 6: Okta JML Lifecycle Automation

**Key Learnings & Takeaways:**
- Automates Joiner, Mover, and Leaver lifecycle actions using PowerShell and Active Directory.
- Uses the Okta AD Agent and Full/Incremental Import to validate applicable AD changes in Okta.
- Supports CSV-driven batch processing for multiple lifecycle actions.

#### 📂 Code & Automation Artifacts (Direct Inspect)
- **Joiner:** [`scripts/Joiner.ps1`](scripts/Joiner.ps1) — Create a user and assign configured groups.
- **Mover:** [`scripts/Mover.ps1`](scripts/Mover.ps1) — Update user attributes and change group memberships.
- **Leaver:** [`scripts/Leaver.ps1`](scripts/Leaver.ps1) — Disable the account and remove configured group memberships.
- **CSV input:** [`csv-file/Jml-Batch.csv`](csv-file/Jml-Batch.csv) — Batch lifecycle records.
- **Batch runner:** [`scripts/JML-Batch.ps1`](scripts/JML-Batch.ps1) — Process CSV records with validation.

#### Validation and Limitations

AD and Okta state changes do not, by themselves, prove downstream application deprovisioning or active-session revocation. Those outcomes require separate validation.

<details>
<summary>📸 <b>Click to view Lab 6 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](screenshots/lab6/Architecture_Diagram.png)

#### Joiner Mover Leaver Lifecycle
* **Joiner Onboarding Script:**  
  ![Joiner_Onboarding_Script](screenshots/lab6/Joiner_Onboarding_Script.png)    
* **IT Confirmation:**  
  ![IT_Confirmation](screenshots/lab6/IT_Confirmation.png)  
* **Mover Script:**  
  ![Mover_Script](screenshots/lab6/Mover_Script.png)    
* **Finance Confirmation:**  
  ![Finance_Confirmation](screenshots/lab6/Finance_Confirmation.png)
* **Leaver Script:**  
  ![Leaver_Script](screenshots/lab6/Leaver_Script.png)
* **Deactivation Confirmation:**  
  ![Deactivation_Confirmation](screenshots/lab6/Deactivation_Confirmation.png)
* **CSV Driven Batch Processing:**  
  ![CSV_Driven_Batch_Processing](screenshots/lab6/CSV_Driven_Batch_Processing.png)
* **Activated Deactivated Confirmation:** 
  ![Activated_Deactivated_Confirmation](screenshots/lab6/Activated_Deactivated_Confirmation.png)
* **HR Group Confirmation:** 
  ![HR_Group_Confirmation](screenshots/lab6/HR_Group_Confirmation.png)
* **Finance Group Confirmation:** 
  ![Finance_Group_Confirmation](screenshots/lab6/Finance_Group_Confirmation.png)
</details>

---

**[↑ Back to Lab Execution Status](#lab-execution-status)**

---

## Original Repository & Credits
This hands-on lab series was adapted and built upon the foundational framework provided by [RyanKennon/Okta-Lab-Series](https://github.com/RyanKennon/Okta-Lab-Series). Full original references can be found in [REFERENCE.md](REFERENCE.md).
