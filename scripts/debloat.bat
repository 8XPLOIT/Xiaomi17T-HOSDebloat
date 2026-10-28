@echo off
setlocal
REM Pemakaian: scripts\debloat.bat packages\batch2-safe.txt
if "%~1"=="" (
  echo Pemakaian: debloat.bat ^<file_daftar_paket^>
  exit /b 1
)
set LOGDIR=%~dp0..\logs
set LOG=%LOGDIR%\dinonaktifkan.txt
if not exist "%LOGDIR%" mkdir "%LOGDIR%"

for /f "usebackq eol=# tokens=*" %%p in ("%~1") do (
  adb shell pm disable-user --user 0 %%p 2>&1 | findstr /c:"disabled-user" >nul && (
    echo [OK]   %%p
    >>"%LOG%" echo %%p
  ) || (
    echo [SKIP] %%p
  )
)
echo Selesai. Paket yang berhasil dicatat di %LOG%
