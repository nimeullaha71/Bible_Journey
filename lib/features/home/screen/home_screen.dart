import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/home_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting Section
              Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.07,
                    backgroundImage: AssetImage("assets/images/profile_img.png"),
                  ),
                  SizedBox(width: width * 0.03),
                  Expanded(
                    child: Text(
                      "Good Morning, Nime",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.notifications_none, size: width * 0.07)
                ],
              ),

              SizedBox(height: height * 0.02),

              /// Responsive Grid Boxes
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.015,
                childAspectRatio: width < 360 ? 0.95 : 1.2, // Responsive!
                children: [
                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (3).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Daily Prayer",
                    subtitle: "Start your day with a guided prayer.",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.prayerScreen);
                    },
                  ),

                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (1).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Daily Devotion",
                    subtitle: "Reflect on today's scripture.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DailyDevotionScreen()));
                    },
                  ),

                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (4).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Today's Actions",
                    subtitle: "Small tasks to grow faith.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TodayActionScreen()));
                    },
                  ),

                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (3).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Begin a Journey",
                    subtitle: "Guided plans for growth.",
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              /// Journey Card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/home_img.jpg",
                        height: height * 0.20,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    Text(
                      "Explore Life Journeys",
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: height * 0.01),

                    Text(
                      "Find guidance on topics like gratitude, patience, or purpose.",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    CustomButton(
                      text: "View All Journeys",
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.journeyScreen);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
