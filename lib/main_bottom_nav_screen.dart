import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:flutter/material.dart';

import 'features/home/screen/home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int index = 0;
  final screens =  [
     const HomeScreen(),
     const BibleScreen(),
     const JourneyScreen(),
     const ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (value){
            setState(()=>index=value);
          },

          items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book),label: "Bible"),
        BottomNavigationBarItem(icon: Icon(Icons.blur_circular_sharp),label: "Journey"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ]),
    );
  }
}
