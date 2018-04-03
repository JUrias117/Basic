$name = hostname 
new-item "$name.txt"
$name | add-content "$name.txt"