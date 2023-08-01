@echo off
rem 管理者権限で実行する
cls
Powershell Styart-Process -FilePath %1 -Verb RunAs
exit /b 0