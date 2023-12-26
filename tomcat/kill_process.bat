@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"

powershell -ExecutionPolicy RemoteSigned -File "check_process.ps1"

:Input
set s=
set /p s="プロセスを入力してください。> "
echo.

set t=%s%
if not defined t goto :finish
if defined t set t=%t:0=%
if defined t set t=%t:1=%
if defined t set t=%t:2=%
if defined t set t=%t:3=%
if defined t set t=%t:4=%
if defined t set t=%t:5=%
if defined t set t=%t:6=%
if defined t set t=%t:7=%
if defined t set t=%t:8=%
if defined t set t=%t:9=%
if not defined t taskkill /f /pid %s%
echo.

powershell -ExecutionPolicy RemoteSigned -File "check_process.ps1"

goto :Input

:finish
popd
pause
