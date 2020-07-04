$MDT_folder_path = "C:\FolderNew"
$MDT_share_name = "ShareNew"
$MDT_description = "New Share"
$MDT_drive = "DS003"
$UNCPath = "\\192.168.22.30\$MDT_share_name"

Add-PSSnapIn Microsoft.BDD.PSSnapIn

New-PSDrive –Name "DS003" -PSProvider "MDTProvider" –Root $MDT_folder_path –Description $MDT_description –NetworkPath $UNCPath -Verbose | add-MDTPersistentDrive –Verbose
import-mdtoperatingsystem -path "DS003:\Operating Systems" -SourcePath E: -DestinationFolder "Windows 10 Enterprise LTSC 2019 Evaluation x64" -Verbose
import-mdttasksequence -path "DS003:\Task Sequences" -Name "Install Win10" -Template "Client.xml" -Comments "" -ID "WIN10-A" -Version "1.0" -OperatingSystemPath "DS003:\Operating Systems\Windows 10 Enterprise LTSC 2019 Evaluation in Windows 10 Enterprise LTSC 2019 Eva x64 install.wim" -FullName "Vagrant" -OrgName "Test" -HomePage "about:blank" -AdminPassword "vagrant" -Verbose
update-MDTDeploymentShare -path "DS003:" -Force -Verbose
Get-WdsBootImage | Remove-WdsBootImage
Import-WdsBootImage -Path "$MDT_folder_path\Boot\LiteTouchPE_x64.wim"
