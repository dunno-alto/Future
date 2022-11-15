$credentials = Get-Credential
$filename = 'C:\path-to-folder\Secret_site.txt'
$credentials | Export-CliXml -Path $filename
