import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/features/auth/screens/trial_expired_payment_screen.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../widgets/textField/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool _isLoading = false;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await AuthService().login(
        login_id: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      await LocalStorage.saveToken(response['token']);
      await LocalStorage.saveEmail(emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['message'] ?? "Login successful")),
      );

      if (response['trial_expired'] != null &&
          response['trial_expired'].toString().toLowerCase().contains("expired")) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TrialExpiredPaymentScreen(planType: "planType")));
        return;
      }

      if (response['category'] == null || response['category'].toString().isEmpty) {
        Navigator.pushReplacementNamed(context, AppRoutes.quizIntroScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.mainBottomNavScreen);
      }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email or Password is incorrect")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.splashBg, fit: BoxFit.cover),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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

                    Image.asset(AppImages.appLogo, height: height * 0.13),
                    SizedBox(height: height * 0.018),

                    Text(
                      "login.begin_journey".tr(),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Color(0xFF005493),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),

                    Text(
                      "login.subtitle".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "login.email".tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          label: "login.email".tr(),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(
                              r'\S+@\S+\.\S+',
                            ).hasMatch(value.trim())) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "login.password".tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          label: "login.password".tr(),
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required";
                            }
                            if (value.trim().length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.015),

                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.green,
                              value: rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  rememberMe = val ?? false;
                                });
                              },
                            ),
                            Text(
                              "login.remember_me".tr(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.forgotPassword,
                            );
                          },
                          child: Text(
                            "login.forgot_password".tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.025),

                    AuthCustomButton(
                      text: _isLoading ? "Loading..." : "log_in".tr(),
                      height: height * 0.055,
                      onTap: _isLoading ? () {} : login,
                    ),

                    SizedBox(height: height * 0.02),

                    _socialButton(
                      icon: Icons.g_mobiledata,
                      text: "login.sign_in_google".tr(),
                    ),

                    SizedBox(height: 12),

                    _socialButton(
                      icon: Icons.apple,
                      text: "login.sign_in_apple".tr(),
                    ),

                    SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUp);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "login.no_account".tr(),
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "login.sign_up".tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton({required IconData icon, required String text}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
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
