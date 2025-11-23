import 'package:bible_journey/app/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(AppImages.splashBg,fit: BoxFit.cover,)),
          Center(
            child: Column(
              children: [
                Image.asset(AppImages.appLogo,height: 120,),
                const SizedBox(height: 20,),
                Text("splash.title".tr(),style: AppTextStyles.heading,),
                const SizedBox(height: 20,),
                Text("splash.subtitle".tr(),style: AppTextStyles.normal,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
