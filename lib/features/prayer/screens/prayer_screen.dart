import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
import 'package:bible_journey/features/home/screen/home_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';

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
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(236, 229, 229, 0.5411764705882353),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  152, 143, 143, 0.5411764705882353),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.topLeft,
                            child: const Text(""),
                          ),
          
                          const SizedBox(width: 13),
          
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "A Morning Prayer for Gratitude",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Read by Daily Devotions.",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
          
                      const SizedBox(height: 30),
          
                      Container(
                        height: 6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            double progress = 0.5;
                            return Stack(
                              children: [
                                Container(
                                  width: constraints.maxWidth * progress,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
          
                      const SizedBox(height: 30),
          
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "2:30",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "4:30",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
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
