import 'package:flutter/material.dart';
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/services/auth_service.dart';
import 'set_new_password_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController OTPController = TextEditingController();
  bool isLoading = false;

  String get email => widget.email;

  Future<void> _verifyOtp() async {
    final otp = OTPController.text.trim();
    if (otp.length < 6) {
      _showMessage("Enter valid OTP");
      return;
    }

    setState(() => isLoading = true);

    try {
      final isVerified = await AuthService.verifyForgotPasswordOtp(email, otp);

      if (isVerified) {
        _showMessage("OTP verified successfully");

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SetNewPasswordScreen(),
            settings: RouteSettings(arguments: email),
          ),
        );
      } else {
        _showMessage("Invalid OTP. Try again.");
      }
    } catch (e) {
      _showMessage("Error: ${e.toString().replaceAll("Exception: ", "")}");
    }

    if (!mounted) return;
    setState(() => isLoading = false);
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
                          icon: const Icon(Icons.arrow_back))),
                  SizedBox(height: height * 0.01),
                  Image.asset(AppImages.appLogo, height: height * 0.13),
                  SizedBox(height: height * 0.02),
                  Text("otp.check_email".tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, color: Color.fromRGBO(51, 51, 51, 1))),
                  SizedBox(height: height * 0.01),
                  Text("otp.verification_sent".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.7))),
                  SizedBox(height: height * 0.02),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: Colors.green,
                        selectedColor: Colors.grey,
                        inactiveColor: Colors.white38),
                    animationDuration: const Duration(milliseconds: 300),
                    controller: OTPController,
                    appContext: context,
                  ),
                  SizedBox(height: height * 0.02),
                  AuthCustomButton(
                      text: "otp.verify_button".tr(),
                      height: height * 0.06,
                      isLoading: isLoading,
                      onTap: _verifyOtp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
