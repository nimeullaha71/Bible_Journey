import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/textField/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  /// Logo
                  Image.asset(AppImages.appLogo, height: height * 0.13),

                  SizedBox(height: height * 0.018),

                  /// Title
                  const Text(
                    "Begin Your Journey",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF005493),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// Subtitle
                  Text(
                    "Your companion daily reflection\nand Growth",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  /// Email
                  CustomTextField(
                    label: "Email",
                    controller: emailController,
                  ),

                  SizedBox(height: height * 0.02),

                  /// Password
                  CustomTextField(
                    label: "Password",
                    controller: passwordController,
                    obscureText: true,
                  ),

                  SizedBox(height: height * 0.015),

                  /// Remember Me + Forgot Password
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (val) {
                              setState(() {
                                rememberMe = val ?? false;
                              });
                            },
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "Forgot password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  /// Login Button
                  CustomButton(
                    text: "Log in",
                    height: 55,
                    onTap: () {
                      // Handle login
                    },
                  ),

                  SizedBox(height: height * 0.02),

                  /// Sign in with Google
                  _socialButton(icon: Icons.g_mobiledata, text: "Sign in with Google"),

                  SizedBox(height: 12),

                  /// Apple Login
                  _socialButton(icon: Icons.apple, text: "Sign in with Apple"),

                  SizedBox(height: 15),

                  /// Bottom Sign Up Text
                  RichText(
                    text: const TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign up",
                          style: TextStyle(
                            color: Color(0xFF015093),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Social Button (Google + Apple)
  Widget _socialButton({required IconData icon, required String text}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
        color: Colors.white.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 28),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
