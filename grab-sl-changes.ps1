# Get the current directory
$rootDirectory = (Get-Location).Path

# Run git status and capture the output
$gitStatusOutput = git status --porcelain

# Filter for lines that start with 'A', 'M', or 'R' indicating changes to be committed
$filesToBeCommitted = $gitStatusOutput | Where-Object { $_ -match '^\s*[A|M|R]' }

# Extract the file paths and convert them to absolute paths
$absoluteFilePaths = $filesToBeCommitted | ForEach-Object {
    $relativePath = $_ -replace '^\s*[A|M|R]\s+', ''
    Join-Path -Path $rootDirectory -ChildPath $relativePath
}

# Output the absolute file paths
$absoluteFilePaths

