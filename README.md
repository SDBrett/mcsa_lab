This project is very much in an alpha start, working through bugs and building out. 
Documentation needs to be built out as well as the actual functionality.

The purpose of the project is to enable people to create a Windows AD domain on a hosted environment from scratch with minimal effort and in a short period of time. Additionally, member servers are created to furfil roles. By using this people might be able to increase effective study time.

The design is not to have on going configuration management, this is primarly for Day 0 stand up.

Prereqs

    Chef Server: Local or hosted, either will work
    
    AWS account: Credentials file is defaulted to ~/.aws/credentials can be changed through edit of Terraform and Chef scripts

    Chef DK installed on local system

    Terraform on local system, prefered if PATH updated to include Terraform


To setup

Copy mcsa_lab to cookbooks directoy
Upload cookbook to Chef server

Use SetupChefEnvironment.sh to configure the roles on Chef server


Much of the Terraform structure has been shamelessly stolen from Scott Lowes 2017 Interop ITX Container Demo. https://github.com/lowescott/2017-itx-container-workshop
