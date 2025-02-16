# Create and deploy google chrome in configMgr (SCCM) using powershell
#1. Define Variables
$appname = "Google Chrome for Clients 10 and 11"
$publisher = "Google LLC"
$version = "133.0.6943.60"
$location = "\\sccm01\Applications\GoogleChrome\GoogleChromeStandaloneEnterprise64.msi"
$collname = "All Windows Servers"
$description = "Web Browser"
$icon = "\\sccm01\Applications\GoogleChrome\icons8-google-48.png"
$dp = "SCCM01.TEKSITE.ORG"

$install = 'msiexec.exe /i "GoogleChromeStandaloneEnterprise64.msi" /quiet /norestart'
$uninstall = 'msiexec.exe /x "GoogleChromeStandaloneEnterprise64.msi" /quiet /norestart'


#2. Create New Application
New-CMApplication -Name $appname -Description $description -SoftwareVersion $version -Publisher $publisher -AutoInstall $true -IconLocationFile $icon -Verbose

#3. Add Deployment Type
Add-CMMsiDeploymentType -ApplicationName $appname -ContentLocation $location -InstallationBehaviorType InstallForSystem -InstallCommand $install -UninstallCommand $uninstall -Verbose

#4. Distribute The App To DP
Start-CMContentDistribution -ApplicationName $appname -DistributionPointName $dp -Verbose

#5. Deployment 
New-CMApplicationDeployment -CollectionName $collname -Name $appname -DeployAction Install -DeployPurpose Required -UserNotification DisplayAll -AvailableDateTime (Get-Date) -TimeBaseOn LocalTime -Verbose
