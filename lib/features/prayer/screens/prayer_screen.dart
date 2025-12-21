import 'dart:convert';

import 'package:bible_journey/app/Urls.dart';
import 'package:bible_journey/core/services/local_storage_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../app/constants.dart';
import '../../../widgets/appbars/custom_appbar.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../models/prayer_model.dart';
import '../services/prayer_api.dart';
import '../../journeys/screens/journey_screen.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/audio_player_card.dart';

class PrayerScreen extends StatefulWidget {
  final int journeyId;
  final int dayId;

  const PrayerScreen({super.key, required this.journeyId, required this.dayId});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _selectedIndex = 2;
  late Future<PrayerResponse> prayerFuture;

  @override
  void initState() {
    super.initState();
    prayerFuture = PrayerApi.getTodayPrayer(widget.journeyId, widget.dayId);
  }

  Future<void> completePrayerStep() async {
    // final String baseUrl = AppConstants.baseUrl;
    // final String token = AppConstants.token; // JWT token

    try {
      final token = LocalStorage.getToken();
      final response = await http.post(
        Uri.parse("${Urls.baseUrl}/progress/stepcopmplete/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "day_id": widget.dayId,
          "item_type": "prayer",
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ✅ success
        print("Step completed: ${data['completed']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"])),
        );

        // back or next screen
        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Failed to complete step")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Network error")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "daily_prayer".tr(),
        onTap: () => Navigator.pop(context),
      ),
      body: FutureBuilder<PrayerResponse>(
        future: prayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ✅ API call e error
          if (snapshot.hasError) {
            print("Prayer API Error: ${snapshot.error}");
            return Center(child: Text("Something went wrong"));
          }

          // ✅ Null or empty data
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No prayer data found"));
          }

          final prayer = snapshot.data!.data;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Today's Prayer",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    prayer.prayer,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 60),
                  AudioPlayerCard(
                    url: prayer.audioUrl,
                    title: "Prayer Audio",
                    subtitle: "Read by Daily Devotions",
                    thumbnail: Container(color: Colors.redAccent.shade100),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Next",
                    //onTap: () => Navigator.pop(context, true),
                    onTap: completePrayerStep,
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
          setState(() => _selectedIndex = index);
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
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

