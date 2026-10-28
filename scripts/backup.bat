@echo off
setlocal
set OUT=%~dp0..\backup
if not exist "%OUT%" mkdir "%OUT%"
adb devices
adb shell pm list packages -f > "%OUT%\semua_paket.txt"
adb shell pm list packages -d > "%OUT%\nonaktif_awal.txt"
adb shell pm list packages -3 > "%OUT%\aplikasi_user.txt"
adb shell pm list packages -s > "%OUT%\paket_sistem.txt"
echo Backup tersimpan di %OUT%
