# Okta IAM Lab Series - My Hands-On Labs
![Shrestha Technologies](screenshots/lab1/Shrestha_Technologies.png) <br>
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

## Business Problems Solved
* Reduced manual app assignments using group-based access.
* Implemented least privilege access model.
* Demonstrated AD-to-Okta lifecycle automation.
* Implemented SAML federation for centralized authentication.
* Reduced access sprawl through RBAC design.
* Prevented credential theft and push fatigue using Okta Verify Push with Number Matching and TOTP fallback.
* Enforced adaptive risk-based access using sign-on policies and network zone-based access rules.
* Secured sensitive applications with step-up authentication and authenticator enrollment policies, enabling passwordless.
  
## My Progress
- [x] Lab 1: Tenant Setup - Completed Oct 19, 2026 
- [x] Lab 2: AD Integration - Completed Oct 21, 2026
- [x] Lab 3: RBAC - Completed Oct 21, 2026
- [x] Lab 4: SAML SSO - Completed Oct 21, 2026
- [x] Lab 5: MFA / Adaptive - Completed Oct 22, 2026
- [ ] Lab 6: JML Lifecycle - In Progress

<a id="lab-evidence"></a>
## Lab Evidence (screenshots from my org)
**Jump to lab:**
- [Lab 1 – Tenant Setup](#lab-1---okta-tenant-setup--configuration)
- [Lab 2 – AD Integration](#lab-2---okta-active-directory-integration)
- [Lab 3 – RBAC](#lab-3---okta-rbac-design-and-implementation)
- [Lab 4 – SAML SSO](#lab-4---okta-saml-20-application-integration)
- [Lab 5 – MFA / Adaptive](#lab-5---okta-mfa-and-adaptive-authentication)
  
<a id="lab-1---okta-tenant-setup--configuration"></a>
### Lab 1 - Okta Tenant Setup & Configuration
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

**[↑ Back to Lab Evidence](#lab-evidence)**
  
<a id="lab-2---okta-active-directory-integration"></a>
### Lab 2 - Okta Active Directory Integration 
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
- In this lab configuration, AD is authoritative for the configured user lifecycle. — _Users OU allenlab.local creates user
- Incremental vs Full Import — Incremental = only changed objects, Full = all 4 users + 26 groups — Use Incremental for daily, Full for fixes
  
**[↑ Back to Lab Evidence](#lab-evidence)**
  
<a id="lab-3---okta-rbac-design-and-implementation"></a>
### Lab 3 - Okta RBAC Design and Implementation  
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
- Detect sprawl via System Log application.user_membership.add direct assign John Smith → SCIM App. Investigate direct assignments for possible governance bypass; validate approved exceptions before remediation.
  
**[↑ Back to Lab Evidence](#lab-evidence)**
 
<a id="lab-4---okta-saml-20-application-integration"></a>
### Lab 4 - Okta SAML 2.0 Application Integration
### **Lab 4 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab4/Architecture_Diagram.png) <br>
### **Custom SAML App Creation 1:** <br>
![Slack_SP_Shrestha_Technology_1](screenshots/lab4/Slack_SP_Shrestha_Technology_1.png) 
### **Custom SAML App Creation 2:** <br>
![Slack_SP_Shrestha_Technology_2](screenshots/lab4/Slack_SP_Shrestha_Technology_2.png) 
### **Custom SAML App Creation 3:** <br>
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
  
**[↑ Back to Lab Evidence](#lab-evidence)**

<a id="lab-5---okta-mfa-and-adaptive-authentication"></a>
### Lab 5 - Okta MFA and Adaptive Authentication
### **Lab 5 - Architecture Diagram:** <br>
![Architecture_Diagram](screenshots/lab5/Architecture_Diagram.png) <br>
### **1) Enroll Okta Verify:** <br>
![Enroll_Okta_Verify](screenshots/lab5/Enroll_Okta_Verify.png) 
### **Passwordless Enrollment 1:** <br>
![Passwordless_Enrollment_1](screenshots/lab5/Passwordless_Enrollment_1.png) 
### **Passwordless Enrollment 2:** <br>
![Passwordless_Enrollment_2](screenshots/lab5/Passwordless_Enrollment_2.png) 
### **Passwordless Enrollment 3:** <br>
![Passwordless_Enrollment_3](screenshots/lab5/Passwordless_Enrollment_3.png) 
### **Passwordless Enrollment 4:** <br>
![Passwordless_Enrollment_4](screenshots/lab5/Passwordless_Enrollment_4.png) 
### **Passwordless Enrollment 5:** <br>
![Passwordless_Enrollment_5](screenshots/lab5/Passwordless_Enrollment_5.png) 
### **Network Zones:** <br>
![Network_Zones](screenshots/lab5/Network_Zones.png)
### **Risk Based Adaptive MFA Policy Outside Network:** <br>
![Risk_Based_Adaptive_MFA_Policy_OutsideNetwork](screenshots/lab5/Risk_Based_Adaptive_MFA_Policy_OutsideNetwork.png)
### **Risk Based Adaptive MFA Policy Corporate:** <br>
![Risk_Based_Adaptive_MFA_Policy_Corporate](screenshots/lab5/Risk_Based_Adaptive_MFA_Policy_Corporate.png)
### **Step Up Authentication 1:** <br>
![Step_Up_Authentication_Policy](screenshots/lab5/Step_Up_Authentication_Policy.png)
### **Step Up Authentication 2:** <br>
![Step_Up_Authentication_Rule](screenshots/lab5/Step_Up_Authentication_Rule.png)
### **Step Up Authentication 3:** <br>
![Step_Up_Authentication_High_Assurance_Policy](screenshots/lab5/Step_Up_Authentication_High_Assurance_Policy.png)
### **John Smith Username:** <br>
![John_Smith_Username](screenshots/lab5/John_Smith_Username.png)
### **John Smith Password:** <br>
![John_Smith_Password](screenshots/lab5/John_Smith_Password.png)
### **John Smith Access:** <br>
![John_Smith_Access](screenshots/lab5/John_Smith_Access.png)
### **AuthenticatorEnrollment Policy:** <br>
![Authenticator_Enrollment_Policy](screenshots/lab5/Authenticator_Enrollment_Policy.png)
### **Jane Doe Username:** <br>
![Jane_Doe_Username](screenshots/lab5/Jane_Doe_Username.png)
### **Jane Doe Password:** <br>
![Jane_Doe_Password](screenshots/lab5/Jane_Doe_Password.png)
### **Jane Doe Access:** <br>
![Jane_Doe_Access](screenshots/lab5/Jane_Doe_Access.png)

## Lab 5 - Key Learnings:
- Step-up authentication for sensitive apps. Sharepoint Finance/HR sensitive — Requires MFA re-challenge even if session valid — Lab 5 step-up for sensitive applications — Prevents session hijack after initial login
- Network Zone-based access rules define trusted vs untrusted IPs. Create Security → Networks → Zones — Define Dallas Trusted Zone = [REDACTED_IP] range / Corp IPs — Allow vs Block — Sign-on Policy: If inside Dallas zone → MFA optional, Outside → MFA required + Deny — Without zone, user can login from any country — Need zone for real production environment in Dallas
  
**[↑ Back to Lab Evidence](#lab-evidence)**

**Original:** Forked from [RyanKennon/Okta-Lab-Series](https://github.com/RyanKennon/Okta-Lab-Series) — Full original description in [REFERENCE.md](REFERENCE.md) 
