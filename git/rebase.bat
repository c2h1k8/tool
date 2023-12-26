@echo off
rem 変更取り消し
setlocal
pushd "%~dp0"

set workspacepath=
set gitpath=

cls

:Main
echo.
echo ローカル変更内容をリベースします。
echo.
echo 対象プロジェクトを選択してください。
echo ─────
echo   [1]              [11]            [21]
echo   [2]              [12]            [22]
echo   [3]              [13]            [23]
echo   [4]              [14]            [24]
echo   [5]              [15]            [25]
echo   [6]              [16]            [26]
echo   [7]              [17]            [27]
echo   [8]              [18]            [28]
echo   [9]              [19]            [29]
echo   [10]             [20]            [30]
echo   [0] キャンセル
echo ─────

set s=
set /p s="プロジェクトを選択してください。> "

echo.

set project=
if %s%==0  goto :finish
if %s%==1  set project=
if %s%==2  set project=
if %s%==3  set project=
if %s%==4  set project=
if %s%==5  set project=
if %s%==6  set project=
if %s%==7  set project=
if %s%==8  set project=
if %s%==9  set project=
if %s%==10 set project=
if %s%==11 set project=
if %s%==12 set project=
if %s%==13 set project=
if %s%==14 set project=
if %s%==15 set project=
if %s%==16 set project=
if %s%==17 set project=
if %s%==18 set project=
if %s%==19 set project=
if %s%==20 set project=
if %s%==21 set project=
if %s%==22 set project=
if %s%==23 set project=
if %s%==24 set project=
if %s%==25 set project=
if %s%==26 set project=
if %s%==27 set project=
if %s%==28 set project=
if %s%==29 set project=
if %s%==30 set project=

if not defined project goto :retry

echo.
set path=%workspacepath%\%project%
echo パス %path% をリベースします。
echo .

rem 遡りコミット数選択
echo.
set s=
set /p s="遡るコミット数を指定してください。> "
if not defined s goto :retry
echo.
echo %s%コミット分

cd %path%
%gitpath%git rebase -i head~%s%

echo.
set /p s="Pushしますか？ （y/n） > "
if %s%==y %gitpath%git push -f

:retry
set /p s="作業を続けますか？ （y/n） > "
if %s%==y goto :Main

:finish
color
popd
endlocal
exit /b 0