import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.splashBg,
              fit: BoxFit.cover,
            ),
          ),

          /// Content
          Center(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Logo
                  Image.asset(
                    AppImages.appLogo,
                    height: 180,
                  ),

                  const SizedBox(height: 20),

                  /// Title
                  Text(
                    "splash.title".tr(),
                    style: AppTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  /// Subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      "splash.subtitle".tr(),
                      style: AppTextStyles.normal,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Spacer(),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  text: "Get Started",
                  onTap: () {},
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    // Log in page navigate
                  },
                  child: Text(
                    "Already have an account? Log in",
                    style: AppTextStyles.normal.copyWith(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
