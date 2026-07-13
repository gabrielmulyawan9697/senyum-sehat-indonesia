# Website Senyum Sehat Indonesia (Flutter Web)

Landing page komunitas **Senyum Sehat Indonesia**, dibuat dengan Flutter Web.
Semua teks, statistik, dan foto di project ini diambil dari dokumen resmi
**"Profil Senyum Sehat 2026"** yang diunggah, bukan lagi placeholder.

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terpasang (`flutter --version`). Kalau belum,
   install dulu dari https://docs.flutter.dev/get-started/install
2. Aktifkan dukungan web (biasanya sudah aktif secara default):
   ```
   flutter config --enable-web
   ```
3. Di dalam folder project, jalankan:
   ```
   flutter pub get
   flutter run -d chrome
   ```
4. Untuk build versi production (hasil di folder `build/web`):
   ```
   flutter build web
   ```

## Struktur Project

```
lib/
  main.dart                    -> merangkai semua section jadi satu halaman
  theme.dart                   -> warna & typography
  data/community_data.dart     -> SEMUA TEKS & LINK ada di sini, edit di sini saja
  widgets/
    navbar.dart                 -> header + logo + menu
    hero_section.dart           -> judul besar di paling atas
    about_section.dart          -> "Tentang Kami" + statistik dampak
    stats_bar.dart              -> kartu angka (penerima manfaat, volunteer, dst)
    activities_section.dart     -> 5 Program Unggulan (grid kartu)
    next_event_section.dart     -> jadwal kegiatan mendatang
    gallery_section.dart        -> galeri foto kegiatan
    product_section.dart        -> banner produk (Kaos Senyum Sehat)
    contact_section.dart        -> tombol Instagram / TikTok / WA / Email
    footer.dart                  -> footer bawah
assets/images/                  -> logo & foto asli komunitas
```

## Sumber Konten

Diambil dari `Profil_Senyum_Sehat_2026.pdf`:
- **Logo**: ikon tangan teal "Senyum Sehat" (transparan, PNG)
- **Hero image**: foto kebersamaan dari halaman sampul
- **Galeri**: 6 foto dokumentasi kegiatan (Sapa Desa, Goes to School, Jelajah Pulau)
- **Tentang Kami, Program Unggulan, Kegiatan Mendatang, Produk, Kontak**:
  disalin langsung dari teks PDF

## Cara Update Konten di Kemudian Hari

Buka **lib/data/community_data.dart** — file ini satu-satunya tempat yang
perlu diedit untuk mengganti teks, statistik, atau link, karena semua
widget mengambil datanya dari sini. Untuk mengganti gambar, timpa file di
`assets/images/` dengan nama yang sama, lalu jalankan `flutter pub get`
kalau ada perubahan di `pubspec.yaml`.

## Fitur

- Responsif (mobile, tablet, desktop)
- Navigasi dengan smooth-scroll ke tiap section
- Section: Hero, Tentang Kami + Statistik, Program Unggulan (5 program),
  Kegiatan Mendatang, Galeri, Produk, Kontak, Footer
- Tombol kontak langsung membuka Instagram / TikTok / WhatsApp / Email
