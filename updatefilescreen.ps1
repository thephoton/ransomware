#This script updates the 'known ransomware files' file screen group using content from this github repo

$decryptreadme = (Invoke-WebRequest "https://raw.githubusercontent.com/thephoton/ransomware/master/filescreendecryptreadme.txt").Content
$fileexts = (Invoke-WebRequest "https://raw.githubusercontent.com/thephoton/ransomware/master/filescreenextensions.txt").Content

$filescreengroup = @()
foreach($line in $decryptreadme.Split("`r`n")){ if ($line -ne "") {$filescreengroup += $line} }
foreach($line in $fileexts.Split("`r`n")){ if ($line -ne "") {$filescreengroup += $line} }

Get-FsrmFileGroup "Known Ransomware Files" | Set-FsrmFileGroup -IncludePattern $filescreengroup
