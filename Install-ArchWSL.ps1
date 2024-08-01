# Enable the required Windows features for WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Set WSL 2 as the default version
wsl --set-default-version 2

# Download Arch Linux for WSL
Invoke-WebRequest -Uri https://github.com/yuk7/ArchWSL/releases/download/v22.4.2/Arch.zip -OutFile $env:USERPROFILE\Arch.zip

# Unzip the downloaded file
Expand-Archive $env:USERPROFILE\Arch.zip -DestinationPath $env:USERPROFILE\ArchWSL

# Install Arch Linux
cd $env:USERPROFILE\ArchWSL
.\Arch.exe

# Clean up downloaded files
Remove-Item $env:USERPROFILE\Arch.zip

Write-Host "Arch Linux installation is complete. You can now start Arch Linux by running Arch.exe from the installation directory."
