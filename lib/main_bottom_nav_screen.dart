import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int index = 0;
  final screens =  [
    //const QuestionHomeScreen(),
    // const HomeScreen(),
    // const SearchScreen(),
    // const ProfileScreen(),
    // const SettingsScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.compare),label: "Bible"),
        BottomNavigationBarItem(icon: Icon(Icons.blur_circular_sharp),label: "Journey"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
      ]),
    );
  }
}
