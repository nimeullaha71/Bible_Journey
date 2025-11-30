
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import 'gender_selection-screen.dart';

class QuizIntroScreen extends StatelessWidget {
  const QuizIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Bible Journey",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.appLogo,height: 120,),

              const SizedBox(height: 20),

              const Text(
                "Path to Wisdom",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4),
              const Text("5-minute quiz",
                  style: TextStyle(fontSize: 14, color: Colors.grey)),

              const SizedBox(height: 60),

              // SizedBox(
              //   width: 220,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.primary,
              //       padding: const EdgeInsets.symmetric(vertical: 14),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: const Text("Start",
              //         style: TextStyle(fontSize: 18, color: Colors.white)),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) =>  GenderSelectScreen()),
              //       );
              //     },
              //   ),
              // )

              CustomButton(text: "Start", onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GenderSelectScreen()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
