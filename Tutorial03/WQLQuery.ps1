# Retrieve Workstation Devices from SCCM using PowerShell & (WQL Query)

$SiteCode = ""  # Replace with your SCCM site code
$SCCMNamespace = "root\SMS\site_$SiteCode"
$Query = "select *  from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion like '%workstation%'"


$Results = Get-CimInstance -Namespace $SCCMNamespace -Query $Query

$Results | Select-Object ResourceID, Name, Client, ResourceDomainORWorkgroup

