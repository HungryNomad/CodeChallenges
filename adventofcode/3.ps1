# Powershell AOC Day 3
$list = Get-Content ./adventofcode/3.txt

# Fun with hashtables! Everything initailized to 0
$tracker = @{}

foreach ($reading in $list) {
    # Track the bit position in $bit
    foreach ($bit in 0..($reading.length-1)) {
        # If bit is 1, make it more positive, 0 => more negative
        switch ($reading[$bit]) {
            '1' { $tracker.$bit += 1 }
            '0' { $tracker.$bit -= 1 }
        }
    }
}

[string]$gamma = ""
[string]$epsilon = ""

# Go through each element in the table
# $_ is the pipe variable
0..($tracker.count-1) | Foreach-Object {
    # If positive, append string "1"
    if ($tracker.$_ -gt 0) { $gamma += "1"; $epsilon += "0"; }
    # Neg, append string "0"
    else { $gamma += "0"; $epsilon += "1";}
}

# Convert to INT from base 2
$gamma = [convert]::ToInt32($gamma,2)
$epsilon = [convert]::ToInt32($epsilon, 2)
$power = [int]$gamma * [int]$epsilon
Write-Output "Gamma: $gamma Epsilon: $epsilon Power: $power"

# Bit flip method
while (0){
    # Set CO2 as binary oxygen but with the left side padded with 1's 
    $bitFlipMeBIN = $oxygenBIN.PadLeft(32, '1')
    # Convert to INT from base 2
    $bitFlipMeINT = [convert]::ToInt32($bitFlipMeBIN, 2)
    # Bit flip with Binary NOT, turing the padded 1's into 0's
    $co2INT = -bnot $bitFlipMeINT
    # Not needed, but we can check co2BIN vs oxygenBIN verify the bits flipped
    $co2BIN = [convert]::toString($co2INT, 2)
}