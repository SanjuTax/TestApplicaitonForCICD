# Define the source and destination paths
$sourceFolder = "C:\Jenkins\workspace\Sanjith_test"
$destinationFolder = "C:\Jenkins\workspace\Sanjith_test\My_repo"
$zipFileName = "ArchivedFolder.zip"
$zipFilePath = Join-Path -Path $destinationFolder -ChildPath $zipFileName

# Create the destination folder if it doesn't exist
if (-not (Test-Path -Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder
}
