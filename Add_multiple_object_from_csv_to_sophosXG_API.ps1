############### MRO ###############
####### juniper to Sophos XG#######
###################################
########## Powershell 6 ###########
###################################

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
$csv = import-csv objets.csv -Delimiter "," -Encoding UTF8

ForEach ($line in $csv) {
   
		$name_objet = $line.('OBJET')
		$ip_objet = $line.('IP')
		$url = "https://site01.dyndns.org:4444/webconsole/APIController?reqxml=<Request><Login><UserName>admin</UserName><Password>Tutefousdemagueule</Password></Login><Set Operation='add'><IPHost><Name>$($name_objet)</Name><IPFamily>IPv4</IPFamily><HostType>IP</HostType><IPAddress>$($ip_objet)</IPAddress></IPHost></Set></Request>"

		Write-Output $name_objet
		Write-Output $ip_objet
		Write-Output $url
		Invoke-webrequest -SkipCertificateCheck -URI $url
	  
}


