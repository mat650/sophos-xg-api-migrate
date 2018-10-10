
$count = 0
$sites= @("site01.dyndns.org","site02.dyndns.org","site03.dyndns.org","site04.dyndns.org","site05.dyndns.org","site06.dyndns.org","site07.dyndns.org","site08.dyndns.org","site09.dyndns.org")
$requestxml= "reqxml=<Request><Login><Username>admin</Username><Password>Tutefousdemagueule!</Password></Login><Get><SecurityPolicy></SecurityPolicy></Get></Request>"
$port_sophos= ":4444"
$api_sophos="/webconsole/APIController?"
Try {
			foreach($host_sophos in $sites)
			{
				$all= ( "https://$host_sophos$port_sophos$api_sophos$requestxml")
				#echo $all
				$count += 1
				$webclient = new-object System.Net.WebClient
				$webpage = $webclient.DownloadString($all)
				$status_page = $webclient.StatusCode
				$web.DownloadString($all)
				$webpagetxt = "C:\Users\matthieu\Documents\Sophos\API\webpage.timestamp.txt"
				$webpage > "$webpagetxt"
				$pattern = Select-String "$webpagetxt" -pattern '<Status>Active</Status>'
				Write-Host -fore Green "$count $host_sophos NSI VPN OK .... $status_page"
	   
			}
			"Total number of monitored site $count."

}            
Catch {
			$ErrorMessage = $_.Exception.Message
            Write-host -fore Red -nonewline "The error message was $ErrorMessage $host_sophos"
			Break
            }
