$writeToPath = ''
$copyFromPath = ''

$itemImages = Get-ChildItem -Path $copyFromPath -recurse -Include *.png

$itemImages | ForEach-Object -Process{
    copy-item $_ -Destination $writeToPath
}