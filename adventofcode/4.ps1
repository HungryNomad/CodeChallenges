# Powershell AOC Day 4
$list = Get-Content ./adventofcode/4.txt

[int[]]$numbers = $list[0] -split ","
$cards = @()
$card = @()

# Make some 5x5 arrays of cards
foreach ($index in (2..$list.Count)) {
    if ($list[$index].Length) {
        $card += , [int[]]@($list[$index].replace('  ', ' ').trim() -split " ")
    } else {
        $cards += , @($card)
        $card = @()
    }
}

# Add every possible line to lines array (line, card)
$lines = @()
foreach ($cardIndex in (0..($cards.Count - 1))) {
    #Add horizontal lines
    foreach ($line in $cards[$cardIndex]) {
        $lines += , [PSCustomObject]@{
            line = $line -as [System.Collections.ArrayList]
            card = $cardIndex
        }   
    }
    # Add vertical lines
    $lineCol = @()
    foreach ($col in (0..($cards[$cardIndex].Count - 1))) {
        $lineCol = @()
        $lineCol += $cards[$cardIndex] | ForEach-Object { $_ | Select-Object -Skip $col | Select-Object -First 1 }

        $lines += , [PSCustomObject]@{
            line = $lineCol -as [System.Collections.ArrayList]
            card = $cardIndex
        }

    }
}

$winner = $null
$ball = 0
while ((-not $winner) -and ($ball -lt $numbers.Count)) {
    # Remove the number from every line
    foreach ($lineIndex in (0..($lines.count - 1))) {
        $lines[$lineIndex].line.remove($numbers[$ball])
    }        
    $winner = $lines | Where-Object { $_.line.count -eq 0 }
    $ball = $ball + 1
}
$winner

$remaining = (($lines | Where-Object { $_.card -eq $winner.card }).line | Select-Object -Unique | Measure-Object -Sum).sum
$lastNumber = $numbers[$ball - 1]
Write-Output "Remaining: $remaining LastNumber: $lastNumber Ball: $($ball-1) Score: $($remaining * $lastNumber)"