import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../journeys/screens/journey_screen.dart';
import '../models/daily_journey_model.dart';
import 'devotion_detail_screen.dart';

class DailyDevotionScreen extends StatefulWidget {
  final Devotion devotion;
  final JourneyContentResponse devotionResponse;

  const DailyDevotionScreen({
    super.key,
    required this.devotion,
     required this.devotionResponse,
  });


  @override
  State<DailyDevotionScreen> createState() => _DailyDevotionScreenState();
}

class _DailyDevotionScreenState extends State<DailyDevotionScreen> {
  int _selectedIndex = 2;
  int _selectedContainer = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "devotion.title".tr(), onTap: (){
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.devotion.scriptureName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                _buildSelectableContainer(
                  index: 0,
                  title: "Scripture",
                  content: widget.devotion.devotion,
                  centerText: true,
                ),


                const SizedBox(height: 16),

                _buildSelectableContainer(
                  index: 1,
                  title: "Reflection",
                  content: widget.devotion.reflection,
                ),


                const SizedBox(height: 16),

                // _buildSelectableContainer(
                //   index: 2,
                //   title: "Practical Application",
                //   content: "Today, when you feel overwhelmed by the troubles promise. How can you actively take heart and your circumstances? Consider one specific worry and intentionally surrender it to Him in prayer.",
                // ),

                const SizedBox(height: 30),


                CustomButton(
                  text: "devotion.completed".tr(),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevotionDetailScreen(
                          response: widget.devotionResponse, // <-- Now it's valid
                        ),
                      ),
                    );
                  },
                ),

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

  Widget _buildSelectableContainer({
    required int index,
    required String title,
    required String content,
    bool centerText = false,
  }) {
    bool isSelected = _selectedContainer == index;

    return GestureDetector(
      onTap: () {
        setState(() {

          if (_selectedContainer == index) {
            _selectedContainer = -1;
          } else {
            _selectedContainer = index;
          }
        });
      },
      child: Container(
        height: 163,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffE3E9E3) : Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(18),
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                  textAlign: centerText ? TextAlign.center : TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
