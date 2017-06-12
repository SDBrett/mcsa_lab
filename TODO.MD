Documentation
    Better explain end to end setup, target people who have never used Chef before
    Comments within scripts

Code
    Clean up code within Chef and Terraform
    Implement better practices where possible
    Include Chef-client settings in default recipe
    Terraform to add tags 'mcsa_lab' to all nodes in Chef
        This is to be used for Chef server cleanup

Issues to resolve:
    Using attribute for the domain name in dc_DomainBuild causes a NIL value error
        Attribute string does not appear to be passing through undefined method `[]' for nil:NilClass
        This error was in relation to missing attribute, solved

Practices to improve on
    Move passwords to data bag which can be called from Terraform and Chef
    This requires easy to modify file and updating of databag

