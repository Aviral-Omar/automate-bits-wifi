$Network = (get-netconnectionProfile).Name
if ($Network -match "BITS-(STUDENT|STAFF)") {
	$Username = "F20190411"
	$Password = "B3PS049854#"
	$Time = ((Get-Date -UFormat %s) -Replace("[,\.]", "")).Substring(0,13)
	$Url = "https://fw.bits-pilani.ac.in:8090/httpclient.html"
	$Params = @{mode=191;username=$Username;password=$Password;
	a=$Time;producttype=0}
	Invoke-WebRequest -Uri $Url -Method POST -Body $Params
}
