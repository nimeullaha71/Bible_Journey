
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
import 'package:bible_journey/features/reflection/screens/daily_reflection_screen.dart';
import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_nav_bar.dart';
import '../../devotions/screens/daily_devotion_screen.dart';
import '../widgets/custom_form.dart';

class DailyJourneyScreen extends StatefulWidget {
  const DailyJourneyScreen({super.key});

  @override
  State<DailyJourneyScreen> createState() => _DailyJourneyScreenState();
}

class _DailyJourneyScreenState extends State<DailyJourneyScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: const Text("Journey Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Text(
              "Day 1:   Before the Beginning, God",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 5),
          CustomForm(title: "Daily Prayer", onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PrayerScreen(),
              ),
            );
          }),
          SizedBox(height: 5),
          CustomForm(title: "Daily Devotion", onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyDevotionScreen(),
              ),
            );
          }),
          SizedBox(height: 5),
          CustomForm(title: "Today's Action", onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodayActionScreen(),
              ),
            );
          }),
          SizedBox(height: 5),
          CustomForm(title: "Daily Reflection Space", onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyReflectionScreen(),
              ),
            );
          }),
        ],
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
