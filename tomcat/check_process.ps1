# プロセス確認
Get-WmiObject -Class Win32_Process | ? { $_.CommandLine -like '*Tomcat*' -and $_.Name -match 'java[w]?.exe' } | Select-Object ProcessID, CommandLine | % {if ($_.CommandLine -match '-D([a-zA-Z]*)Tomcat'){$_.CommandLine = $Matches[1]} $_}

# echo $process
# $host.UI.RawUI.ReadKey()

# プロセス選択
# $process = Read-Host "停止するプロセスを入力してください。"

# if ($process -notmatch "^[0-9]*$") {
#     exit
# }

# Stop-Process -id $process

# # プロセス確認
# Get-WmiObject -Class Win32_Process | ? { $_.CommandLine -like '*Tomcat*' -and $_.Name -eq 'javaw.exe' } | Select-Object ProcessID, CommandLine | % {if ($_.CommandLine -match '-D([a-zA-Z]*)Tomcat'){$_.CommandLine = $Matches[1]} $_}

# $host.UI.RawUI.ReadKey()