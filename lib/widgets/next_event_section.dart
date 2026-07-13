import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

class NextEventSection extends StatelessWidget {
  const NextEventSection({super.key});

  @override
  Widget build(BuildContext context) {
    final event = CommunityData.nextEvent;
    final isMobileView = isMobile(context);

    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: Column(
        children: [
          SectionTitle(
            title: CommunityData.nextEventTitle,
            subtitle: 'Yuk ikut ambil bagian di kegiatan bakti sosial berikutnya.',
          ),
          const SizedBox(height: 32),
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.primary.withOpacity(0.1)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: isMobileView
                ? Column(
                    children: [
                      _buildImage(event.imageUrl),
                      const SizedBox(height: 24),
                      _buildDetails(event),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: _buildImage(event.imageUrl)),
                      const SizedBox(width: 32),
                      Expanded(flex: 4, child: _buildDetails(event)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }

  Widget _buildDetails(NextEventItem event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.event_note, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              const Text('Bakti Sosial Bandung', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(event.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        Text(event.subtitle, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textDark)),
        const SizedBox(height: 12),
        Text(event.description, style: const TextStyle(fontSize: 14, color: AppColors.textMuted)),
        const SizedBox(height: 24),
        _buildInfoRow(Icons.calendar_today, event.date),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.access_time, event.time),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.location_on, event.location),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => launchUrl(Uri.parse(event.ctaLink)),
            icon: const Icon(Icons.edit_note),
            label: const Text('Daftar Sekarang'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textDark))),
      ],
    );
  }
}
