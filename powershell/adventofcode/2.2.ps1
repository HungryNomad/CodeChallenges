# Powershell AOC Day 2 
$list = Get-Content ./adventofcode/2.txt
$horizonal = 0
$depth = 0
[int]$aim = 0

# Itterate through the list
foreach ($movement in $list) {
    # Parse to array
    $movement = $movement -split ' '
    # Switch based on the first element
    switch -Regex ($movement[0]){
        'up' { $aim -= [int]$movement[1] }
        'down' { $aim += [int]$movement[1] }
        'forward' { $horizonal += [int]$movement[1]
            if ($aim -ne 0) { $depth += [int]$movement[1] * $aim }        
        }
    }
}
$combined = $horizonal * $depth
Write-Output "Depth: $depth Horizontal: $horizonal Combined: $combined"