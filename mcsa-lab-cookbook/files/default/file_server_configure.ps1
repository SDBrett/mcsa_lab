<#
    Creates shares and directory structure
#>

$FriendlyName = hostname
New-FileShare -Name Accounting -SourceVolume (Get-Volume F) -FileServerFriendlyName $FriendlyName
New-FileShare -Name HR -SourceVolume (Get-Volume F) -FileServerFriendlyName $FriendlyName
New-FileShare -Name Management -SourceVolume (Get-Volume F) -FileServerFriendlyName $FriendlyName
New-FileShare -Name IT -SourceVolume (Get-Volume F) -FileServerFriendlyName $FriendlyName

$dirs = @(
"F:\Shares\Accounting\2017Accounts"
"F:\Shares\Accounting\2016Accounts"
"F:\Shares\Accounting\2015Accounts"
"F:\Shares\Accounting\2014Accounts"
"F:\Shares\HR\EmployeeContracts"
"F:\Shares\HR\PerformanceReviews"
"F:\Shares\Management\HowToMicroManage"
"F:\Shares\Management\SalesReports"
"F:\Shares\Management\SalesReports\EpicPieCharts"
"F:\Shares\Management\SalesReports\IgnoredOTRequests"
"F:\Shares\IT\CatPics"
"F:\Shares\IT\IgnoredSecurityReports"
"F:\Shares\IT\CatPics"
"F:\Shares\IT\Projects"
"F:\Shares\IT\Software"
)


foreach ($directory in $dirs)
{
    If (!(Test-Path $directory))
    {
        New-Item -ItemType Directory -Path $directory
    }
}
