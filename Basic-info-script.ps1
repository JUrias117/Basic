$name = hostname #set variable to machine name

new-item "$name.txt" #create txt file
$name | add-content "$name.txt" #add name to file
Get-Date -Format g | Add-Content "$name.txt" #add date/time 
$(ipconfig | where {$_ -match 'IPv4.+\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' } | out-null; $Matches[1])|add-content "$name.txt" #Get ip address
ping google.com | where {$_ -match "Minimum"} |add-content "$name.txt" #add ping info
[environment]::osversion | add-content "$name.txt"

#promot for volume repair
$Repair = Read-Host -Prompt "Run Repair Volume?(y/n): "
if($Repair.ToUpper() -eq "Y")
{
Repair-volume -DriveLetter C -OfflineScanAndFix
}

#prompt for defrag
$Defrag = Read-Host -Prompt "Run Defrag?(y/n): "
if($Defrag.ToUpper() -eq "Y")
{
Optimize-Volume -DriveLetter C -Defrag -Verbose
}