# Powershell AOC Day 7
$list = Get-Content ./adventofcode/7.txt

#$list = "16,1,2,0,4,2,7,1,2,14"

$locations = $list.split(",") -as [int[]]

$stats = $locations | Measure-Object -AllStats
$a = $stats.Minimum
$d = $stats.Maximum

$b = [math]::Round( ( ($d - $a) / 2) + $a  )
$c = $b + 1


$cost = @{}

while (($a -ne $b) -and ($c -ne $d) ) {
    # Shorthand for non-fixed array
    $points = {$b,$c}.Invoke()
    # Calculate initail costs of A and D 
    if ($cost.$a -eq $cost.$d) {
        $points.add($a)
        $points.add($d)
    }

    # Calculate costs of each element
    foreach ($point in $points) {
        $cost[$point] = ($locations | ForEach-Object { [math]::abs($_ - $point) } | Measure-Object -Sum).sum
        Write-Output "Point: $point Cost: $($cost[$point])"
        Write-Output "$a $b $c $d"
    }
    if ($cost.$b -lt $cost.$c) {
        $d = $c
    } else {
        $a = $b
    }
    $b = [math]::Round( ( ($d - $a) / 2) + $a  )
    $c = $b + 1

}

$cost
($cost.GetEnumerator() | sort value)[0]
