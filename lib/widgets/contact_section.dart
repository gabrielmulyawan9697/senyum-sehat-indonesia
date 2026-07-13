import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

class ContactSection extends StatelessWidget {
  final Key sectionKey;

  const ContactSection({required this.sectionKey});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return SectionContainer(
      sectionKey: sectionKey,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 20 : 48,
          vertical: mobile ? 32 : 48,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Text(
              CommunityData.contactTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Yuk gabung dan pantau terus kegiatan kami di ${CommunityData.location}.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 28),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 14,
              runSpacing: 14,
              children: [
                _ContactButton(
                  icon: Icons.camera_alt_outlined,
                  label: CommunityData.instagramHandle,
                  onTap: () => _open(CommunityData.instagramUrl),
                ),
                _ContactButton(
                  icon: Icons.music_note_outlined,
                  label: CommunityData.tiktokHandle,
                  onTap: () => _open(CommunityData.tiktokUrl),
                ),
                _ContactButton(
                  icon: Icons.chat_outlined,
                  label: CommunityData.phone,
                  onTap: () => _open(CommunityData.whatsapp),
                ),
                _ContactButton(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  onTap: () => _open('mailto:${CommunityData.email}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
