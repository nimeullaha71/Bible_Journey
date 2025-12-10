import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

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

          /// TOP CONTENT — Responsive
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.07), // Responsive top padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    /// Logo (Responsive size)
                    Image.asset(
                      AppImages.appLogo,
                      height: height * 0.22, // 20–22% of screen height
                      width: width * 0.45,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: height * 0.025),

                    /// Title
                    Text(
                      "splash.title".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(3, 91, 143, 1),
                        fontSize: height * 0.045, // responsive font
                      ),
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: height * 0.015),

                    /// Subtitle
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                      child: Text(
                        "splash.subtitle".tr(),
                        style: AppTextStyles.heading.copyWith(
                          fontSize: height * 0.022,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Bottom Buttons — Responsive
          Positioned(
            bottom: height * 0.25, // responsive bottom distance
            left: width * 0.07,
            right: width * 0.07,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Custom Button
                SizedBox(
                  width: double.infinity,
                  child: AuthCustomButton(
                    text: "get_started".tr(),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.mainBottomNavScreen);
                    },
                    height: height * 0.055, // responsive button height
                  ),
                ),

                SizedBox(height: height * 0.02),

                /// Login text

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.logIn);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "already_account".tr(),
                      style: AppTextStyles.normal.copyWith(
                        fontSize: height * 0.022,
                      ),
                      children: [
                        TextSpan(
                          text: "log_in".tr(),
                          style: TextStyle(color: Color(0xFF015093), fontWeight: FontWeight.w600),
                        ),
                      ],
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
