# Powershell AOC Day 3 Part 2
$list = Get-Content ./adventofcode/3.txt

# Create an array of char arrays
$array = @()
$list | ForEach-Object {
    $array += ,@($_.ToCharArray())
}

# Set the loop up
$common = $array
$uncommon = $array
# Repeat til the end of the array length
foreach ($index in 0..($common[0].Length-1)) {
    # Group them together based on first CHAR
    $common = $common | Group-Object { $_[$index] } | Sort-Object -Descending -Property Count, Name
    $uncommon = $uncommon | Group-Object { $_[$index] } | Sort-Object -Property Count,Name
    # Grab only entries from the highest occuring group (first entry because I sorted it above)
    $uncommon 
    Write-Output "Index: $index"

    $common = $common[0].Group 
    $uncommon = $uncommon[0].Group 
    # Repeat for index 1,2,3,4....    
}
# Char array to joined as a string with no spaces (binary)
$oxygenBIN = $common[0] -join ""
# Convert to INT from base 2
$oxygenINT = [convert]::ToInt32($oxygenBIN, 2)
# Char array to joined as a string with no spaces (binary)
$co2BIN = $uncommon[0] -join ""
# Convert to INT from base 2
$co2INT = [convert]::ToInt32($co2BIN, 2)

Write-Output "Binary `nO2: $oxygenBIN `nCO2: $co2BIN"
Write-Output "Decimal `nO2: $oxygenINT `nCO2: $co2INT"
Write-Output "Combined $($oxygenINT * $co2INT)"