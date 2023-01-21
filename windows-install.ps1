# schtasks /create /tn "Net-Connected" /tr "powershell -executionpolicy bypass -file '%SYSTEMDRIVE%\autologin.ps1'" /SC ONEVENT /EC Microsoft-Windows-NetworkProfile/Operational /MO "*[System[Provider[@Name='Microsoft-Windows-NetworkProfile'] and EventID=10000]]" /RU "System" /F
Copy-Item -Path ".\autologin-win.ps1" -Destination "C:\"

$Name = "Automate WiFi Login"
$Action = New-ScheduledTaskAction  -Execute 'Powershell.exe' -Argument "-ExecutionPolicy Unrestricted -File C:\autologin-win.ps1"

$CIMTriggerClass = Get-CimClass -ClassName MSFT_TaskEventTrigger -Namespace Root/Microsoft/Windows/TaskScheduler:MSFT_TaskEventTrigger
$Trigger = New-CimInstance -CimClass $CIMTriggerClass -ClientOnly
$Trigger.Subscription =
@"
<QueryList><Query Id="0" Path="Microsoft-Windows-NetworkProfile/Operational"><Select Path="Microsoft-Windows-NetworkProfile/Operational">*[System[Provider[@Name='Microsoft-Windows-NetworkProfile'] and EventID=10000]]</Select></Query></QueryList>
"@
$Trigger.Enabled = $True

Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $Name -Description 'Automating logging in to BITS WiFi.' -User 'System' -Force
