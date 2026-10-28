@echo off
REM Pemakaian: scripts\animations.bat 0.5   (1.0 = normal, 0 = mati)
set S=%~1
if "%S%"=="" set S=0.5
adb shell settings put global window_animation_scale %S%
adb shell settings put global transition_animation_scale %S%
adb shell settings put global animator_duration_scale %S%
echo Skala animasi diatur ke %S%
