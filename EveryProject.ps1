Write-Output "Every Project power shell script triggered"

# defining the paths to each folder
$ReleaseFolder = 'C:\Jenkins\workspace\Sanjith_test\Release\Sanju'
$ConfiguredFolder = 'C:\Jenkins\workspace\Sanjith_test\Configured'
$BackupRoot = 'C:\Jenkins\workspace\Sanjith_test\Backup\'
$zipFileName = "ArchivedFolder_$(Get-Date -Format 'yyyyMMddHHmmss').zip"
$currentDate = Get-Date -Format "MMddyyyy"
$tempFolder = 'C:\Jenkins\workspace\Sanjith_test\temp\'+$currentDate
$BackupFolder = $BackupRoot+$currentDate
$zipFilePath = Join-Path -Path $BackupRoot -ChildPath $zipFileName

#check if configured folder is present
if (-not (Test-Path -Path $ConfiguredFolder)) {
    Write-Output "Creating ConfiguredFolder at $ConfiguredFolder"
    New-Item -ItemType Directory -Path $ConfiguredFolder
}
#Write-Output "Modifying Configured Folder at $ConfiguredFolder"

#Creating a backupFolder
if (-not (Test-Path -Path $BackupFolder)) {
     Write-Output "Creating BackupFolder at $BackupFolder"
     New-Item -ItemType Directory -Path $BackupFolder
}

# Move the Configured folder to the temporary folder (cut operation)
Move-Item -Path $ConfiguredFolder -Destination $tempFolder

# Create a zip file from the moved folder
Write-Output "Creating Zip at $BackupFolder"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempFolder, $zipFilePath)

# Clean up the temporary folder
Remove-Item -Path $tempFolder -Recurse
Write-Output "Folder has been zipped and moved to $zipFilePath"

# Update to the latest version
Write-Output "Getting the latest version from Release"
Copy-Item -Path $ReleaseFolder -Destination $ConfiguredFolder -Recurse
