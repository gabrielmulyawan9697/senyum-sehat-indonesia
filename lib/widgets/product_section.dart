import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return SectionContainer(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mobile ? 20 : 40,
          vertical: mobile ? 24 : 32,
        ),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.accent.withOpacity(0.4)),
        ),
        child: Flex(
          direction: mobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment:
              mobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.checkroom, color: AppColors.primaryDark),
            ),
            SizedBox(width: mobile ? 0 : 20, height: mobile ? 16 : 0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CommunityData.productTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${CommunityData.productName} — hanya ${CommunityData.productPrice}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: mobile ? 0 : 16, height: mobile ? 16 : 0),
            Align(
              alignment: mobile ? Alignment.centerLeft : Alignment.center,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_outlined, size: 18),
                label: Text('Pesan: ${CommunityData.productContact}'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textDark,
                  side: const BorderSide(color: AppColors.textDark),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
