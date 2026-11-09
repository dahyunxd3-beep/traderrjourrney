TRADER JOURNEY (BY: UYUTRRR) - APLIKASI ANDROID
===============================================

Ini proyek Capacitor yang membungkus jurnal (www\index.html, versi 2.6) menjadi
aplikasi Android. Hasil akhirnya satu file APK yang bisa dipasang di HP.

Ada dua cara membuat APK. CARA A paling mudah karena tidak perlu memasang
apa pun di komputer.

------------------------------------------------------------
CARA A - Build otomatis di GitHub (tanpa Android Studio)
------------------------------------------------------------
1. Buat akun di https://github.com (gratis) lalu buat repository baru (boleh Private).
2. Ekstrak zip ini, lalu unggah SEMUA isi foldernya ke repository tersebut
   (tombol "Add file" > "Upload files"; seret semua file dan folder, termasuk
   folder .github dan android). Klik "Commit changes".
   Catatan: folder ".github" kadang tersembunyi di Windows. Aktifkan
   View > Show > Hidden items di File Explorer agar ikut terseret.
3. Buka tab "Actions" di repository. Kalau muncul tombol untuk mengaktifkan
   workflow, klik. Pilih "Build APK Trader Journey" > "Run workflow".
4. Tunggu sekitar 5-8 menit sampai centang hijau.
5. Klik hasil run tersebut, turun ke bagian "Artifacts", unduh "TraderJourney-APK"
   (berupa zip berisi TraderJourney.apk).

------------------------------------------------------------
CARA B - Build di komputer sendiri (Windows)
------------------------------------------------------------
Butuh: Node.js LTS (nodejs.org) dan Android Studio (developer.android.com/studio).
Buka Android Studio sekali sampai komponen SDK terunduh. Android Studio sudah
membawa JDK 17.
1. Klik dua kali build-apk.bat. Pertama kali bisa 5-10 menit.
2. Hasilnya TraderJourney.apk di folder ini.
Alternatif: jalankan "npx cap open android" lalu di Android Studio pilih
Build > Build Bundle(s) / APK(s) > Build APK(s).

------------------------------------------------------------
MEMASANG APK DI HP
------------------------------------------------------------
1. Kirim TraderJourney.apk ke HP (kabel USB, Google Drive, atau WhatsApp ke diri sendiri).
2. Buka file-nya di HP. Android akan meminta izin "Install unknown apps" untuk
   aplikasi yang kamu pakai membukanya (File Manager / Chrome). Izinkan.
3. Jika muncul peringatan Play Protect, pilih "Install anyway". APK ini ditandatangani
   dengan kunci debug milik sendiri, bukan dari Play Store, jadi peringatan itu wajar.

------------------------------------------------------------
CATATAN PENTING
------------------------------------------------------------
- DATA: tersimpan di dalam aplikasi di HP. Kalau aplikasi di-uninstall atau
  "Clear storage", data hilang. Lakukan backup rutin di
  Pengaturan > Export data (.json). Di HP, tombol ini membuka menu Bagikan
  sehingga file bisa dikirim ke Google Drive, WhatsApp, atau disimpan ke Files.
- PINDAH DATA dari komputer/browser: Export JSON di sana, kirim file ke HP, lalu
  Pengaturan > Import / drag file di aplikasi dan pilih file tadi.
- SCREENSHOT: foto dari kamera HP berukuran besar dan penyimpanan aplikasi terbatas.
  Kalau muncul peringatan penyimpanan penuh, gunakan screenshot layar (lebih kecil)
  dan export backup berkala.
- UPDATE: ganti www\index.html dengan versi baru (nama tetap index.html), naikkan
  "versionCode" dan "versionName" di android\app\build.gradle, lalu build ulang
  dan pasang APK baru di atas yang lama. Data tetap aman selama aplikasi tidak
  di-uninstall dan APK memakai kunci yang sama (build GitHub memakai kunci debug
  yang bisa berganti; kalau gagal "App not installed", uninstall dulu setelah
  export backup).
- Tombol Back di Android menutup menu/gambar yang terbuka, lalu kembali ke
  Dashboard, dan baru keluar aplikasi dari Dashboard.
- Warna status bar mengikuti tema gelap/terang aplikasi.
- Untuk menerbitkan di Play Store dibutuhkan build release yang ditandatangani
  dan akun developer; itu di luar paket ini.

PEMECAHAN MASALAH
- Build GitHub gagal di langkah "Build APK": buka log run-nya dan kirim teks error ke
  pembuat proyek ini.
- Cara B: "SDK location not found" - buat file android\local.properties berisi
  sdk.dir=C:\\Users\\NAMAKAMU\\AppData\\Local\\Android\\Sdk
- "App not installed" saat memasang: uninstall versi lama dulu (export backup lebih dulu).
