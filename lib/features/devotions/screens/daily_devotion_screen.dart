import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../journeys/screens/journey_screen.dart';
import 'devotion_detail_screen.dart';

class DailyDevotionScreen extends StatefulWidget {
  const DailyDevotionScreen({super.key});

  @override
  State<DailyDevotionScreen> createState() => _DailyDevotionScreenState();
}

class _DailyDevotionScreenState extends State<DailyDevotionScreen> {
  int _selectedIndex = 2;
  int _selectedContainer = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F2),
      appBar: CustomAppBar(title: "Daily Devotion", onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Finding Peace in His Presence",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                _buildSelectableContainer(
                  index: 0,
                  title: "Scripture",
                  content: "I have told you these things, so that in me you may have peace. In this world you will have trouble. But take heart! I have overcome the world",
                  centerText: true,
                ),

                const SizedBox(height: 16),

                _buildSelectableContainer(
                  index: 1,
                  title: "Reflection",
                  content: "Jesus doesn't promise a life free from hardship. Instead, He offers unshakable peace found only in Him. This assurance reminds us that His presence remains with us through every struggle, and the ultimate victory has already been won.",
                ),

                const SizedBox(height: 16),

                _buildSelectableContainer(
                  index: 2,
                  title: "Practical Application",
                  content: "Today, when you feel overwhelmed by the troubles promise. How can you actively take heart and your circumstances? Consider one specific worry and intentionally surrender it to Him in prayer.",
                ),

                const SizedBox(height: 30),
                CustomButton(
                  text: "Completed Devotion",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DevotionDetailScreen()),
                    );
                  },
                ),
              ],
            ),
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
                  context, MaterialPageRoute(builder: (_) => const HomeScreen()));
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

  Widget _buildSelectableContainer({
    required int index,
    required String title,
    required String content,
    bool centerText = false,
  }) {
    bool isSelected = _selectedContainer == index;

    return GestureDetector(
      onTap: () {
        setState(() {

          if (_selectedContainer == index) {
            _selectedContainer = -1;
          } else {
            _selectedContainer = index;
          }
        });
      },
      child: Container(
        height: 163,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE3E9E3) : Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                  textAlign: centerText ? TextAlign.center : TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
