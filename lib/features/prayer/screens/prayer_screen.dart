import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/questionnaire/widget/custom_quiz_app_bar.dart';
import 'package:flutter/material.dart';

class PrayerScreen extends StatefulWidget {
  const PrayerScreen({super.key});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomQuizAppBar(title: "Daily Prayer"),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("A Morning Prayer for Gratitude",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),

            SizedBox(height: 16,),

            Text("A Morning Prayer for Gratitude Heavenly Father, I come before you this morning with a heart full of gratitude. Thank you for the gift of a new day, for the breath in my lungs, and for the countless blessings you have bestowed upon me. Help me to see your goodness in all things, big and small. Guide my steps today, fill me with your peace, and allow me to be a reflection of your love to others. May I walk in your light and bring glory to your name. In Jesus' name, Amen.",style: TextStyle(fontSize: 16,color: Color.fromRGBO(0, 0, 0, 1)),),

          ],
        ),
      )),
    );
  }
}
