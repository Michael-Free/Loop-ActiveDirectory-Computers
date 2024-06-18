$computers = Get-ADComputer -Filter * -Properties *
foreach ($computer in $computers) {
    $computerName = $computer.Name
    if (Test-Connection -ComputerName $computerName -Count 2 -Quiet) {
        write-host $computerName
        Invoke-Command -ComputerName $computerName -ScriptBlock {
           ## DO SHIT HERE
        }
    } else {
        Write-Host "$computerName is offline"
    }
}
