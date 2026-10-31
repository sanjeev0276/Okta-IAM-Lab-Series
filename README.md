# Okta IAM Lab Series - Hands-On Architecture & Implementation
![Okta](https://img.shields.io/badge/Okta-IAM-007DC1?style=for-the-badge&logo=okta&logoColor=white)
![PowerShell](https://img.shields.io/badge/PowerShell-Automation-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Active Directory](https://img.shields.io/badge/Active%20Directory-Integration-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![SAML](https://img.shields.io/badge/SAML%202.0-SSO-FF6B00?style=for-the-badge)
![MFA](https://img.shields.io/badge/Adaptive%20MFA-Zero%20Trust-00A86B?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

**Author:** Sanjeev Shrestha | Dallas–Fort Worth Area, TX (Shrestha Technologies)  
**Target Roles:** IAM Engineer / Identity Engineer / Okta Administrator / Entra ID Engineer (2027)  
**Certification Focus:** Preparing for Okta Certified Professional (OCP)  
**Environment:** Okta Developer Tenant (*.okta.com - redacted) 

## 6 Labs Architecture Overview
Conceptual HR Source (simulated) → AD `allenlab.local` → Okta `*.okta.com - redacted` → RBAC Groups → Apps (Slack, Workspace, SharePoint) → Adaptive MFA / Zero Trust → JML Automation
 ![Architecture_Overview](Overall_Architecture.png)

## Quick Navigation & Lab Execution Status

| Lab       | Focus Area                                | Status    | Jump to Lab                                                                  |
|-----------|-------------------------------------------|-----------|------------------------------------------------------------------------------|
| **Lab 1** | Tenant Setup & Core Identity Foundation   | Completed | [Go to Lab 1](#lab-1-okta-tenant-setup--configuration)                       |
| **Lab 2** | Active Directory Integration & DelAuth    | Completed | [Go to Lab 2](#lab-2-active-directory-integration--delegated-authentication) |
| **Lab 3** | RBAC Design & Access Sprawl Investigation | Completed | [Go to Lab 3](#lab-3-rbac-design--access-sprawl-investigation)               |
| **Lab 4** | SAML 2.0 Application Integration          | Completed | [Go to Lab 4](#lab-4-saml-20-application-integration)                        |
| **Lab 5** | Adaptive MFA, Step-Up & Zero Trust        | Completed | [Go to Lab 5](#lab-5-adaptive-mfa-step-up-authentication--zero-trust)        |
| **Lab 6** | JML Lifecycle Automation                  | Completed | [Go to Lab 6](#lab-6-okta-jml-lifecycle-automation)                          |

---
## Executive Summary & Business Impact

Implemented an end-to-end IAM environment using Okta, Active Directory, SAML federation, Adaptive MFA, RBAC, and automated Joiner-Mover-Leaver lifecycle processes across six hands-on labs.

* **Tenant Foundation (Lab 1):** Core Okta tenant `*.okta.com - redacted`, custom profile attributes, Groups RBAC, Global Session + Auth + Enrollment Policies.
* **Access Governance (Lab 3+4):** Group-based provisioning, access-sprawl audit via System Log `application.user_membership.add`, least-privilege via group app assignments for Slack, Workspace, SharePoint.
* **Lifecycle Automation (Lab 2+6):** AD `allenlab.local` as source with DelAuth + Full/Incremental Import via AD Agent, JML automation with PowerShell + CSV batch `jml-batch.csv`, Unassigned → Confirm → Active/Deactivated.
* **Centralized Auth (Lab 4):** SAML 2.0 federation with attribute mapping across Slack, Google Workspace, SharePoint.
* **Zero Trust (Lab 5):** Network Zones Trusted/Untrusted IP, Adaptive Sign-On + Step-Up High Assurance for SharePoint, Passwordless Okta Verify Push with Number Matching.
* **Users Managed:** 20+ AD users, 6 Groups, 3 SAML Apps, 22 MFA policies

---

## Key Skills Demonstrated

* Okta Tenant Administration & Profile Editor
* Active Directory (AD) Integration & Delegated Authentication
* Role-Based Access Control (RBAC) Design
* SAML 2.0 SSO Federation & Attribute Mapping
* Adaptive Risk-Based Authentication & Network Zones
* Step-Up Authentication & Passwordless Policies
* User Lifecycle Management (JML) & Access Sprawl Audit


## Detailed Lab Implementations & Visual Proof

### Lab 1: Okta Tenant Setup & Configuration

**Key Learnings & Takeaways:**
* Established core tenant infrastructure including branding, directory schema, custom profile attributes, and group structures prior to app assignments.
* Isolated Global Session Policies from application-level Authentication Policies and Authenticator Enrollment Policies to maintain granular access control.

<details>
<summary>📸 <b>Click to view Lab 1 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Architecture_Diagram.png)

#### Administration & Configuration Captures
* **Organization Contact:**  
  ![Organization Contact](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Image1.png)
* **People Directory:**  
  ![People](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/People.png)
* **Custom Profile Attributes:**  
  ![Custom Profile Attributes](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Custom_Profile_Attributes.png)
* **Group Management:**  
  ![Groups](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Groups.png)
* **Automated Group Rules:**  
  ![Group Rules](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Group_Rules.png)
* **Global Session Policy:**  
  ![Global Session Policy](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Global_Session_Policy.png)
* **Authentication Policies:**  
  ![Authentication Policies](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Authentication_Policies.png)
* **Authenticator Enrollment Policy:**  
  ![Authenticator Enrollment Policy](Lab%201%20-%20Okta%20Tenant%20Setup%20and%20Configuration/Screenshots/Authenticator_Enrollment_Policy.png)

</details>

---
**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

### Lab 2: Active Directory Integration & Delegated Authentication

**Key Learnings & Takeaways:**
* Configured Active Directory as the authoritative source of truth for user lifecycle operations (`allenlab.local`).
* Evaluated standard import workflows: **Incremental Import** for daily delta synchronization vs. **Full Import** for initial reconciliation and bulk schema updates.

<details>
<summary>📸 <b>Click to view Lab 2 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%202%20-%20Okta%20Active%20Directory%20Integration/Screenshots/Architecture_Diagram.png)

#### Active Directory Integration Proof
* **AD to Okta Provisioning Pipeline:**  
  ![From AD To Okta](Lab%202%20-%20Okta%20Active%20Directory%20Integration/Screenshots/FromAD_To_Okta.png)
* **Delegated Authentication Enabled:**  
  ![Enabled Delegated Authentication](Lab%202%20-%20Okta%20Active%20Directory%20Integration/Screenshots/Enabled_Delegated_Authentication.png)
* **AD Profile Mapping:**  
  ![User Profile Mapping AD](Lab%202%20-%20Okta%20Active%20Directory%20Integration/Screenshots/User_Profile_Mapping_AD.png)
* **Okta User Profile Mapping:**  
  ![User Profile Mapping Okta](Lab%202%20-%20Okta%20Active%20Directory%20Integration/Screenshots/User_Profile_Mapping_Okta.png)

</details>

---
**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

### Lab 3: RBAC Design & Access Sprawl Investigation

**Key Learnings & Takeaways:**
* Enforced end-to-end lifecycle flow: `HR → AD → Okta`. Tested AD account disablement and verified the resulting Okta lifecycle state. Session revocation and downstream application access require separate validation.
* Audited governance bypasses in Okta System Logs (`application.user_membership.add`) to detect direct user-to-app assignments and restore strict RBAC posture.

<details>
<summary>📸 <b>Click to view Lab 3 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Architecture_Diagram.png)

#### RBAC & Deprovisioning Proof
* **Group Sync Verification:**  
  ![Okta Group Sync](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Okta_Group_Sync.png)
* **Full Reconciliation Import:**  
  ![Full Import](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Full_Import.png)
* **Lifecycle Deactivation (AD side):**  
  ![Sarah Disabled AD](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Sarah_Disabled_AD.png)
* **Lifecycle Deactivation (Okta side):**  
  ![Sarah Deactivated Okta](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Sarah_Deactivated_Okta.png)
* **Access Sprawl Investigation & Audit Report:**  
  ![Access Sprawl Investigation](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Access_Sprawl_Investigation.png)  
  ![Access Sprawl Report](Lab%203%20-%20Okta%20RBAC%20Design%20and%20Implementation/Screenshots/Access_Sprawl_Report.png)

</details>

---
**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

### Lab 4: SAML 2.0 Application Integration

**Key Learnings & Takeaways:**
* Configured custom SAML 2.0 integrations with multiple Service Providers (Slack, Google Workspace, SharePoint).
* Applied least-privilege entitlements through group memberships rather than direct assignments. Verified user access segregation across distinct user profiles in Incognito test sessions.

<details>
<summary>📸 <b>Click to view Lab 4 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Architecture_Diagram.png)

#### SAML Integration Proof
* **Custom SAML Configuration:**  
  ![SAML Creation 1](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Slack_SP_Shrestha_Technology_1.png)  
  ![SAML Creation 2](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Slack_SP_Shrestha_Technology_2.png)  
  ![SAML Creation 3](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Slack_SP_Shrestha_Technology_3.png)
* **Group-Based Application Assignments:**  
  ![Group Based App Access 1](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Group_Based_App_Access_1.png)  
  ![Group Based App Access 2](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Group_Based_App_Access_2.png)
* **Least Privilege Access Verification:**  
  * *Finance User (John Smith - Limited Access):*  
    ![John App Access](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/John_App_Access.png)
  * *HR & Cloud Admin (Lisa Park - Extended Access):*  
    ![Lisa App Access](Lab%204%20-%20Okta%20SAML%202.0%20Application%20Integration/Screenshots/Lisa_App_Access.png)

</details>

---
**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

### Lab 5: Adaptive MFA, Step-Up Authentication & Zero Trust

**Key Learnings & Takeaways:**
* Defined trusted vs. untrusted IP Network Zones. Constructed Adaptive Sign-On Rules to require MFA or block access based on client network context.
* Enforced step-up authentication policies on high-value resources (e.g., SharePoint) to challenge active sessions upon accessing sensitive data.

<details>
<summary>📸 <b>Click to view Lab 5 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Architecture_Diagram.png)

#### MFA & Policy Verification
* **Authenticator Enrollment & Passwordless Setup:**  
  ![Enroll Okta Verify](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Enroll_Okta_Verify.png)  
  ![Passwordless Enrollment](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Passwordless_Enrollment_1.png)
* **Network Zones & Adaptive Rules:**  
  ![Network Zones](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Network_Zones.png)  
  ![Adaptive Policy Outside Network](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Risk_Based_Adaptive_MFA_Policy_OutsideNetwork.png)  
  ![Adaptive Policy Corporate Network](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Risk_Based_Adaptive_MFA_Policy_Corporate.png)
* **Step-Up Authentication Engine:**  
  ![Step Up Policy](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Step_Up_Authentication_Policy.png)  
  ![Step Up Rule](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Step_Up_Authentication_Rule.png)  
  ![Step Up High Assurance](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Step_Up_Authentication_High_Assurance_Policy.png)
* **User Authentication Testing:**  
  ![John Smith Access](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/John_Smith_Access.png)  
  ![Jane Doe Access](Lab%205%20-%20Okta%20MFA%20and%20Adaptive%20Authentication/Screenshots/Jane_Doe_Access.png)

</details>

---
**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

### Lab 6: Okta JML Lifecycle Automation

**Key Learnings & Takeaways:**
- Automates Joiner, Mover, and Leaver lifecycle actions using PowerShell and Active Directory.
- Uses the Okta AD Agent and Full/Incremental Import to validate applicable AD changes in Okta.
- Supports CSV-driven batch processing for multiple lifecycle actions.

<details>
<summary>📸 <b>Click to view Lab 6 Diagrams & Screenshots</b></summary>

<br>

#### Architecture Diagram
![Architecture Diagram](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Architecture_Diagram.png)

#### Joiner Mover Leaver Lifecycle
* **Joiner Onboarding Script:**  
  ![Joiner_Onboarding_Script](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Joiner_Onboarding_Script.png)    
* **IT Confirmation:**  
  ![IT_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/IT_Confirmation.png)  
* **Mover Script:**  
  ![Mover_Script](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Mover_Script.png)    
* **Finance Confirmation:**  
  ![Finance_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Finance_Confirmation.png)
* **Leaver Script:**  
  ![Leaver_Script](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Leaver_Script.png)
* **Deactivation Confirmation:**  
  ![Deactivation_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Deactivation_Confirmation.png)
* **CSV Driven Batch Processing:**  
  ![CSV_Driven_Batch_Processing](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/CSV_Driven_Batch_Processing.png)
* **Activated Deactivated Confirmation:** 
  ![Activated_Deactivated_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Activated_Deactivated_Confirmation.png)
* **HR Group Confirmation:** 
  ![HR_Group_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/HR_Group_Confirmation.png)
* **Finance Group Confirmation:** 
  ![Finance_Group_Confirmation](Lab%206%20-%20Okta%20JML%20Lifecycle%20Automation/Screenshots/Finance_Group_Confirmation.png)
</details>

---
#### 📂 Code & Automation Artifacts (Direct Inspect)
- **Joiner:** [`scripts/Joiner.ps1`](scripts/Joiner.ps1) — Create a user and assign configured groups.
- **Mover:** [`scripts/Mover.ps1`](scripts/Mover.ps1) — Update user attributes and change group memberships.
- **Leaver:** [`scripts/Leaver.ps1`](scripts/Leaver.ps1) — Disable the account and remove configured group memberships.
- **CSV input:** [`csv-file/Jml-Batch.csv`](csv-file/Jml-Batch.csv) — Batch lifecycle records.
- **Batch runner:** [`scripts/JML-Batch.ps1`](scripts/JML-Batch.ps1) — Process CSV records with validation.

#### Validation and Limitations

AD and Okta state changes do not, by themselves, prove downstream application deprovisioning or active-session revocation. Those outcomes require separate validation.

**[↑ Back to Lab Execution Status](#quick-navigation--lab-execution-status)**

---

## Original Repository & Credits
This hands-on lab series was adapted and built upon the foundational framework provided by [RyanKennon/Okta-Lab-Series](https://github.com/RyanKennon/Okta-Lab-Series). Full original references can be found in [REFERENCE.md](REFERENCE.md).




