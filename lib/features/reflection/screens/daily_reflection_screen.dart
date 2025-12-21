import 'dart:convert';
import 'package:bible_journey/app/Urls.dart';
import 'package:bible_journey/core/services/local_storage_service.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_detail_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../widgets/custom_nav_bar.dart';

class DailyReflectionScreen extends StatefulWidget {
  const DailyReflectionScreen({super.key});

  @override
  State<DailyReflectionScreen> createState() => _DailyReflectionScreenState();
}

class _DailyReflectionScreenState extends State<DailyReflectionScreen> {
  int _selectedIndex = 2;
  bool _isLoading = false;

  final TextEditingController _reflectionController = TextEditingController();


  Future<void> completeDay() async {

    if (_reflectionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Write Your Reflection ")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final token = LocalStorage.getToken();
    try {
      final response = await http.post(
        Uri.parse("${Urls.baseUrl}/progress/complete-day/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "journey_id": 4,
          "day_id": 29,
          "action": "complete",
          "reflecton_note": _reflectionController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"])),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => JourneyScreen()
          ),
              (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Network error")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F2),
      appBar: CustomAppBar(title: "daily_reflection".tr(), onTap: (){
        Navigator.pop(context);
      }),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                 Text("write_daily_reflection".tr(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                    )
                ),
                SizedBox(height: 40),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                  child: Container(
                    height: 465,
                    width: 380,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xffE3E9E3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      controller: _reflectionController,
                      decoration: InputDecoration(
                        hintText: "write_here".tr(),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 80),
                CustomButton(text: "mark_as_done".tr(), onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>JourneyDetailScreen(journeyId: 4,)), (predicate)=>false);
                })
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
