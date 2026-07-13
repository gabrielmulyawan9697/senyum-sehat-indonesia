import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onCtaTap;

  const HeroSection({super.key, required this.onCtaTap});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    final textColumn = Column(
      crossAxisAlignment:
          mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Komunitas Kesehatan Gigi & Mulut',
            style: TextStyle(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          CommunityData.communityName,
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: mobile ? 38 : 52,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 480,
          child: Text(
            CommunityData.tagline,
            textAlign: mobile ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          alignment: mobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onCtaTap,
              icon: const Icon(Icons.groups),
              label: const Text('Kenali Kegiatan Kami'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () async {
                final uri = Uri.parse(CommunityData.instagramUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, webOnlyWindowName: '_blank');
                }
              },
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Instagram'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textDark,
                side: const BorderSide(color: AppColors.textMuted),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final imageBox = Container(
      width: mobile ? 260 : 380,
      height: mobile ? 260 : 380,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          CommunityData.heroImagePath,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Center(
            child: Icon(
              Icons.sentiment_satisfied_alt,
              size: 100,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );

    return SectionContainer(
      child: mobile
          ? Column(
              children: [
                textColumn,
                const SizedBox(height: 40),
                imageBox,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: 40),
                imageBox,
              ],
            ),
    );
  }
}
