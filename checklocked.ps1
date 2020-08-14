while (1){
    $output = $NULL
    Start-Sleep -Seconds 30
    $lockeduser = Search-ADAccount -LockedOut
    if ($lockeduser -ne $null){
        $date = Get-Date -format "dd/MM/yyyy HH:mm"
        [string]$output += '[' + [string]$date + "] Des sessions on été bloquer :`r`n"
        foreach ($user in $lockeduser){
            [string]$output += $user.Name + "`r`n"
        }
        if ($output -ne 1){
        #$wshell = New-Object -ComObject Wscript.Shell
        $text = $output
        #$wshell.Popup($text,0,"Compte vérouiller",0x1)
        Add-Content -path "W:\Pole_STS\unite_SPT\Apprenti\joseph\Scripts & Developpement\CheckLocked\test.txt" $output
        }    
    }
}