@echo off
setlocal
pushd "%~dp0"

powershell -ExecutionPolicy RemoteSigned -File "update_file.ps1"
popd
pause