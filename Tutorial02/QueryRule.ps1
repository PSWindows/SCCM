# Create Query Rule Device collections in sccm using powershell


#  Define Variables
      
$collectiondir = "C:\Users\administrator.TEKSITE\Desktop\"
$collectionname = ""
$Query = "select *  from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion like '%workstation%'"
     
# Create New Collection#

New-CMDeviceCollection -Name $collectionname -LimitingCollectionName "All Systems"
   
# Add members in the collection using query rule method#

Add-CMDeviceCollectionQueryMembershipRule -CollectionName $collectionname -QueryExpression  $Query -RuleName 'Query1'
