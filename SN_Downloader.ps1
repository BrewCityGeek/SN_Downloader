$numOfEpisodes = 563 .. 563
$outputDirectory = "C:\Users\$env:username\Downloads\Podcasts\Security Now"
$path = "C:\Users\$env:username\Downloads\Podcasts\Security Now","C:\Users\$env:username\Downloads\Podcasts\Security Now\Audio","C:\Users\$env:username\Downloads\Podcasts\Security Now\Show Notes","C:\Users\$env:username\Downloads\Podcasts\Security Now\Transcripts\PDF","C:\Users\$env:username\Downloads\Podcasts\Security Now\Transcripts\HTML","C:\Users\$env:username\Downloads\Podcasts\Security Now\Transcripts\Text"
md $path -Force
$progressPreference = 'silentlyContinue'

foreach ($num in $numOfEpisodes) {

#Clear screen on each pass
Clear
$num3Digit = "{0:D3}" -f $num
$num4Digit = "{0:D4}" -f $num
Write-Host "Downloading Security Now Episode# $num3Digit..."
#Write-Host $num4Digit

$url = "https://twit.cachefly.net/audio/sn/sn$num4Digit/sn$num4Digit.mp3"
#$url = "https://media.grc.com/sn/sn-$num3Digit.mp3"
$outputFile = "$outputDirectory\audio\sn$num4Digit.mp3"
try {if (!(Test-Path $outputFile)) {Invoke-WebRequest $url -OutFile $outputFile}}
catch {Write-Host "$num3Digit not available in audio"}

Write-Host "Downloading Security Now Episode# $num3Digit show notes..."
$url = "https://www.grc.com/sn/sn-$num3Digit-notes.pdf"
$outputFile = "$outputDirectory\show notes\sn$num3Digit.pdf"
try {if (!(Test-Path $outputFile)) {Invoke-WebRequest $url -OutFile $outputFile}}
catch {Write-Host "$num3Digit not available in show notes"}

Write-Host "Downloading Security Now Episode# $num3Digit HTML transcript..."
$url = "https://www.grc.com/sn/sn-$num3Digit.htm"
$outputFile = "$outputDirectory\transcripts\html\sn$num3Digit.htm"
try {if (!(Test-Path $outputFile)) {Invoke-WebRequest $url -OutFile $outputFile}}
catch {Write-Host "$num3Digit not available in html transcript"}

Write-Host "Downloading Security Now Episode# $num3Digit PDF transcript..."
$url = "https://www.grc.com/sn/sn-$num3Digit.pdf"
$outputFile = "$outputDirectory\transcripts\pdf\sn$num3Digit.pdf"
try {if (!(Test-Path $outputFile)) {Invoke-WebRequest $url -OutFile $outputFile}}
catch {Write-Host "$num3Digit not available in pdf transcript"}

Write-Host "Downloading Security Now Episode# $num3Digit TXT transcript..."
$url = "https://www.grc.com/sn/sn-$num3Digit.txt"
$outputFile = "$outputDirectory\transcripts\text\sn$num3Digit.txt"
try {if (!(Test-Path $outputFile)) {Invoke-WebRequest $url -OutFile $outputFile}}
catch {Write-Host "$num3Digit not available in txt transcript"}

}

Clear
Write-Host ""
Write-Host "Download Complete!"
Sleep 1
Write-Host ""
Write-Host "Exiting in 5"
Sleep 1
Write-Host "4"
Sleep 1
Write-Host "3"
Sleep 1
Write-Host "2"
Sleep 1
Write-Host "1"
Sleep 1
Write-Host "Goodbye!!"
Sleep 1