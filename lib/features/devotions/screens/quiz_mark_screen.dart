import 'package:bible_journey/features/devotions/screens/daily_devotion_quiz_screen.dart';
import 'package:bible_journey/features/devotions/screens/devotion_detail_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../journeys/screens/journey_screen.dart';

class QuizMarkScreen extends StatefulWidget {
  final int correctAnswers;

  const QuizMarkScreen({super.key, required this.correctAnswers});

  @override
  State<QuizMarkScreen> createState() => _QuizMarkScreenState();
}

class _QuizMarkScreenState extends State<QuizMarkScreen> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F5F2),
        title: const Text("Quiz Complete"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Great Effort!", style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(height: 13),
                Container(
                  height: 13,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff83BF8B),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff83BF8B)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 392,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(0xffE3E9E3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/check_circle.png',
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Correct',
                        style: TextStyle(
                          color: Color(0xff83BF8B),
                          fontSize: 45,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${widget.correctAnswers}/3',
                        style: TextStyle(
                          color: Color(0xff83BF8B),
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                CustomButton(text: "Continue", onTap: (){
                }),

                SizedBox(height: 10),
                CustomButton(text: "Retry Quiz", onTap: (){
                  Navigator.push( context, MaterialPageRoute(builder: (context) => DevotionDetailScreen()), );
                }),

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
