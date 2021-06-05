@echo off

set TMP1=%cd%
echo %TMP1%
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /f
reg query "HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers" > %TMP1%\tmp.log
for /f "tokens=*" %%i in (%TMP1%\tmp.log) do (
rem echo %%i
reg delete "%%i" /f
)
del /F %TMP1%\tmp.log
pause