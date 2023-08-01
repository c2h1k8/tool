@echo off

set servicename=
set logpath=

rem サービス停止
net stop %servicename%
rem ログ削除
forfiles /P %logpath% /S /C "cmd /c if @isdir==FALSE del /s @path"
rem サービス起動
net start %servicename%
pause