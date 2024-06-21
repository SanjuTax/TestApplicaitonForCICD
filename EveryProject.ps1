Write-Output "Every Project power shell script triggered"

# defining the paths to each folder
$ReleaseFolder = 'C:\Jenkins\workspace\Sanjith_test\Release\Sanju'
$ConfiguredFolder = 'C:\Jenkins\workspace\Sanjith_test\Configured'
$BackupRoot = 'C:\Jenkins\workspace\Sanjith_test\Backup\'
$currentDate = Get-Date -Format "MMddyyyy"
$tempFolder = 'C:\Jenkins\workspace\Sanjith_test\temp\'+$currentDate
$BackupFolder = $BackupRoot+$currentDate

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

# Create a temporary folder for zipping
Write-Output "Creating tempFolder at $tempFolder"
if (-not (Test-Path -Path $BackupFolder)) {
    New-Item -ItemType Directory -Path $tempFolder
}

# Move the source folder to the temporary folder (cut operation)
Move-Item -Path $ReleaseFolder -Destination $tempFolder

# Create a zip file from the moved folder
Write-Output "Creating Zip at $BackupFolder"
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($tempFolder, $BackupFolder)

# Clean up the temporary folder
Remove-Item -Path $tempFolder -Recurse

Write-Output "Folder has been zipped and moved to $zipFilePath"

