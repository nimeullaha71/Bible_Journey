import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetSuccessfulScreen extends StatefulWidget {
  const ResetSuccessfulScreen({super.key});

  @override
  State<ResetSuccessfulScreen> createState() => _ResetSuccessfulScreenState();
}

class _ResetSuccessfulScreenState extends State<ResetSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // 🌎 Full screen background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashBg),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🟦 Top container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ✅ Check icon
                    Image.asset(
                      'assets/images/check_circle.png',
                      height: 100,
                      width: 100,
                    ),

                    const SizedBox(height: 20),

                    // Title
                    const Text(
                      "Password Reset Successfully!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Subtitle
                    const Text(
                      "Your password has been successfully reset.\nYou can now log in with your new password.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Log in button
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: const Color(0xFF004E92),
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //       padding: const EdgeInsets.symmetric(vertical: 16),
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const LoginScreen(),
                    //         ),
                    //             (route) => false,
                    //       );
                    //     },
                    //     child: const Text(
                    //       "Log in",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    CustomButton(text: "Log In", onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route)=>false);
                    }),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
