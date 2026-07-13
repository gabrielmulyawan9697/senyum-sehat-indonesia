import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: mobile ? 12 : 20,
      runSpacing: 16,
      children: CommunityData.impactStats
          .map((s) => _StatCard(stat: s, mobile: mobile))
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  final StatItem stat;
  final bool mobile;

  const _StatCard({required this.stat, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mobile ? 150 : 220,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            stat.value,
            style: TextStyle(
              fontSize: mobile ? 20 : 24,
              fontWeight: FontWeight.w800,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
