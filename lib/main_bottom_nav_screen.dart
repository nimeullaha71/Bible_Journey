import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'features/home/screen/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int currentIndex = 0;
  final screens =  [
     const HomeScreen(),
     const BibleScreen(),
     const JourneyScreen(),
     const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CustomNavbar(
        currentIndex: currentIndex,
        onItemPressed: (index) {
          setState(() {
            currentIndex = index;
          });

          // switch (index) {
          //   case 0:
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
          //     break;
          //   case 1:
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const BibleScreen()));
          //     break;
          //   case 2:
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
          //     break;
          //   case 3:
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
          //     break;
          //
          // }
        },
      ),
    );
  }
}
