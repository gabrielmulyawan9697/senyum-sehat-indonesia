import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';
import 'stats_bar.dart';

class AboutSection extends StatelessWidget {
  final Key sectionKey;

  const AboutSection({required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SectionTitle(
            title: CommunityData.aboutTitle,
          ),
          Text(
            CommunityData.aboutBody,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textMuted,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 40),
          const StatsBar(),
        ],
      ),
    );
  }
}
