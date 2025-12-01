import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../widgets/home_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/profile_img.png"),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Good Morning, Nime",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none, size: 28)
                ],
              ),

              SizedBox(height: 20),

              // Boxes Grid
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 12,
                childAspectRatio: 1.3,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeBox(
                    icon: Icons.bedtime,
                    title: "Daily Prayer",
                    subtitle: "Start your day with a guided prayer.",
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.prayerScreen);
                    },
                  ),
                  HomeBox(
                    icon: Icons.menu_book,
                    title: "Daily Devotion",
                    subtitle: "Reflect on today's scripture.",
                    onTap: () {},
                  ),
                  HomeBox(
                    icon: Icons.check_circle,
                    title: "Today's Actions",
                    subtitle: "Small tasks to live out your faith.",
                    onTap: () {},
                  ),
                  HomeBox(
                    icon: Icons.navigation,
                    title: "Begin a Journey",
                    subtitle: "Guided plans for growth.",
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Journey Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/home_img.jpg",
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Explore Life Journeys",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Find guidance on topics like gratitude, patience, or purpose.",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    SizedBox(height: 16),

                    CustomButton(text: "View All Journeys", onTap: (){})
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.symmetric(vertical: 12),
                    //   decoration: BoxDecoration(
                    //     color: Colors.green.shade400,
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     "View All Journeys →",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // )
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
