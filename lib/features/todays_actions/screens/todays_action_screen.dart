import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';

class TodayActionScreen extends StatefulWidget {
  const TodayActionScreen({super.key});

  @override
  State<TodayActionScreen> createState() => _TodayActionScreenState();
}

class _TodayActionScreenState extends State<TodayActionScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F5F2),
        title: const Text("Today's Action"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                child: Container(
                  height: 292,
                  width: 355,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xffE3E9E3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Write down one area of your life that feels "formless and empty" right now. It could be a  relationship, a career decision, a health concern, or an emotional struggle.  Now, next to it, write: "God, speak light into this darkness."  Put this note somewhere you'"ll see it today—your mirror, your desk, your phone wallpaper.  Each time you see it, remember: God is already at work.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff616161),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 270),
              CustomButton(text: "Mark as Done", onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DailyReflectionSpace()),
                // );
              }),

            ],
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
