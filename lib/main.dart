import 'package:flutter/material.dart';
import 'data/community_data.dart';
import 'theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/activities_section.dart';
import 'widgets/next_event_section.dart';
import 'widgets/gallery_section.dart';
import 'widgets/product_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const SenyumSehatApp());
}

class SenyumSehatApp extends StatelessWidget {
  const SenyumSehatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommunityData.communityName,
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _activitiesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onAboutTap: () => _scrollTo(_aboutKey),
            onActivitiesTap: () => _scrollTo(_activitiesKey),
            onGalleryTap: () => _scrollTo(_galleryKey),
            onContactTap: () => _scrollTo(_contactKey),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(onCtaTap: () => _scrollTo(_activitiesKey)),
                  AboutSection(sectionKey: _aboutKey),
                  ActivitiesSection(sectionKey: _activitiesKey),
                  const NextEventSection(),
                  GallerySection(sectionKey: _galleryKey),
                  const ProductSection(),
                  ContactSection(sectionKey: _contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
