# Powershell AOC Day 5
$list = Get-Content ./adventofcode/5.txt

# Setup hashtable
$map = @{}

# Loop through entries 
foreach ($entry in $list) {
    [int[]]$coords = $entry.split(' ').split(',')[0, 1, 3, 4]
    if (($coords[0] -eq $coords[2]) -or ($coords[1] -eq $coords[3])) {
        continue
        foreach ($x in ($coords[0]..$coords[2])) {
            foreach ($y in ($coords[1]..$coords[3])) {
                $map["$x,$y"] += 1
            }
        }
    } 
    
    else {
        $x = ($coords[0]..$coords[2])
        $y = ($coords[1]..$coords[3])
        for ($i = 0; $i -lt $x.Count; $i++) {
            $map["$($x[$i]),$($y[$i])"] += 1
        }
    }
}

