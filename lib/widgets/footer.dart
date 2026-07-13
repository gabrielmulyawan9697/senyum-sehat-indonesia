import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      width: double.infinity,
      color: AppColors.textDark,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 64,
        vertical: 28,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 8,
            children: [
              Text(
                '© ${DateTime.now().year} ${CommunityData.communityName}',
                style: const TextStyle(color: Colors.white70, fontSize: 13),
              ),
              const Text(
                'Dibuat dengan Flutter Web',
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
