$Network = (get-netconnectionProfile).Name
if ($Network -match "BITS-(STUDENT|STAFF)") {
	$Username = ""
	$Password = ""
	$Time = ((Get-Date -UFormat %s) -Replace("[,\.]", "")).Substring(0,13)
	$Url = "https://fw.bits-pilani.ac.in:8090/httpclient.html"
	$Params = @{mode=191;username=$Username;password=$Password;
	a=$Time;producttype=0}
	Invoke-WebRequest -Uri $Url -Method POST -Body $Params
}
