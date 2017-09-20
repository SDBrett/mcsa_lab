Documentation
    Better explain end to end setup, target people who have never used Chef before
    Comments within scripts

Code
    Clean up code within Chef and Terraform
    Implement better practices where possible
    *   Revisited domain joining to make more reliable
    
    Creation of JSON files for the setup of roles in Chef server

Issues to resolve:
    There's probably many, but things seems to be working ok for now
    
    There is an issue with hostnames not updating when creating multiple servers of the same time. This appears to be a bug in Terraform with the templates not interating per run. https://github.com/terraform-providers/terraform-provider-template/issues/12

Practices to improve on
    Move passwords to data bag which can be called from Terraform and Chef
    This requires easy to modify file and updating of databag

