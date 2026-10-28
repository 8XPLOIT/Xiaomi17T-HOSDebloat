@echo off
setlocal
REM Pemakaian: scripts\restore.bat            (pulihkan semua dari logs\dinonaktifkan.txt)
REM            scripts\restore.bat nama.paket (pulihkan satu paket)
if not "%~1"=="" (
  adb shell pm enable --user 0 %~1
  exit /b
)
set LOG=%~dp0..\logs\dinonaktifkan.txt
if not exist "%LOG%" (
  echo Tidak ada log di %LOG%
  exit /b 1
)
for /f "usebackq eol=# tokens=*" %%p in ("%LOG%") do (
  adb shell pm enable --user 0 %%p
)
echo Semua paket di log sudah dipulihkan.
