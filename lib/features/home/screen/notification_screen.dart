import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/custom_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "notification".tr(), onTap: (){
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "today".tr(),
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                     Text(
                      "clear_all".tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff83BF8B),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              CustomNotification(
                  title: "Your Daily Devotion is ready ",
                  subtitle: "Start your day with a moment of \nreflection.",
                  image: "assets/images/jo.svg",
                  timeAgo: "5m ago"),

              SizedBox(height: 27),

              CustomNotification(
                  title: "Daily Prayer Reminder",
                  subtitle: "It's time for your morning prayer.",
                  image: "assets/images/jo.svg",

                  timeAgo: "5m ago"),

              SizedBox(height: 27),

              CustomNotification(
                  title: "Journey Progress Update",
                  subtitle: "You've completed a step in 'Finding \nPeace'!",
                  image:"assets/images/jo.svg",
                  timeAgo: "5m ago" ),

              SizedBox(height: 27),
              Divider(
                color: Color(0xffE3E9E3),
                thickness: 2,
              ),

              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      "yesterday".tr(),
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomNotification(
                  title: "New Devotional Series",
                  subtitle: "A new series on 'Gratitude' has been add",
                  image:"assets/images/jo.svg",
                  timeAgo: "5m ago" ),

              SizedBox(height: 27),

              CustomNotification(
                  title: "Verse of the Day",
                  subtitle: "Reflect on today's special verse.",
                  image:"assets/images/jo.svg",
                  timeAgo: "5m ago" ),
            ]
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
