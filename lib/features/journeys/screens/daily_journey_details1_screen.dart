import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../devotions/models/daily_journey_model.dart';
import '../../devotions/screens/daily_devotion_screen.dart';
import '../../devotions/services/daily_journey_api.dart';
import '../widgets/custom_form.dart';

class JourneyDetails1 extends StatefulWidget {
  final int journeyId;
  final int dayId;

  const JourneyDetails1({super.key, required this.journeyId, required this.dayId});

  @override
  State<JourneyDetails1> createState() => _JourneyDetails1State();
}

class _JourneyDetails1State extends State<JourneyDetails1> {
  int _selectedIndex = 2;
  late Future<JourneyContentResponse> journeyContentFuture;

  @override
  void initState() {
    super.initState();
    journeyContentFuture = JourneyContentApi.getJourneyContent(widget.journeyId, widget.dayId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: const Text("Journey Details"),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder<JourneyContentResponse>(
        future: journeyContentFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Something went wrong: ${snapshot.error}"));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Day ${data.day.order}: ${data.day.title}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomForm(
                    title: "Daily Prayer",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrayerScreen(prayer: data.prayer, devotion: data.devotion, devotionResponse: data,),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomForm(
                    title: "Daily Devotion",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DailyDevotionScreen(devotion: data.devotion, devotionResponse: data,),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomForm(
                    title: "Today's Action",
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => TodayActionScreen(action: data.action),
                      //   ),
                      // );
                    },
                  ),
                  const SizedBox(height: 5),
                  CustomForm(
                    title: "Daily Reflection Space",
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DailyReflectionScreen(reflection: data.devotion.reflection),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BibleScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}
