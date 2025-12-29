import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_quiz_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../journeys/screens/journey_screen.dart';


class DevotionDetailScreen extends StatefulWidget {
  //final JourneyContentResponse response;
  final int journeyId;
  final int dayId;

  const DevotionDetailScreen({
    super.key, required this.journeyId, required this.dayId,
    //required this.response,
  });

  @override
  State<DevotionDetailScreen> createState() => _DevotionDetailScreenState();
}


class _DevotionDetailScreenState extends State<DevotionDetailScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "quiz_details".tr(), onTap: (){
        Navigator.pop(context);
      }),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/Rectangle 8.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(height: 25),

              Column(
                children: [
                  Text(
                    "quiz.title".tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "quiz.completed_line".tr(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 130,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E9E3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "3 Questions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Total questions",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Container(
                    height: 130,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFFE3E9E3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "1 minutes",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Estimated time",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 130,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Color(0xFFE3E9E3),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Book of Psalms",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "topics",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),

              CustomButton(
                text: "buttons.start_quiz".tr(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DailyDevotionQuizScreen(
                        journeyId: widget.journeyId,
                        dayId: widget.dayId,
                      )

                    ),
                  );
                },
              ),

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
