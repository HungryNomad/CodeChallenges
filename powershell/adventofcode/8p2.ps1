# Powershell AOC Day 8 Part 2

$list = "be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe",
"edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc",
"fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg",
"fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb",
"aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea",
"fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb",
"dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe",
"bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef",
"egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb",
"gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce"

$list = Get-Content ./adventofcode/8.txt

#$lineStr = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"

$count = 0
$result = 0
foreach ($lineStr in $list) {

    $line = @{
        numbers = $lineStr.split('|')[0].trim().Split(' ')
        output  = $lineStr.split('|')[-1].trim().Split(' ')
    }

    #deduce the segments all numbers
    $number1 = $line.numbers | Where-Object { $_.length -eq 2 }
    $number7 = $line.numbers | Where-Object { $_.length -eq 3 }
    $number4 = ($line.numbers | Where-Object { $_.length -eq 4 })
    $number8 = $line.numbers | Where-Object { $_.length -eq 7 }

    $segment1 = $number7.ToCharArray() | Where-Object { $number1.ToCharArray() -notcontains $_ }
    $number9 = $line.numbers | Where-Object { $_.length -eq 6 } | Where-Object {
        $x = 1
        foreach ($letter in $number4.ToCharArray()) {
            if ($letter -notin $_.tocharArray() -and ($letter -notin $segment1)) {
                $x = 0
            }
        }
        $x
    } 
    $segment5 = $number8.ToCharArray() | Where-Object { $number9.ToCharArray() -notcontains $_ }
    $segment7 = $number9.ToCharArray() | Where-Object { ($number4.ToCharArray() -notcontains $_) -and ($number7.ToCharArray() -notcontains $_) }
    $number6 = $line.numbers | Where-Object { $_.length -eq 6 } | Where-Object {
        ($number1.tocharArray()[0] -notin $_.tocharArray()) -or
        ($number1.tocharArray()[1] -notin $_.tocharArray())
    } 
    $number5 = $line.numbers | Where-Object { $_.length -eq 5 } | Where-Object {
        ($number1.tocharArray()[0] -notin $_.tocharArray()) -or
        ($number1.tocharArray()[1] -notin $_.tocharArray()) -and
        $segment5 -notin $_.tocharArray()
    } 
    $number2 = $line.numbers | Where-Object { $_.length -eq 5 } | Where-Object {
        ($number1.tocharArray()[0] -notin $_.tocharArray()) -or
        ($number1.tocharArray()[1] -notin $_.tocharArray()) -and
        $segment5 -in $_.tocharArray()
    } 
    $number3 = $line.numbers | Where-Object { $_.length -eq 5 } | Where-Object {
        ($number1.tocharArray()[0] -in $_.tocharArray()) -and
        ($number1.tocharArray()[1] -in $_.tocharArray()) 
    } 
    $number0 = $line.numbers | Where-Object { $_.length -eq 6 } | Where-Object {
        ($_ -ne $number1) -and
        ($_ -ne $number2) -and
        ($_ -ne $number3) -and
        ($_ -ne $number4) -and
        ($_ -ne $number5) -and
        ($_ -ne $number6) -and
        ($_ -ne $number7) -and
        ($_ -ne $number8) -and
        ($_ -ne $number9)
    }
    $numberString = ""
    foreach ($output in $line.output) {
        $param = ($output.ToCharArray() | Sort-Object) -join ''
        switch ($param){
            "$(($number0.ToCharArray() | Sort-Object) -join '')" { $numberString += "0" } 
            "$(($number1.ToCharArray() | Sort-Object) -join '')" { $numberString += "1" } 
            "$(($number2.ToCharArray() | Sort-Object) -join '')" { $numberString += "2" } 
            "$(($number3.ToCharArray() | Sort-Object) -join '')" { $numberString += "3" } 
            "$(($number4.ToCharArray() | Sort-Object) -join '')" { $numberString += "4" } 
            "$(($number5.ToCharArray() | Sort-Object) -join '')" { $numberString += "5" } 
            "$(($number6.ToCharArray() | Sort-Object) -join '')" { $numberString += "6" } 
            "$(($number7.ToCharArray() | Sort-Object) -join '')" { $numberString += "7" } 
            "$(($number8.ToCharArray() | Sort-Object) -join '')" { $numberString += "8" } 
            "$(($number9.ToCharArray() | Sort-Object) -join '')" { $numberString += "9" } 
        }
    }

    $result += $numberString -as [int]


}
$result