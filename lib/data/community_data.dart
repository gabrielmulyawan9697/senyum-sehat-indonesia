// =========================================================================
// Konten diambil dari "Profil Senyum Sehat 2026" (PDF resmi komunitas).
// Kalau ada info yang berubah, cukup edit nilai-nilai di file ini saja —
// semua widget mengambil datanya dari sini.
// =========================================================================

class CommunityData {
  // ---------------- IDENTITAS ----------------
  static const String communityName = 'Senyum Sehat Indonesia';
  static const String tagline =
      'Gerakan Peduli Kesehatan Gigi dan Mulut untuk Indonesia Sehat dan Sejahtera';
  static const String shortDescription =
      'Senyum Sehat Indonesia lahir pada tahun 2017, dipelopori oleh '
      'drg. Mutia Ulfah. Mengusung tagline "Senyum Sehat, Senyum Indonesia", '
      'kami mengajak anak-anak muda untuk berkontribusi nyata dalam dunia '
      'kesehatan masyarakat.';

  // ---------------- TENTANG KAMI ----------------
  static const String aboutTitle = 'Tentang Kami';
  static const String aboutBody =
      'Senyum Sehat Indonesia lahir pada tahun 2017, gerakan ini dipelopori '
      'oleh drg. Mutia Ulfah. Dengan mengusung tagline "Senyum Sehat, Senyum '
      'Indonesia", kami tidak hanya menyoroti pentingnya kesehatan gigi, '
      'tapi juga mengajak anak-anak muda untuk berkontribusi nyata dalam '
      'dunia kesehatan masyarakat.\n\n'
      'Lewat kegiatan bakti sosial, kami turun langsung ke lapangan untuk '
      'memberikan edukasi dan layanan kesehatan. Di saat yang sama, kami '
      'juga memfasilitasi kegiatan webinar sebagai sarana berbagi ilmu dan '
      'update pengetahuan bagi tenaga kesehatan. Misi kami sederhana: jadi '
      'jembatan antara kebutuhan masyarakat dan tenaga medis agar keduanya '
      'bisa tumbuh dan saling menguatkan.';

  // Statistik dampak (diambil dari Program Unggulan)
  static const List<StatItem> impactStats = [
    StatItem(value: '7.100++', label: 'Penerima Manfaat'),
    StatItem(value: '720++', label: 'Volunteers & Tenaga Medis'),
    StatItem(value: '45+', label: 'Kegiatan Bakti Sosial'),
    StatItem(value: 'Sejak 2017', label: 'Konsisten Bergerak'),
  ];

  // ---------------- PROGRAM UNGGULAN ----------------
  static const String activitiesTitle = 'Program Unggulan';
  static const List<ActivityItem> activities = [
    ActivityItem(
      icon: 'campaign',
      title: 'Sapa Desa',
      description:
          'Penyuluhan dan pemeriksaan kesehatan gigi & mulut untuk '
          'masyarakat umum. Total 27 kegiatan dengan 2.800++ penerima '
          'manfaat sejak 2017.',
    ),
    ActivityItem(
      icon: 'school',
      title: 'Goes to School',
      description:
          'Edukasi dan pemeriksaan kesehatan gigi untuk siswa, dari PAUD '
          'hingga perguruan tinggi. Total 18 kegiatan dengan 4.200++ siswa/i.',
    ),
    ActivityItem(
      icon: 'sailing',
      title: 'Jelajah Pulau',
      description:
          'Bakti sosial di wilayah kepulauan berupa penyuluhan, pemeriksaan, '
          'dan pengabdian. Dilaksanakan di Pulau Tidung, Kepulauan Seribu, '
          'dengan 100++ penerima manfaat.',
    ),
    ActivityItem(
      icon: 'medical_services',
      title: 'Tenda Kesehatan',
      description:
          'Pemeriksaan kesehatan gratis di ruang publik seperti Car Free '
          'Day, menjangkau 100++ masyarakat sekitar (contoh: Metland '
          'Cibitung).',
    ),
    ActivityItem(
      icon: 'cast_for_education',
      title: 'Webinar',
      description:
          'Seminar edukatif daring bersama dokter gigi & tenaga kesehatan '
          'untuk berbagi ilmu, pengetahuan, dan inspirasi kepada peserta.',
    ),
  ];

  // ---------------- KEGIATAN MENDATANG ----------------
  static const String nextEventTitle = 'Kegiatan Mendatang';
  static const NextEventItem nextEvent = NextEventItem(
    title: 'Goes To School',
    subtitle: 'Sekolah Rakyat Menengah Pertama 9 Bandung',
    description: 'Mari bersama berbagi senyum dan ilmu untuk generasi muda. Ikut berkontribusi dalam kegiatan penyuluhan kesehatan gigi dan pemeriksaan gigi gratis.',
    date: 'Sabtu, 08 Agustus 2026',
    time: '13.00 - 17.00 WIB',
    location: 'Sekolah Rakyat Menengah Pertama 9 Bandung',
    imageUrl: 'assets/images/event_regis_bandung.webp',
    ctaLink: 'https://s.id/BaksosSRBandung',
  );

  // ---------------- GALERI ----------------
  static const String galleryTitle = 'Galeri Kegiatan';
  static const List<String> galleryImages = [
    'assets/images/gallery1.jpg',
    'assets/images/gallery2.jpg',
    'assets/images/gallery3.jpg',
    'assets/images/gallery4.jpg',
    'assets/images/gallery5.jpg',
    'assets/images/gallery6.jpg',
  ];

  // ---------------- PRODUK ----------------
  static const String productTitle = 'Produk Senyum Sehat';
  static const String productName = 'Kaos Senyum Sehat';
  static const String productPrice = 'Rp100.000';
  static const String productContact = '0851-1989-1293';

  // ---------------- KONTAK / SOSIAL MEDIA ----------------
  static const String contactTitle = 'Hubungi & Ikuti Kami';
  static const String instagramHandle = '@senyumsehat.id';
  static const String instagramUrl = 'https://www.instagram.com/senyumsehat.id/';
  static const String tiktokHandle = 'senyumsehat.idn';
  static const String tiktokUrl = 'https://www.tiktok.com/@senyumsehat.idn';
  static const String phone = '0851-1989-1293';
  static const String whatsapp = 'https://wa.me/6285119891293';
  static const String email = 'Senyumsehatjabodetabek@gmail.com';
  static const String emailLearningCenter =
      'Senyumsehatlearningcenter@gmail.com';
  static const String location = 'Jabodetabek | Semarang';

  // ---------------- ASET GAMBAR ----------------
  static const String logoPath = 'assets/images/senyum_sehat_transparan.webp';
  static const String heroImagePath = 'assets/images/hero.jpg';
}

class StatItem {
  final String value;
  final String label;

  const StatItem({required this.value, required this.label});
}

class ActivityItem {
  final String icon;
  final String title;
  final String description;

  const ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class NextEventItem {
  final String title;
  final String subtitle;
  final String description;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final String ctaLink;

  const NextEventItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.ctaLink,
  });
}
