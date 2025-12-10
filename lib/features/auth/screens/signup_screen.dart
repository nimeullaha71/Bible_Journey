import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../widgets/textField/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await AuthService().signup(
        fullName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      await LocalStorage.saveToken(response['token']);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['messge'] ?? 'Signup Successful')),
      );

      Navigator.pushReplacementNamed(context, AppRoutes.mainBottomNavScreen);

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Given Unique Number and email")),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [

          /// Background Image
          Positioned.fill(
            child: Image.asset(
              AppImages.signUpBg,
              fit: BoxFit.cover,
            ),
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

                    SizedBox(height: height * 0.001),

                    Image.asset(AppImages.appLogo, height: height * 0.13),

                    SizedBox(height: height * 0.015),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_up.full_name".tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          label: "sign_up.full_name".tr(),
                          controller: nameController,
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_up.email".tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          label: "sign_up.email".tr(),
                          controller: emailController,
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_up.phone".tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          label: "sign_up.phone".tr(),
                          controller: phoneController,
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_up.password".tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          label: "sign_up.password".tr(),
                          controller: passwordController,
                          obscureText: true,
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.01),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "sign_up.confirm_password".tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(73, 76, 79, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          label: "sign_up.confirm_password".tr(),
                          controller: confirmPasswordController,
                          obscureText: true,
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.015),

                    AuthCustomButton(
                      text: "sign_up.login_button".tr(),
                      height: height * 0.055,
                      onTap: signup,
                      isLoading: _isLoading,
                    ),


                    const SizedBox(height: 15),

                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, AppRoutes.logIn);
                      },
                      child: RichText(
                        text:  TextSpan(
                          text: "sign_up.already_account".tr(),
                          style: const TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "sign_up.sign_in".tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 220),
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
