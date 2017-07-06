This project is very much in an alpha start, working through bugs and building out. 
Documentation needs to be built out as well as the actual functionality.

The purpose of the project is to enable people to create a Windows AD domain on a hosted environment from scratch with minimal effort and in a short period of time. Additionally, member servers are created to furfil roles. By using this people might be able to increase effective study time.

The design is not to have on going configuration management, this is primarly for Day 0 stand up.

Prereqs

    Chef DK installed on local system
    
    Terraform on local system, prefered if PATH updated to include Terraform
    
    AWS account: Credentials file is defaulted to ~/.aws/credentials can be changed through edit of Terraform and Chef scripts

    Chef Server: Local or hosted, either will work
    
    Git: You don't need a Github account, but you will require git to clone the files and for uploading the cookbook to your own Chef server.


Setup

The setup section covers the steps for setting up the prerequisites for this project. The steps will use the hosted version of Chef server as it's free and requires very little effort.

Chef Development Kit:

    The Chef DK is the software package which contains everything you need to use Chef. It's a local installation on your computer so you will need to install this on any computer you wish to use to interact with Chef.
    
    Navigate to: https://downloads.chef.io/chefdk/stable and download the package for your OS and Install.
    
Terraform:

    The Terraform file is a standalone executable which can be downloaded from: https://www.terraform.io/downloads.html. Download the file and place on your system. This is not an installer, so you will need to add it to the PATH environmental variable.
    
    For example on a Windows machine, you might create a directory C:\Terraform and place the file in there, or OSX or Linux you might place in ~/Terraform.
    
    Details on an entry to the PATH variable can be found with the links below.
    Windows: https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows
    Linux / OSX: https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux

    Once all is done you can try running the command 'terraform' from cmd / terminal.
    
AWS Account:

    Head across to: https://aws.amazon.com/ and sign up for an AWS account. You will need to provide billing details, while there is a 12 month free tier, the EC2 instances used in this project are not eligable.
    
    A couple of notes: If you decide to setup MFA (Multifactor Auth), ensure that you keep you contact number up to date. If you change phones and phone numbers, you will need to sign an affidavit to get back in. This includes your amazon shopping account.
    The project can be done with the account created to setup the AWS account (the root account), but it's a really bad practice to do so. Therefore, some additional steps are included for setting up another account.
    
    New Account:
        At the top, go to 'Services' and IAM
        Click on "Add User", enter a username and select 'programmatic access'
        For access policy, select EC2 Full Access
        You will then be able to download a CSV file with the Access key and Secret, these are you keys to access AWS. AWS will never display the secret again.
        Download the CSV file and create a directory C:\<user>\.aws or for Linux / OSX ~/.aws
        
        The project contains a template AWS credential file, which will be used to pass the access key and secret to Terraform for the creation of EC2 instances.
        This is in the directory AWS cred file, copy that to the .aws directory you created and past in the access key and secret from the CSV that you downloaded before. 
        
        As this is the default directory you do not need to specify these details in the Terraform configuration files. If you already work with AWS and use multiple credentials, review the following link: https://www.terraform.io/docs/providers/aws/index.html
        
        Key Pair:
        A Key Pair is used for Terraform to verify when the instance is available. This is not something that can be setup as part of the workflow and must be done prior.
        
        At the top of the AWS console, go to 'Services' and 'EC2'. On the left under "Network and Security" click on 'Key Pairs'
        On the Key Pairs page, select 'Create Key Pair' and enter a name for the key pair.
        
        A file called <KeyPairName>.pem will download. Place that somewhere on you computer. You cannot download that file again, only delete and recreate the Key Pair in AWS.
        
        That's all we need to do in AWS, but we will circle back to the Key Pair when it's time to confiure the Terraform files.

Chef Server:

    The full steps to setting up Chef server are available here: https://learn.chef.io/modules/manage-a-node-chef-server/windows/hosted/set-up-your-chef-server#/
    
    In your browser of choice, navigate to: https://api.chef.io/signup and fill out the sign up form.
    After you have signed up and verified your email account, you can login through https://api.chef.io
    When logging in for the first time, you will be asked to setup an organization. The short name you provide needs to be unique as it will form the connection URL. https://api.chef.io/organizations/<org>
    
    After entering the organization details, you will be presented with two options, "Download Starter Kit" and "Learn Chef".
    Click "Download Starter Kit", you will receive a warning that this will reset your user key, that's ok because you haven't used it yet.
    A Zip file called "Chef-Starter.zip" will download and extract the folder called chef-repo. This folder contains all the files, including your key file for interacting with Chef server.
    
Git:
    Download the git installer for your OS from: https://git-scm.com/downloads and run through the installation. On Windows you will want to select the option to add git to PATH, this will make life a lot easier.



    
    

Copy mcsa_lab to cookbooks directoy
Upload cookbook to Chef server

Use SetupChefEnvironment.sh to configure the roles on Chef server


Much of the Terraform structure has been shamelessly stolen from Scott Lowes 2017 Interop ITX Container Demo. https://github.com/lowescott/2017-itx-container-workshop
