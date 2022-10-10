[system.collections.arraylist]$data = get-content "3.txt"
$Generator = ""
$Scrubber = ""
for($i=0;$i -lt $data[0].Length;$i++){
    [int]$Ones = 0
    [int]$Zeros = 0
    foreach($line in $data){if($line.Substring($i,1) -eq "1"){$Ones++} Else {$Zeros++}}
    if($Ones -ge $Zeros){for($j=$data.count-1;$j -ge 0;$j--){if($data[$j].Substring($i,1) -eq "0"){$data.Removeat($j)}}}
    else {for($j=$data.count-1;$j -ge 0;$j--){if($data[$j].Substring($i,1) -eq "1"){$data.Removeat($j)}}}
    if($data.count -eq 1){$Generator=$data[0]}
}
[system.collections.arraylist]$data = get-content "3.txt"
for($i=0;$i -lt $data[0].Length;$i++){
    [int]$Ones = 0
    [int]$Zeros = 0
    foreach($line in $data){if($line.Substring($i,1) -eq "1"){$Ones++} Else {$Zeros++}}
    if($Zeros -gt $Ones){for($j=$data.count-1;$j -ge 0;$j--){if($data[$j].Substring($i,1) -eq "0"){$data.Removeat($j)}}}
    else {for($j=$data.count-1;$j -ge 0;$j--){if($data[$j].Substring($i,1) -eq "1"){$data.Removeat($j)}}}
    if($data.count -eq 1){$Scrubber=$data[0]}
}
write-host ([convert]::ToInt32($Generator,2) * [convert]::ToInt32($Scrubber,2))