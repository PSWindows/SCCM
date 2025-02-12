# Create Direct Rule Device collections in sccm using powershell

   $collectiondir = "C:\Users\administrator.TEKSITE\Desktop\"
   $collectionname = ""
   $computers = Get-Content "Path\PC_List.txt"
  
  
   New-CMDeviceCollection -Name $collectionname -LimitingCollectionName "All Systems"
    foreach($computer in $computers) {
        try {
            Add-CMDeviceCollectionDirectMembershipRule  -CollectionName $collectionname -ResourceId $(get-cmdevice -Name $computer).ResourceID
            }
        catch {
            "Invalid client or direct membership rule may already exist: $computer" | Out-File "$collectiondir\$collectionname`_invalid.log" -Append
            }
    }
