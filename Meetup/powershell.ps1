function invoke-sort {
    param ($head)
    
    $changed = $true
    while ($changed -eq $true) {
        $changed = $false
        for ($i = 0; $i -lt ($head.Count - 1); $i++) {
            if ($head[$i] -gt ($head[$i + 1])) {
                $swap = $head[$i]
                $head[$i] = $head[$i + 1]
                $head[$i + 1] = $swap
                $changed = $true
            }
        }
    }
    Write-Host $head
}
$test = (-1, 5, 3, 4, 0)
invoke-sort $test