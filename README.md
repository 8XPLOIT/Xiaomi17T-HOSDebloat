# Xiaomi 17T HyperOS Debloat (ADB)

Kumpulan daftar paket dan script untuk menonaktifkan aplikasi sistem yang tidak dibutuhkan di **Xiaomi 17T (HyperOS 3.0.304)** lewat **ADB dari PC**, tanpa root dan **bisa dibalikkan**.

*Reversible, root-free ADB debloat lists and helper scripts for the Xiaomi 17T on HyperOS 3.*

> **Peringatan:** gunakan dengan risiko sendiri. Daftar ini disusun dari daftar paket di Xiaomi 17T (HyperOS 3.0.304). Nama paket dan dampaknya bisa berbeda di perangkat, region, atau versi ROM lain. Selalu backup dan nonaktifkan bertahap.

## Cara kerja

Script memakai `pm disable-user --user 0`, yang hanya **menonaktifkan** aplikasi untuk user utama. Aplikasi tetap ada di partisi sistem, jadi bisa diaktifkan lagi kapan saja dengan `pm enable`. Tidak ada yang dihapus permanen.

## Struktur

```
packages/
  batch1-telemetry-facebook.txt   telemetri, iklan, Facebook preinstall, app bawaan opsional
  batch2-safe.txt                 Microsoft, layanan Google tambahan, debug, utilitas jarang dipakai
  batch3-safe.txt                 rekomendasi/promosi, Family Link, cetak, alat tes pabrik
  batch4-optional.txt             opsional (semua dikomentari, aktifkan yang kamu mau)
  DO-NOT-TOUCH.md                 paket yang tidak boleh disentuh
scripts/
  backup.bat                      simpan daftar paket sebelum mulai
  debloat.bat | debloat.sh        nonaktifkan paket dari sebuah daftar, hasilnya dicatat
  restore.bat | restore.sh        pulihkan satu paket atau semuanya
  animations.bat                  percepat animasi sistem
```

## Persiapan (sekali saja)

1. Download **Platform-Tools** dari https://developer.android.com/tools/releases/platform-tools, ekstrak, dan tambahkan foldernya ke `PATH` (atau jalankan script dari folder itu).
2. Di HP: **Pengaturan > Tentang ponsel**, ketuk **Versi OS** 7 kali untuk membuka Developer options.
3. Di **Developer options**, aktifkan:
   - **USB debugging**
   - **USB debugging (Security settings)**. Wajib di Xiaomi agar perintah `pm` diizinkan, dan membutuhkan akun Mi serta internet.
4. Colok USB ke PC, pilih mode **File transfer**, lalu izinkan debugging di HP.
5. Cek koneksi:
   ```
   adb devices
   ```
   Harus muncul serial dengan status `device`.

## Pemakaian

Windows (CMD atau PowerShell, dari folder repo):

```
scripts\backup.bat
scripts\debloat.bat packages\batch1-telemetry-facebook.txt
```

macOS / Linux:

```
./scripts/debloat.sh packages/batch1-telemetry-facebook.txt
```

Output:

- `[OK]` paket berhasil dinonaktifkan dan dicatat di `logs/dinonaktifkan.txt`
- `[SKIP]` paket tidak ada di perangkat atau ditolak sistem (aman diabaikan)

### Urutan yang disarankan

1. Jalankan `backup.bat`.
2. Jalankan **batch 1**, restart HP, pakai 1-2 hari. Pastikan notifikasi, kamera, WiFi/data, dan baterai normal.
3. Lanjut **batch 2**, lalu **batch 3**, dengan jeda yang sama.
4. Untuk **batch 4**, hapus tanda `#` hanya di paket yang memang tidak kamu pakai.
5. Opsional: `scripts\animations.bat 0.5` untuk animasi lebih cepat (`1.0` untuk normal).

## Memulihkan

```
scripts\restore.bat                  pulihkan semua yang ada di logs\dinonaktifkan.txt
scripts\restore.bat nama.paket       pulihkan satu paket
```

Perintah manual:

```
adb shell pm enable --user 0 nama.paket
```

Kalau HP bermasalah parah (jarang terjadi pada `disable-user`), pulihkan semua lewat script, lalu restart. Factory reset mengembalikan semua paket ke keadaan awal.

## Catatan

- **Paket yang jangan disentuh** ada di [`packages/DO-NOT-TOUCH.md`](packages/DO-NOT-TOUCH.md): performa/thermal (`joyose`, `duraspeed`, `powerkeeper`), push dan akun Xiaomi, NFC, kamera, Google Play Services, dan fitur AI HyperOS. Aplikasi bank dan dompet digital bergantung pada Google Play Services dan WebView.
- Update OTA HyperOS kadang mengaktifkan kembali sebagian paket. Jalankan ulang script setelah update.
- Efek ke performa di flagship biasanya halus: lebih sedikit iklan, notifikasi sampah, dan proses latar belakang. Bukan lonjakan benchmark.
- Beberapa paket berbasis apex (misalnya komponen Privacy Sandbox Google) bisa ditolak dengan pesan error. Itu normal.
- Mengikuti daftar untuk perangkat lain: jalankan `adb shell pm list packages -f` dan cocokkan nama paketnya dulu.

## Lisensi

MIT. Lihat [LICENSE](LICENSE).
