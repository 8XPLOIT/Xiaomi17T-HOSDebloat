# Jangan dinonaktifkan

Paket-paket ini dibutuhkan sistem. Menonaktifkannya bisa menyebabkan bootloop,
notifikasi mati, kamera rusak, thermal/performa kacau, atau aplikasi bank gagal jalan.

| Kelompok | Paket |
|---|---|
| Performa, thermal, baterai, touch, GPU | `com.xiaomi.joyose`, `com.mediatek.duraspeed`, `com.miui.powerkeeper`, `com.xiaomi.touchservice`, `com.novatek.novavis`, `com.mediatek.mt6899.gamedriver`, `com.android.angle` |
| Push, akun, keamanan sistem | `com.xiaomi.xmsf`, `com.xiaomi.account`, `com.xiaomi.finddevice`, `com.lbe.security.miui`, `com.xiaomi.trustservice`, `com.miui.securitycore`, `com.miui.securitycenter` |
| NFC dan pembayaran | `com.miui.tsmclient`, `com.android.nfc` |
| Kamera | `com.xiaomi.cameramind`, `com.xiaomi.cameratools`, `com.android.camera` |
| Google inti | `com.google.android.gms`, `com.android.vending`, `com.google.android.webview`, `com.google.android.gsf`, `com.google.android.googlequicksearchbox` |
| Sistem inti | `com.android.systemui`, `com.miui.home`, `com.miui.core`, `com.miui.system`, `com.android.phone`, `com.android.providers.*`, semua `*overlay*` dan `*rro*`, `com.mediatek.*` (kecuali yang tercantum di batch) |
| Fitur AI HyperOS (tunda dulu) | `com.xiaomi.aiservice`, `com.xiaomi.aicr`, `com.google.android.aicore`, `com.google.android.as` |
