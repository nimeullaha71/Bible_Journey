import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController OTPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Image.asset(AppImages.splashBg)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    alignment: Alignment.centerLeft,
                  ),

                  SizedBox(height: height * 0.001),

                  Image.asset(AppImages.appLogo, height: height * 0.13),

                  SizedBox(height: height * 0.001),

                  Text(
                    "otp.check_email".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),

                  SizedBox(height: height * 0.001),

                  Text(
                    "otp.verification_sent".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),

                  SizedBox(height: height * 0.01),

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
                      inactiveColor: Colors.white38,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    controller: OTPController,
                    appContext: context,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'otp.enter_otp'.tr();
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: height * 0.0001),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("otp.resend_otp".tr()),
                    ),
                  ),
                  
                  

                  SizedBox(height: height * 0.02),

                  AuthCustomButton(text: "otp.verify_button".tr(), onTap: (){
                    Navigator.pushNamed(context, AppRoutes.setPasswordScreen);
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
