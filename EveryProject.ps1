Write-Output "Every Project power shell script triggered"

# defining the paths to each folder
$ReleaseFolder = 'C:\Jenkins\workspace\Sanjith_test\Release'
$ConfiguredFolder = 'C:\Jenkins\workspace\Sanjith_test\Configured'
$BackupFolder = 'C:\Jenkins\workspace\Sanjith_test\Backup'

#check if configured folder is present
if (-not (Test-Path -Path $ConfiguredFolder)) {
    Write-Output "Creating ConfiguredFolder at $ConfiguredFolder"
    New-Item -ItemType Directory -Path $ConfiguredFolder
}
#Write-Output "Modifying Configured Folder at $ConfiguredFolder"

#Creating a backup
if (-not (Test-Path -Path $BackupFolder)) {
     Write-Output "Creating BackupFolder at $BackupFolder"
     New-Item -ItemType Directory -Path $BackupFolder
}

Write-Output "Created"

