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

$list = Get-Content ./adventofcode/14.txt

$inserts = @{}

for ($i = 2; $i -lt $list.Count; $i++) {
    $parsed = $list[$i] -split " "
    $inserts[$parsed[0]] = $parsed[2].trim()
}
#$inserts

# Shorthand, non-fixed array. Char array to array of strings
[System.Collections.ArrayList]$polymer = $list[0].trim().ToCharArray() | ForEach-Object { $_ -as [string] }
$loops = 40
for ($j = 0; $j -lt $loops; $j++) {
    for ($i = 1; $i -lt $polymer.Count; $i += 2) {
        $a = $polymer[$i - 1]
        $b = $polymer[$i]
        $polymer.Insert($i, $inserts["$a$b"])
    }
    $j
}
# Display count of each letter in the array
$totals = $polymer | Group-Object | Sort-Object Count
$totals
$totals[-1].count - $totals[0].count