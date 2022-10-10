# Powershell AOC Day 5 part 2
$list = Get-Content ./adventofcode/5.txt

# Setup hashtable
$map = @{}

# Loop through entries 
foreach ($entry in $list) {
    [int[]]$parse = $entry.split(' ').split(',')[0, 1, 3, 4]
    # Cleanup
    $coords = [PSCustomObject]@{
        x1 = [int]$parse[0]
        y1 = [int]$parse[1]
        x2 = [int]$parse[2]
        y2 = [int]$parse[3]
    }
    # Add the vertical and horizontal coordinates
    if (($coords.x1 -eq $coords.x2) -or ($coords.y1 -eq $coords.y2)) {
        #continue
        foreach ($x in ($coords.x1..$coords.x2)) {
            foreach ($y in ($coords.y1..$coords.y2)) {
                $map["$x,$y"] += 1
            }
        }
    } 
    # Add the diagonal coordinates
    else {
        #continue
        $x = ($coords.x1..$coords.x2)
        $y = ($coords.y1..$coords.y2)
        for ($i = 0; $i -lt $x.Count; $i++) {
            $map["$($x[$i]),$($y[$i])"] += 1
        }
    }
}

# Group all of the points based on value, remove the single points, get the sum of the remaining ones
$map.GetEnumerator() | Group-Object value | Where-Object { $_.name -ne 1 } | Measure-Object -Sum Count