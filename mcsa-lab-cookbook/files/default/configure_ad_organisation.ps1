<#
  Configuration of AD OU's, Users and Groups
#>

Function Get_DomainName
{
  
  New-PSObject
  New-ObjectProperty -Notetype -Name "DomainName"
  New-ObjectProperty -NoteType -Name "BaseDN"
  $Domain = Get-ADDomain

  $DomainInfo = New-Object –TypeNamePSObject
  $DomainInfo | Add-Member –MemberTypeNoteProperty –Name DomainName = $Domain.DNSRoot
  $DomainInfo | Add-Member –MemberTypeNoteProperty –Name DomainName = $Domain.DistinguishedName

  Return $DomainInfo

}

Function Get_BaseDN
{

}
Function Create_OU
{
  params(
    [string]BaseDN
    [string]OU
  )

  New-OrganisationalUnit -
}

Function Create_Groups
{
  params(
    [string]BaseDN
    [string]GroupName
    [string]GroupScope
    [String]GroupType
  )
  New-ADGroup -Name $GroupName -GroupType $GroupType -GroupScope $GroupScope
}

Function Create_Users
{
  params(
    [string]BaseDN
    [string]UserName
  )
  New-ADUser -Name OU
}

$GroupsCSV = F:/SampleScripts/ADGroups.csv
$OUCSV  = F:/SampleScripts/ADOU.csv
$UsersCSV = F:/SampleScripts/ADUsersCSV.csv

$DomainName = Get_BaseDN
$BaseDN = Get_BaseDN

$NewGroups = Import-CSV -Path $GroupsCSV
$NewOUs = Import-CSV -Path $OUCSV
$UsersCSV = Import-CSV -Path $UsersCSV

ForEach ($Group in $NewGroups)
{
  Create_Groups -BaseDN

}
