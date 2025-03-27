This project is from a simulated situation of a company that has team of 10 employees who are all currently sharing the same AWS management account credentials to access and manage their cloud resources.
Using terraform, I created the users, user groups, group policies, and attached the users to the associated user groups.

Team Structure & Access Needs: 
- 4 Developers (need EC2 and S3 access)
- 2 Operations (need full infrastructure access)
- 1 Finance Manager (needs cost management access)
- 3 Data Analysts (need read-only access to data resources)

Implement These Permissions:

Developers:
- EC2 management
- S3 access for application files
- CloudWatch logs viewing
  
Operations:
- Full EC2, CloudWatch access
- Systems Manager access
- RDS management
  
Finance:
- Cost Explorer
- AWS Budgets
- Read-only resource access
  
Analysts:
- Read-only S3 access
- Read-only database access

The management account should only be used for viewing billing or managing AWS accounts in an AWS organization. 
The account should also have MFA enabled for security.
Best practice is to make a separate account and use AWS organizations to group the accounts.

Users should have MFA enable for their accounts.
There should be a strong password policy.
They should only be given the access they need.

Originally had all code in one file, but ended up separating the main.tf into multiple files for readability, scalability, and best practice. 
Content in the new main.tf is not required, but it acts as the high-level structure for the project, which is best practice.

