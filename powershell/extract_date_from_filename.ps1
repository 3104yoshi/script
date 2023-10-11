Write-Host "Extracting dates from filenames : format YYYY-MM-DD"

$pattern_with_hyphen="([0-9]{4}-[0-9]{2}-[0-9]{2})"

Get-ChildItem -Path "data\" | ForEach-Object {
    if ($_.Name -match $pattern_with_hyphen) {
        $date = $matches[1]
        Write-Host "$($_.Name): $date"
    }
}

Write-Host "Extracting dates from filenames : format YYYYMMDD"

$pattern="([0-9]{4}[0-9]{2}[0-9]{2})"

Get-ChildItem -Path "data\" | ForEach-Object {
    if ($_.Name -match $pattern) {
        $date = $matches[1]
        Write-Host "$($_.Name): $date"
    }
}
