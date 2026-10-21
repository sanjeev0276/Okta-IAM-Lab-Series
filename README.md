# Okta IAM Lab Series - My Hands-On Labs
**By:** Sanjeev Shrestha | Dallas–Fort Worth Area, Texas, USA <br>
**Okta Org** Integrator Free Plan at [developer.okta.com](https://developer.okta.com) <br>
**My org:** *.okta.com (redacted) <br>
**Goal:** IAM Engineer/Developer roles - 2027 - Preparing for Okta Certified Professional (OCP) <br>
**Original:** Forked from RyanKennon/Okta-Lab-Series

## Skills Demonstrated
* Okta Administration
* User Lifecycle Management
* Group-Based Access Control
* RBAC Design
* SAML Federation
* MFA Policies
* Active Directory Integration
* JML Automation
  
## My Progress
- [X] Lab 1: Tenant Setup - Completed Oct 19, 2026 
- [X] Lab 2: AD Integration - Completed Oct 21, 2026
- [X] Lab 3: RBAC - Completed Oct 21, 2026
- [X] Lab 4: SAML SSO - Completed Oct 21, 2026
- [ ] Lab 5: MFA / Adaptive - In Progress
- [ ] Lab 6: JML Lifecycle - In Progress

## Lab Evidence (screenshots from my org)
### Lab 1 - Okta Tenant Setup & Configuration
![Shrestha Technologies](screenshots/lab1/Shrestha_Technologies.png) <br>
### **Lab 1 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab1/Architecture_Diagram.png) <br>
### **Organization Contact:** <br>
![Organization Contact](screenshots/lab1/Image1.png)
### **People:** <br>
![People](screenshots/lab1/People.png)
### **Custom Profile Attributes:** <br>
![Custom_Profile_Attributes](screenshots/lab1/Custom_Profile_Attributes.png)
### **Groups:** <br>
![Groups](screenshots/lab1/Groups.png)
### **Group Rules:** <br>
![Groups_Rules](screenshots/lab1/Group_Rules.png)
### **Global Session Policy:** <br>
![Global_Session_Policy](screenshots/lab1/Global_Session_Policy.png)
### **Authentication Policies:** <br>
![Authentication Policies](screenshots/lab1/Authentication_Policies.png)
### **Authenticator Enrollment Policy:** <br>
![Authenticator_Enrollment_Policy](screenshots/lab1/Authenticator_Enrollment_Policy.png)

## Lab 1 - Key Learnings:
- Learned how to set up a clean Okta tenant from scratch - Branding, People, Custom Profile Attributes, and how Global Session Policy is separate from Authentication Policies and Authenticator Enrollment Policy.
- Learned to build the foundation right - People, Groups, and Group Rules first, so later RBAC and SAML apps just work with automated assignments instead of manual adds.

### Lab 2 - Okta Active Directory Integration <br>
### **Lab 2 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab2/Architecture_Diagram.png) <br>
### **From AD To Okta:** <br>
![FromAD_To_Okta](screenshots/lab2/FromAD_To_Okta.png)
### **Enabled Delegated Authentication:** <br>
![Enabled_Delegated_Authentication](screenshots/lab2/Enabled_Delegated_Authentication.png)
### **User Profile Mapping AD:** <br>
![User_Profile_Mapping_AD](screenshots/lab2/User_Profile_Mapping_AD.png)
### **User Profile Mapping Okta:** <br>
![User_Profile_Mapping_Okta](screenshots/lab2/User_Profile_Mapping_Okta.png)

## Lab 2 - Key Learnings:
- AD is source of truth — _Users OU allenlab.local creates user, Okta never creates AD.
- Incremental vs Full Import — Incremental = only changed objects, Full = all 4 users + 26 groups — Use Incremental for daily, Full for fixes
  
### Lab 3 - Okta RBAC Design and Implementation <br>
### **Lab 3 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab3/Architecture_Diagram.png) <br>
### **Okta Group Sync:** <br>
![Okta_Group_Sync](screenshots/lab3/Okta_Group_Sync.png)
### **Full Import:** <br>
![Full_Import](screenshots/lab3/Full_Import.png)
### **Sarah Disabled AD:** <br>
![Sarah_Disabled_AD](screenshots/lab3/Sarah_Disabled_AD.png)
### **Sarah Deactivated Okta:** <br>
![Sarah_Deactivated_Okta](screenshots/lab3/Sarah_Deactivated_Okta.png)
### **Access Sprawl Investigation:** <br>
![Access_Sprawl_Investigation](screenshots/lab3/Access_Sprawl_Investigation.png)
### **Access Sprawl Report:** <br>
![Access_Sprawl_Report](screenshots/lab3/Access_Sprawl_Report.png)

## Lab 3 - Key Learnings:
- HR → AD → Okta lifecycle — In this lab, AD is authoritative for the configured user lifecycle. AD as single source of truth _Users/_Groups/_DisabledUsers
- Detect sprawl via System Log application.user_membership.add direct assign John Smith → SCIM App. Alert on direct People assign bypassing groups
 
### Lab 4 - Okta SAML 2.0 Application Integration <br>
### **Lab 4 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab4/Architecture_Diagram.png) <br>
### **Custom SAML App Creation 1:** <br>
![Slack_SP_Shrestha_Technology_1](screenshots/lab4/Slack_SP_Shrestha_Technology_1.png) 
## **Custom SAML App Creation 2:** <br>
![Slack_SP_Shrestha_Technology_2](screenshots/lab4/Slack_SP_Shrestha_Technology_2.png) 
## **Custom SAML App Creation 3:** <br>
![Slack_SP_Shrestha_Technology_3](screenshots/lab4/Slack_SP_Shrestha_Technology_3.png)
### **Group Based App Access:** <br>
![Group_Based_App_Access](screenshots/lab4/Group_Based_App_Access_1.png)
![Group_Based_App_Access](screenshots/lab4/Group_Based_App_Access_2.png)
### **Multiple SP Configuration:** <br>
![Multiple SP Configuration](screenshots/lab4/Multiple_SP_Configuration_1.png)
![Multiple SP Configuration](screenshots/lab4/Multiple_SP_Configuration_2.png)
### **Least privilege Access. John Smith (Finance) sees Slack and Sharepoint only:** <br>
![John_App_Access](screenshots/lab4/John_App_Access.png)
### **Least privilege Access. Lisa Park (HR+Cloud) sees all 3 Slack/Google Workspace/Sharepoint :** <br>
![Lisa_App_Access](screenshots/lab4/Lisa_App_Access.png)

## Lab 4 - Key Learnings:
- Group-based app access Finance→2 apps, HR+Cloud→3 apps. Assign Finance/IT/HR/Helpdesk/Cloud Engineer groups to Slack/Google Workspace/Sharepoint — never direct People
- Least privilege matrix. John Smith (Finance) sees Slack+Sharepoint only — Lisa Park (HR+Cloud) sees all 3 — test in Incognito

## Original series (reference)
<p align="center">
  <img src="Header.png" width="400" height="200" alt="Okta IAM Lab Series">
</p>

# Okta IAM Lab Series
This repository serves as the central hub for the Okta IAM Lab Series — a collection of hands-on identity and access management labs built around the Okta Identity Cloud platform. Each lab builds on the previous one, starting with foundational Okta tenant configuration and progressively covering Active Directory integration, SAML-based Single Sign-On, Multi-Factor Authentication, and JML lifecycle automation. All labs are performed in a live Okta Integrator Free Plan org and reflect real-world IAM practices aligned with the responsibilities of an entry-level IAM Analyst or Identity Engineer. The series is designed to build a comprehensive Okta portfolio demonstrating hands-on proficiency across the core competencies tested in the Okta Certified Professional (OCP) exam and commonly required in IAM Analyst job descriptions.

---

## Prerequisites
The following are required before starting the Okta IAM Lab Series:

- **Okta Integrator Free Plan Org** — Sign up for a free Integrator Free Plan at [developer.okta.com](https://developer.okta.com). This org will be used across all labs in the series and should not be deleted between labs.
- **Microsoft Azure Account** — A personal Azure account with an active subscription is required for labs involving Active Directory. Sign up for a free account with $200 in credits at [azure.microsoft.com/free](https://azure.microsoft.com/free).
- **Windows Server 2022 VM** — Required for Active Directory labs. Follow the setup steps in the [Active Directory Enterprise Administration Lab](https://github.com/RyanKennon/Active-Directory) through the **Create Organizational Units** section before starting Lab 2.
- **GitHub Account** — Required to follow along with lab documentation and host your own portfolio.
- **Basic Familiarity with Active Directory** — Labs 2 and 3 assume basic knowledge of Active Directory concepts such as users, groups, and organizational units. Complete the [Active Directory Enterprise Administration Lab](https://github.com/RyanKennon/Active-Directory) if you are new to Active Directory.

---

## Labs

- [Okta Tenant Setup & Configuration](https://github.com/RyanKennon/Okta-Tenant-Setup)
- [Okta Active Directory Integration](https://github.com/RyanKennon/okta-AD-integration)
- [Okta RBAC Design & Implementation](https://github.com/RyanKennon/Okta-RBAC)
- [Okta SAML 2.0 Application Integration](https://github.com/RyanKennon/okta-enterpirse-sso)
- [Okta MFA and Adaptive Authentication](https://github.com/RyanKennon/okta-mfa-adaptive-authentication)
- [Okta JML Lifecycle Automation](https://github.com/RyanKennon/okta-jml-lifecycle-automation)
