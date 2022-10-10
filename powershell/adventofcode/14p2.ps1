# Powershell AOC Day 14 Part 1

$list = "NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C" -split "\n"

#$list = Get-Content ./adventofcode/14.txt

$levelOne = @{}
$memorize = @{}

# Create the first level
for ($i = 2; $i -lt $list.Count; $i++) {
    $parsed = $list[$i] -split " "
    $levelOne[$parsed[0]] = $parsed[2].trim()
}

# Add it to the memorize table
$memorize = @{
    '1' = $levelOne
}

function Get-polymer {
    param([parameter(Mandatory)][string]$polymer,
        [parameter(Mandatory)][int]$level)

    if ($polymer.Length -gt 2) {
        $endPolymer = "$($polymer[0])"
        for ($i = 1; $i -lt $polymer.Length; $i ++) {
            $a = $polymer[$i - 1]
            $b = $polymer[$i]
            $middle = (Get-polymer -polymer "$a$b" -level ($level))
            $endPolymer += $middle + $b
        }
        $endPolymer
    } else {
        $ab = $polymer
        $a = $polymer[0]
        $b = $polymer[1]
    
        if (-not $memorize.containsKey("$level")) {
            $memorize.Add("$level", @{})
        }
        if (-not $memorize["$level"].containsKey("$ab")) {
            $middle = Get-polymer -polymer $ab -level ($level - 1)
            $add = Get-polymer -polymer ($a+$middle+$b) -level ($level - 1)
            $memorize["$level"][$ab] = $add[1..($add.length-2)] -join ""
        }
        return $memorize."$level".$ab
    }
}

$result = Get-polymer -polymer "NNCB" -level 5


# Display count of each letter in the array
$totals = $result.ToCharArray() | Group-Object | Sort-Object Count
$totals
$totals[-1].count - $totals[0].count

#>