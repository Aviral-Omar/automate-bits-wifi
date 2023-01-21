$Network = (get-netconnectionProfile).Name
if ($Network -match "BITS-(STUDENT|STAFF)") {
	$Username = ""
	$Password = ""

	$Time = ((Get-Date -UFormat %s) -Replace("[,\.]", "")).Substring(0,13)
	$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
	$headers.Add("Content-Type", "application/x-www-form-urlencoded")

	$body = "mode=191&username=$Username&password=$Password&a=$Time&producttype=0"

	$response = Invoke-RestMethod 'https://fw.bits-pilani.ac.in:8090/login.xml' -Method 'POST' -Headers $headers -Body $body
	$response | ConvertTo-Json
}
