import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(title: "Profile"),
      body: Center(
        child: Text("Profile Section"),
      ),
    );
  }
}
