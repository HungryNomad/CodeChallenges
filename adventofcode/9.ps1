# Powershell AOC Day 9 Part 1

$list = 2199943210,
3987894921,
9856789892,
8767896789,
9899965678


# Pad a list with 9s
[System.Collections.ArrayList] $paddedList = , "9" * ($list[0].length + 2)
for ($i = 0; $i -lt $list.count; $i++) {
    $entry = $list[$i] -as [string]
    $paddedList.Add($(($entry).PadLeft((($entry).length + 1), "9"))) | Out-Null
}
$paddedList.add("9" * ($list[0].length + 2))


for ($i = 0; $i -lt $list[0].length; $i++) {
  
}

$list = Get-Content ./adventofcode/9.txt

$lineStr = 2199943210