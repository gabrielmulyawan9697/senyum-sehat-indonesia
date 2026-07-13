import 'dart:developer';

import 'package:flutter/material.dart';
import '../data/community_data.dart';
import '../theme.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onActivitiesTap;
  final VoidCallback onGalleryTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onActivitiesTap,
    required this.onGalleryTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 64, vertical: 16),
      child: Row(
        children: [
          // --- Logo placeholder ---
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              CommunityData.logoPath,
              width: 40,
              height: 40,
              errorBuilder: (_, e, stack) {
                return Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.sentiment_satisfied_alt,
                      color: Colors.white),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Text(
            CommunityData.communityName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          if (!mobile) ...[
            _NavLink(label: 'Tentang', onTap: onAboutTap),
            _NavLink(label: 'Kegiatan', onTap: onActivitiesTap),
            _NavLink(label: 'Galeri', onTap: onGalleryTap),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: onContactTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Kontak'),
            ),
          ] else
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textDark),
              onPressed: () => _showMobileMenu(context),
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Tentang'),
              onTap: () {
                Navigator.pop(context);
                onAboutTap();
              },
            ),
            ListTile(
              title: const Text('Kegiatan'),
              onTap: () {
                Navigator.pop(context);
                onActivitiesTap();
              },
            ),
            ListTile(
              title: const Text('Galeri'),
              onTap: () {
                Navigator.pop(context);
                onGalleryTap();
              },
            ),
            ListTile(
              title: const Text('Kontak'),
              onTap: () {
                Navigator.pop(context);
                onContactTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavLink({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(foregroundColor: AppColors.textDark),
        child: Text(label),
      ),
    );
  }
}
