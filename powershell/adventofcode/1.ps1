# Powershell AOC Day 1
$list = Get-Content ./adventofcode/1.txt
$counter = 0

# Itterate thorough indexes 1-1999
# 0..5 creates [0,1,2,3,4,5] similar to Python Range and .count is the same as py len()
foreach ($index in 1..($list.Count - 1)) {
    if ($list[$index] -gt $list[$index - 1]) { $counter += 1 }
}

Write-Host $counter

