import 'package:flutter/material.dart';
import '../theme.dart';

/// Wrapper agar setiap section punya lebar maksimal & padding konsisten,
/// serta bisa dipakai untuk scroll-to-section lewat GlobalKey.
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Key? sectionKey;

  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.sectionKey,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      key: sectionKey,
      width: double.infinity,
      color: backgroundColor ?? Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 20 : 64,
        vertical: mobile ? 48 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: child,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centered;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.centered = true,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: mobile ? 26 : 34,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: 640,
            child: Text(
              subtitle!,
              textAlign: centered ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                fontSize: mobile ? 14 : 16,
                color: AppColors.textMuted,
              ),
            ),
          ),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}
