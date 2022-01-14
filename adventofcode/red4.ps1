$numberdata = Get-Content -path adventOfCode\4.txt
$BingoBoards = Get-Content "L:\Geeking Out\AdventOfCode\2021\Day 04 Squid\Bingo Boards.txt"
$numbers = $numberdata.split(",")
$win = "No"
$lowcount = 999
for($counter=0;$counter -lt $BingoBoards.count;$counter += 6){
    $TTT = New-object 'object[,]' 5,5
    for($i=0;$i -le 6;$i++){
        if($BingoBoards[$counter+$i].Length -gt 0){
            for($j=0;$j -lt 5;$j++){$TTT[($i-1),$j] = [int]$BingoBoards[$counter+$i].substring($j*3,2)} 
        }
    }
    $numbercount = 0
    $win = "No"
    $sum = 0
    foreach($number in $numbers){
        if($win -ne "Yes"){
            $numbercount++
            for($x=0;$x -le 4;$x++){
                for($y=0;$y -le 4; $y++){
                    if($ttt[$x,$y] -eq $number){$ttt[$x,$y] = ""}
                }
            }
            for($x=0;$x -le 4;$x++){
                if(($ttt[$x,0] -eq "") -and ($ttt[$x,1] -eq "") -and ($ttt[$x,2] -eq "") -and ($ttt[$x,3] -eq "") -and ($ttt[$x,4] -eq "")){
                    $Win = "Yes"
                    $winningnumber = $number
                    $ttt | Foreach { $sum += $_} -ErrorAction SilentlyContinue             
                    $total = $sum * $winningnumber
                }
            }    
            for($y=0;$y -le 4;$y++){
                if(($ttt[0,$y] -eq "") -and ($ttt[1,$y] -eq "") -and ($ttt[2,$y] -eq "") -and ($ttt[3,$y] -eq "") -and ($ttt[4,$y] -eq "")){
                    $Win = "Yes"
                    $winningnumber = $number
                    $ttt | Foreach { $sum += $_} -ErrorAction SilentlyContinue
                    $total = $sum * $winningnumber             
                }
            }    
        }
    }
    if($numbercount -lt $lowcount){
        $lowcount = $numbercount
        write-host "Moves:" $numbercount "total score:" $total
    }
}