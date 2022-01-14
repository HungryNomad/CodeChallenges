# Powershell AOC Day 2 
$list = Get-Content ./adventofcode/2.txt
$horizonal = 0
$depth = 0

# Itterate through the list
foreach ($movement in $list) {
    # Parse to array
    $movement = $movement -split ' '
    # Switch based on the first element
    switch -Regex ($movement[0]){
        'up' { $depth -= $movement[1] }
        'down' { $depth += $movement[1] }
        'forward' { $horizonal += $movement[1] }
    }
}
$combined = $horizonal * $depth
Write-Output "Depth: $depth Horizontal: $horizonal Combined: $combined"