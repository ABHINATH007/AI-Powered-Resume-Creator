$targetDir = "C:\Users\Nirmal B\Downloads\abinath\AI_ResumeMatcher"
$startupDir = [Environment]::GetFolderPath("Startup")
$vbsScript = Join-Path $targetDir "run-background.vbs"

$vbsContent = "Set WshShell = CreateObject(`"WScript.Shell`")" + "`r`n" + "WshShell.Run chr(34) & `"$targetDir\start-server.bat`" & chr(34), 0" + "`r`n" + "Set WshShell = Nothing"
[System.IO.File]::WriteAllText($vbsScript, $vbsContent)

$ws = New-Object -ComObject WScript.Shell
$lnkPath = Join-Path $startupDir "ResumeForgeAI.lnk"
$lnk = $ws.CreateShortcut($lnkPath)
$lnk.TargetPath = "wscript.exe"
$lnk.Arguments = "`"$vbsScript`""
$lnk.WorkingDirectory = $targetDir
$lnk.Save()

Write-Host "Created shortcut: $lnkPath"
Write-Host "Exists: $(Test-Path $lnkPath)"
