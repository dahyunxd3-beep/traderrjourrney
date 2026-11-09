@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Build APK Trader Journey

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js belum terpasang. Unduh versi LTS dari https://nodejs.org lalu coba lagi.
  pause
  exit /b 1
)
where java >nul 2>nul
if errorlevel 1 (
  echo JDK 17 belum terpasang. Pasang Android Studio ^(sudah termasuk JDK^) atau Temurin JDK 17.
  pause
  exit /b 1
)
if "%ANDROID_HOME%"=="" if "%ANDROID_SDK_ROOT%"=="" if not exist "android\local.properties" (
  echo Android SDK belum ditemukan. Pasang Android Studio lalu buka sekali agar SDK terunduh,
  echo atau baca README.txt bagian "Cara B".
  pause
  exit /b 1
)

echo [1/3] Memasang dependensi...
call npm install --no-audit --no-fund
if errorlevel 1 ( echo Gagal npm install. & pause & exit /b 1 )

echo [2/3] Menyalin aplikasi ke proyek Android...
call npx cap sync android
if errorlevel 1 ( echo Gagal cap sync. & pause & exit /b 1 )

echo [3/3] Membuat APK (pertama kali bisa 5-10 menit)...
cd android
call gradlew.bat assembleDebug
if errorlevel 1 ( echo Build gagal. Lihat README.txt bagian Pemecahan Masalah. & cd .. & pause & exit /b 1 )
cd ..

copy /Y "android\app\build\outputs\apk\debug\app-debug.apk" "TraderJourney.apk" >nul
echo.
echo Selesai! APK: %~dp0TraderJourney.apk
explorer /select,"%~dp0TraderJourney.apk"
pause
