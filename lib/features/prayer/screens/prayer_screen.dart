import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
import 'package:bible_journey/features/home/screen/home_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/audio_player_card.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Daily Prayer", onTap: (){
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                const SizedBox(height: 20),
          
                const Text(
                  "A Morning Prayer for\nGratitude",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
          
                const SizedBox(height: 25),
          
                const Text(
                  "A Morning Prayer for Gratitude Heavenly Father, "
                      "I come before you this morning with a heart full of gratitude, Thank you for the gift of a new day,"
                      " for the breath in my lungs, and for the countless blessings you have bestowed upon me."
                      " Help me to see your goodness in all things, big and small. Guide my steps today, fill me with your peace, "
                      "and allow me to be a reflection of your love to others. May I walk in your light and bring glory to your name. In Jesus' name, Amen.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
          
                const SizedBox(height: 60),
          
          
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: AudioPlayerCard(
                          url: "https://codeskulptor-demos.commondatastorage.googleapis.com/pang/paza-moduless.mp3",
                          title: "A Morning Prayer for Gratitude",
                          subtitle: "Read by Daily Devotions",
                          thumbnail: Container(color: Colors.redAccent.shade100),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32,),
                CustomButton(text: "Next", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyDevotionScreen()));
                })
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
}
