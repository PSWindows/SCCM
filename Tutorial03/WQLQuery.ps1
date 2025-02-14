# Retrieve Workstation Devices from SCCM using PowerShell & (WQL Query)

$SiteCode = ""  # Replace with your SCCM site code
$SCCMNamespace = "root\SMS\site_$SiteCode"
$Query = "select *  from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion like '%workstation%'"


$Results = Get-CimInstance -Namespace $SCCMNamespace -Query $Query

$Results | Select-Object ResourceID, Name, Client, ResourceDomainORWorkgroup

<#$Query = @"
SELECT  
    ResourceID,  
    ResourceType,  
    Name,  
    SMSUniqueIdentifier,  
    ResourceDomainORWorkgroup,  
    Client  
FROM  
    SMS_R_System  
WHERE  
    ResourceID IN (  
        SELECT ResourceID  
        FROM SMS_G_System_OPERATING_SYSTEM  
        WHERE Version LIKE '10.0%'  
        AND BuildNumber < '22000'  
        AND ProductType = '1'  
    )
"@#>
