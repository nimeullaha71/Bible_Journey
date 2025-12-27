import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../journeys/screens/journey_screen.dart';

class QuizMarkScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;

  const QuizMarkScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
  });

  @override
  State<QuizMarkScreen> createState() => _QuizMarkScreenState();
}

class _QuizMarkScreenState extends State<QuizMarkScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: CustomAppBar(title: "Quiz Complete", onTap: () { Navigator.pop(context); }),
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
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff83BF8B),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xff83BF8B)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 392,
                  width: 380,
                  decoration: BoxDecoration(color: const Color(0xffE3E9E3), borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/check_circle.png', width: 75, height: 75, fit: BoxFit.cover),
                      const SizedBox(height: 10),
                      const Text('Correct', style: TextStyle(color: Color(0xff83BF8B), fontSize: 45)),
                      const SizedBox(height: 5),
                      Text('${widget.correctAnswers}/${widget.totalQuestions}',
                          style: const TextStyle(color: Color(0xff83BF8B), fontSize: 40, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  text: "continue.continue".tr(),
                  // onTap: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) => TodayActionScreen(dayId: ,)));
                  // },
                  onTap: (){
                    Navigator.pop(context);
                  }
                ),
                const SizedBox(height: 10),
                CustomButton(text: "continue.retry".tr(), onTap: () {}),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() { _selectedIndex = index; });
          switch (index) {
            case 0: Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())); break;
            case 1: Navigator.push(context, MaterialPageRoute(builder: (_) => const BibleScreen())); break;
            case 2: Navigator.push(context, MaterialPageRoute(builder: (_) => const JourneyScreen())); break;
            case 3: Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen())); break;
          }
        },
      ),
    );
  }
}
