import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/features/Profile/screens/profile_details.dart';
import 'package:bible_journey/features/auth/screens/signup_screen.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/services/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final token = await LocalStorage.getToken();

    if (token != null && token.isNotEmpty) {
      // Token thakle user already login, direct main screen
      Future.microtask(() {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.mainBottomNavScreen,
        );
      });
    }
    // Token na thakle splash screen normal flow e thakbe
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 251, 231, 1),
      body: Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     AppImages.splashBg,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.07),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Image.asset(
                      AppImages.appLogo,
                      height: height * 0.22,
                      width: width * 0.45,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: height * 0.025),

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

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.10),
                      child: Text(
                        "splash.subtitle".tr(),
                        // style: AppTextStyles.heading.copyWith(
                        //   fontSize: height * 0.022,
                        // ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromRGBO(92, 92, 92, 1),fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: height * 0.25,
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
                      //Navigator.pushNamed(context, AppRoutes.mainBottomNavScreen);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    height: height * 0.055,
                  ),
                ),

                SizedBox(height: height * 0.02),

                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.logIn);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "already_account".tr(),
                      style:TextStyle(color: Color.fromRGBO(92, 92, 92, 1),fontSize: 16),
                      // AppTextStyles.normal.copyWith(
                      //   fontSize: height * 0.022,
                      // ),
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
