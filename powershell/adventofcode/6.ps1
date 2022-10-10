# Powershell AOC Day 5
$list = Get-Content ./adventofcode/6.txt

#$list = "3,4,3,1,2"

Remove-Variable -Name array
$array = $list.split(",") |Group-Object | Select-Object name, count

$tracker = @{}
$array | ForEach-Object { $tracker.add("$($_.Name)", $_.count -as [int]) }
    
$days = 256

for ($day = 0; $day -lt $days; $day++) {
    $tracker = @{
        '8' = $tracker.'0'
        '7' = $tracker.'8'
        '6' = $tracker.'7' + $tracker.'0'
        '5' = $tracker.'6'
        '4' = $tracker.'5'
        '3' = $tracker.'4'
        '2' = $tracker.'3'
        '1' = $tracker.'2'
        '0' = $tracker.'1'
    }
}
$tracker

$tracker.GetEnumerator() | Measure-Object -sum value