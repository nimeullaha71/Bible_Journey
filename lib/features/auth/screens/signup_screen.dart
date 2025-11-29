import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/textField/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

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

                  SizedBox(height: height * 0.001),

                  /// Logo
                  Image.asset(AppImages.appLogo, height: height * 0.13),

                  SizedBox(height: height * 0.015),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      ///Full Name
                      CustomTextField(
                        label: "Full Name",
                        controller: nameController,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),

                  ///Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Email",
                        controller: emailController,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),

                  /// Phone
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone Number",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Phone Number",
                        controller: phoneController,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),

                  /// Password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Password",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.01),

                  ///Confirm Password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm Password",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Confirm Password",
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.015),

                  /// Login Button
                  AuthCustomButton(
                    text: "Log in",
                    height: height * 0.055,
                    onTap: () {
                      // Handle login
                    },
                  ),

                  SizedBox(height: 15),

                  /// Bottom Sign Up Text
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.logIn);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 220),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
