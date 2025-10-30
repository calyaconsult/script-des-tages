<#
.SYNOPSIS
Searches for files containing a specific keyword and generates a CSV report.

.DESCRIPTION
This script searches for files (e.g., .txt, .md, .html) in a specified directory,
checks if they contain a keyword, and exports the results to a CSV file.

.PARAMETER SourceDirectory
The directory to search in (default: C:\Users\Hp\Documents).

.PARAMETER Keyword
The keyword to search for in files (default: "prompt").

.PARAMETER FileExtensions
File extensions to include (default: *.txt, *.md, *.html).

.PARAMETER OutputPath
Path for the CSV report (default: ./matching_files.csv).

.EXAMPLE
.\FileContentSearch.ps1 -SourceDirectory "C:\MyFiles" -Keyword "secret" -FileExtensions *.log,*.txt
#>
param(
    [string]$SourceDirectory = "C:\Users\Hp\Documents",
    [string]$Keyword = "christmas",
    [string]$FileExtensions = "*.txt;*.md;*.html",
    [string]$OutputPath = ".\matching_files.csv"
)

# Validate source directory
if (-not (Test-Path -Path $SourceDirectory -PathType Container)) {
    Write-Host "Error: The source directory '$SourceDirectory' does not exist." -ForegroundColor Red
    exit 1
}

Write-Host "Searching for files in: $SourceDirectory" -ForegroundColor Cyan
Write-Host "Keyword to find: '$Keyword'" -ForegroundColor Cyan
Write-Host "File types included: $FileExtensions" -ForegroundColor Cyan

# Convert extensions to array and normalize
$extensions = $FileExtensions.Split(";") | ForEach-Object {
    $_.TrimStart("*").ToLower()
}

# Search files and filter
$results = Get-ChildItem -Path $SourceDirectory -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $extensions -contains $_.Extension.ToLower() } |
    Where-Object { $_.LastWriteTime -ge (Get-Date).AddMonths(-6) } |
    ForEach-Object {
        $file = $_
        $containsKeyword = Select-String -Path $file.FullName -Pattern $Keyword -SimpleMatch -CaseSensitive:$false -Quiet
        if ($containsKeyword) {
            [PSCustomObject]@{
                Path                = $file.DirectoryName
                Filename            = $file.Name
                'Last Modification' = $file.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
            }
        }
    }

# Export results
if ($results) {
    Write-Host "OK: Found $($results.Count) files. Exporting to CSV..." -ForegroundColor Green
    $results | Export-Csv -Path (Resolve-Path $OutputPath) -NoTypeInformation -Encoding UTF8
    Write-Host "Report saved to: $OutputPath" -ForegroundColor Green
} else {
    Write-Host "Warning: No files found containing the keyword '$Keyword'." -ForegroundColor Yellow
}
