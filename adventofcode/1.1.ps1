# Powershell AOC Day 1 part 2
$list = Get-Content ./adventofcode/1.txt
$counter = 0

# Starting from the 4th line and go to index 1999
foreach ($index in 3..($list.Count-1)) {
    # A: Index-1 to Index-3
    $a = $list[$index - 1] + $list[$index - 2] + $list[$index - 3]
    # B: Current index and the previous 2
    $b = $list[$index] + $list[$index - 1] + $list[$index - 2]
    # Compare
    if ($a -lt $b){$counter += 1}
}

Write-Host $counter
