import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../main_bottom_nav_screen.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../bible/screens/bible_screen.dart';
import '../../journeys/screens/journey_screen.dart';

class TermsServiceScreen extends StatefulWidget {
  const TermsServiceScreen({super.key});

  @override
  State<TermsServiceScreen> createState() => _TermsServiceScreenState();
}

class _TermsServiceScreenState extends State<TermsServiceScreen> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: const Text("Terms of Service"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),  // Adds padding to the left and right sides
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                Text("By using Bible, you agree to comply with and be bound by these Terms of Service. If you do not agree to these terms, you must immediately stop using the Service. We reserve the right to update, modify, or change these terms at any time, and the updated version will be posted on this page. As a user, you agree to use the Service in compliance with all applicable laws and regulations, and not engage in any activity that could harm the app or other users. You agree not to reproduce, copy, or distribute any part of the Service without prior permission. Your privacy is important to us, and we encourage you to review our Privacy Policy to understand how we collect, use, and protect your personal information. By using the Service, you consent to the collection and use of your data as described in our Privacy Policy. The app provides access to Bible verses, passages, and related content for personal, non-commercial use only. All Bible content and related resources are protected by copyright, and you may not use or distribute any content for commercial purposes without written consent. All intellectual property rights to the Service, including the design, layout, and content, are owned by [Your Bible App Name] or its licensors. These Terms of Service do not grant you any rights to the intellectual property of the Service.",

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,

                  ),
                ),
              ]
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const BibleScreen()));
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
              break;
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}
