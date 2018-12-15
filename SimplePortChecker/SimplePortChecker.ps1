#This script reports the ports that are active, and some basic information about them

$portChecker = @()

$ports = Get-NetTCPConnection -state Established

$ports | ForEach-Object -Process {
    $obj = New-Object System.object
    $obj | Add-Member -MemberType NoteProperty -Name 'LocalAddress' -Value $_.LocalAddress
    $obj | Add-Member -MemberType NoteProperty -Name 'LocalPort' -Value $_.LocalPort
    $obj | Add-Member -MemberType NoteProperty -Name 'RemoteAddress' -Value $_.RemoteAddress
    $obj | Add-Member -MemberType NoteProperty -Name 'RemotePort' -Value $_.RemotePort
    $obj | Add-Member -MemberType NoteProperty -Name 'OwningProcess' -Value $_.OwningProcess
    
    $portChecker += $obj
}
Write-Host 'Number of Ports established = ' $portChecker.Count

$portChecker | ForEach-Object -Process { 
    $process = Get-Process -Id $_.OwningProcess
    $_ | Add-Member -MemberType NoteProperty -Name 'Process' -Value $process.name
    $_ | Add-Member -MemberType NoteProperty -Name 'ID' -Value $process.id
    $_ | Add-Member -MemberType NoteProperty -Name 'Path' -Value $process.path
}


$portChecker | Format-Table -GroupBy OwningProcess -wrap