// import 'package:bible_journey/features/devotions/screens/daily_devotion_quiz_screen.dart';
// import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
// import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
// import 'package:bible_journey/widgets/buttons/custom_button.dart';
// import 'package:flutter/material.dart';
// import '../../../widgets/custom_nav_bar.dart';
// import '../../Profile/screens/profile_screen.dart';
// import '../../bible/screens/bible_screen.dart';
// import '../../home/screen/home_screen.dart';
// import '../../journeys/screens/journey_screen.dart';
//
// class QuizMarkScreen extends StatefulWidget {
//   final int correctAnswers;
//   final int totalQuestions;
//   final int journeyId;
//   final int dayId;
//
//   const QuizMarkScreen({
//     super.key,
//     required this.correctAnswers,
//     required this.totalQuestions, required this.journeyId, required this.dayId,
//   });
//
//   @override
//   State<QuizMarkScreen> createState() => _QuizMarkScreenState();
// }
// class _QuizMarkScreenState extends State<QuizMarkScreen> {
//   int _selectedIndex = 2;
//
//   String getFeedbackMessage() {
//     if (widget.totalQuestions == 0) return "No questions attempted";
//
//     double percent = widget.correctAnswers / widget.totalQuestions * 100;
//
//     if (percent < 30) {
//       return "Keep Trying! You can do better.";
//     } else if (percent >= 30 && percent < 60) {
//       return "Good Effort! Keep Improving.";
//     } else if (percent >= 60 && percent < 100) {
//       return "Great Job! Almost Perfect.";
//     } else {
//       return "Excellent! Perfect Score!";
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double progressFactor = widget.totalQuestions > 0
//         ? widget.correctAnswers / widget.totalQuestions
//         : 0;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F5F2),
//       appBar: CustomAppBar(
//         title: "Quiz Complete",
//         onTap: () { Navigator.pop(context); },
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//
//                 Text(
//                   getFeedbackMessage(),
//                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 13),
//
//                 Container(
//                   height: 13,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: FractionallySizedBox(
//                     alignment: Alignment.centerLeft,
//                     widthFactor: progressFactor,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: const Color(0xff83BF8B),
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: const Color(0xff83BF8B)),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 40),
//                 Container(
//                   height: 392,
//                   width: 380,
//                   decoration: BoxDecoration(
//                       color: const Color(0xffE3E9E3),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         'assets/images/check_circle.png',
//                         width: 75,
//                         height: 75,
//                         fit: BoxFit.cover,
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Correct',
//                         style: TextStyle(
//                             color: Color(0xff83BF8B),
//                             fontSize: 45),
//                       ),
//                       const SizedBox(height: 5),
//                       Text(
//                         '${widget.correctAnswers}/${widget.totalQuestions}',
//                         style: const TextStyle(
//                             color: Color(0xff83BF8B),
//                             fontSize: 40,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 CustomButton(
//                   text: "Continue",
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => TodayActionScreen(
//                                 dayId: widget.dayId,
//                                 journeyId: widget.journeyId)));
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                   text: "Retry",
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => DailyDevotionQuizScreen(
//                                 journeyId: widget.journeyId,
//                                 dayId: widget.dayId)));
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: CustomNavbar(
//         currentIndex: _selectedIndex,
//         onItemPressed: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//           switch (index) {
//             case 0:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const HomeScreen()));
//               break;
//             case 1:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const BibleScreen()));
//               break;
//             case 2:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const JourneyScreen()));
//               break;
//             case 3:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const ProfileScreen()));
//               break;
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:bible_journey/features/devotions/screens/daily_devotion_quiz_screen.dart';
import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../journeys/screens/journey_screen.dart';

class QuizMarkScreen extends StatefulWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int journeyId;
  final int dayId;

  const QuizMarkScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.journeyId,
    required this.dayId,
  });

  @override
  State<QuizMarkScreen> createState() => _QuizMarkScreenState();
}

class _QuizMarkScreenState extends State<QuizMarkScreen> {
  int _selectedIndex = 2;

  String getFeedbackMessage() {
    if (widget.totalQuestions == 0) return "No questions attempted";

    double percent = widget.correctAnswers / widget.totalQuestions * 100;

    if (percent < 30) {
      return "Keep Trying! You can do better.";
    } else if (percent >= 30 && percent < 60) {
      return "Good Effort! Keep Improving.";
    } else if (percent >= 60 && percent < 100) {
      return "Great Job! Almost Perfect.";
    } else {
      return "Excellent! Perfect Score!";
    }
  }

  @override
  Widget build(BuildContext context) {
    double progressFactor = widget.totalQuestions > 0
        ? widget.correctAnswers / widget.totalQuestions
        : 0;

    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: CustomAppBar(
        title: "Quiz Complete",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),

              // Feedback text
              Text(
                getFeedbackMessage(),
                style: TextStyle(
                  fontSize: screenHeight * 0.022,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),

              // Progress bar
              Container(
                height: screenHeight * 0.015,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: progressFactor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff83BF8B),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xff83BF8B)),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Main quiz result box
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffE3E9E3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/check_circle.png',
                        width: screenWidth * 0.18,
                        height: screenWidth * 0.18,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Correct',
                        style: TextStyle(
                          color: const Color(0xff83BF8B),
                          fontSize: screenHeight * 0.06,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        '${widget.correctAnswers}/${widget.totalQuestions}',
                        style: TextStyle(
                          color: const Color(0xff83BF8B),
                          fontSize: screenHeight * 0.05,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Buttons
              CustomButton(
                text: "Continue",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TodayActionScreen(
                        dayId: widget.dayId,
                        journeyId: widget.journeyId,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.015),
              CustomButton(
                text: "Retry",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDevotionQuizScreen(
                        journeyId: widget.journeyId,
                        dayId: widget.dayId,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavbar(
      //   currentIndex: _selectedIndex,
      //   onItemPressed: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //     switch (index) {
      //       case 0:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      //         break;
      //       case 1:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => const BibleScreen()));
      //         break;
      //       case 2:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
      //         break;
      //       case 3:
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
