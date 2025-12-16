import 'package:bible_journey/features/auth/screens/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:bible_journey/widgets/textField/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  Future<void> _sendOtp() async {
    final email = emailController.text.trim();
    if (email.isEmpty || !email.contains("@")) {
      _showMessage("Enter a valid email");
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await AuthService.forgotPassword(email);

      if (response['status'] == 'otp_sent') {
        if (!mounted) return;
        setState(() => isLoading = false);

        _showMessage("OTP sent to your email");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VerifyOtpScreen(email: email),
          ),
        );
      } else {
        if (!mounted) return;
        setState(() => isLoading = false);

        _showMessage(response['message'] ?? "Failed to send OTP");
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);

      _showMessage("Error: ${e.toString().replaceAll("Exception: ", "")}");
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Image.asset(AppImages.splashBg, fit: BoxFit.cover)),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Image.asset(AppImages.appLogo, height: height * 0.13),
                  SizedBox(height: height * 0.02),
                  Text("forgot_password.title".tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, color: Color.fromRGBO(51, 51, 51, 1))),
                  SizedBox(height: height * 0.01),
                  Text("forgot_password.subtitle".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.7))),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("sign_up.email".tr(),
                          style: const TextStyle(
                              color: Color.fromRGBO(73, 76, 79, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      CustomTextField(
                          label: "forgot_password.email_hint".tr(),
                          controller: emailController),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  AuthCustomButton(
                      text: "forgot_password.send_code".tr(),
                      height: height * 0.06,
                      isLoading: isLoading,
                      onTap: _sendOtp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
