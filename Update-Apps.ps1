#chrome update
$Path = $env:TEMP;
$Installer = "chrome_installer.exe";
Invoke-WebRequest "http://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Path\$Installer;
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait;
Remove-Item $Path\$Installer

#msedge update
$Path = $env:TEMP;
$Installer = "edge_installer.exe"; 
Invoke-WebRequest "https://go.microsoft.com/fwlink/?linkid=2109047&Channel=Stable&language=en&brand=M100" -OutFile "$Path\$Installer";
Start-Process -FilePath "$Path\$Installer" -ArgumentList "/silent", "/install" -Verb RunAs -Wait;
Remove-Item "$Path\$Installer"

#firefox update
$Path = $env:TEMP;
$Installer = "firefox_installer.exe";
Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest&os=win&lang=en-US" -OutFile "$Path\$Installer";
Start-Process -FilePath "$Path\$Installer" -ArgumentList "/silent", "/install" -Verb RunAs -Wait;
Remove-Item "$Path\$Installer"

#ms365 update uses xml file and office deployment tool 