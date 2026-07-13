import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

const Map<String, IconData> _iconMap = {
  'campaign': Icons.campaign,
  'volunteer_activism': Icons.volunteer_activism,
  'groups': Icons.groups,
  'child_care': Icons.child_care,
  'school': Icons.school,
  'sailing': Icons.sailing,
  'medical_services': Icons.medical_services,
  'cast_for_education': Icons.cast_for_education,
};

class ActivitiesSection extends StatelessWidget {
  final Key sectionKey;

  const ActivitiesSection({required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final tablet = isTablet(context);
    final columns = mobile ? 1 : (tablet ? 2 : 3);

    return SectionContainer(
      sectionKey: sectionKey,
      child: Column(
        children: [
          SectionTitle(
            title: CommunityData.activitiesTitle,
            subtitle:
                'Beberapa program rutin yang dijalankan oleh komunitas Senyum Sehat.',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CommunityData.activities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: mobile ? 1.6 : 0.95,
            ),
            itemBuilder: (context, index) {
              final item = CommunityData.activities[index];
              return _ActivityCard(
                icon: _iconMap[item.icon] ?? Icons.star,
                title: item.title,
                description: item.description,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ActivityCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
            ),
          ),
        ],
      ),
    );
  }
}
