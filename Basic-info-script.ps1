$name = hostname 
new-item "$name.txt"
$name | add-content "$name.txt"
$(ipconfig | where {$_ -match 'IPv4.+\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' } | out-null; $Matches[1])|add-content "$name.txt"
ping google.com | where {$_ -match 'Minimum'} |add-content "$name.txt"
