import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';
import 'section_container.dart';

class GallerySection extends StatelessWidget {
  final Key sectionKey;

  const GallerySection({required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final tablet = isTablet(context);
    final columns = mobile ? 2 : (tablet ? 3 : 3);

    return SectionContainer(
      sectionKey: sectionKey,
      backgroundColor: AppColors.surface,
      child: Column(
        children: [
          SectionTitle(
            title: CommunityData.galleryTitle,
            subtitle:
                'Cuplikan dokumentasi kegiatan. lihat lebih banyak di Instagram @senyumsehat.id.',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: CommunityData.galleryImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  CommunityData.galleryImages[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: AppColors.primary.withOpacity(0.08),
                    child: const Icon(
                      Icons.image_outlined,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
