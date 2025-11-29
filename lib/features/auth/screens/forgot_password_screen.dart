import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:bible_journey/widgets/textField/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Image.asset(AppImages.splashBg,fit: BoxFit.cover,)),


          SafeArea(child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back)
                ),
                  alignment: Alignment.centerLeft,
                ),

                SizedBox(height: height*0.001,),

                Image.asset(AppImages.appLogo,height: height*0.13,),
                SizedBox(height: height * 0.018),

                Text("Forgot Password",textAlign: TextAlign.center, style: TextStyle(fontSize: 22, color: Color.fromRGBO(51, 51, 51, 1) ),),
                SizedBox(height: height * 0.018),
                Text("Enter your email and we will send you a verification codeForgot Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                    CustomTextField(label: "Enter Your Email", controller: emailController)
                  ],
                ),

                SizedBox(height: height*0.018,),

                AuthCustomButton( text: "Send Code",height: height*0.06, onTap: (){
                  Navigator.pushNamed(context, AppRoutes.otpScreen);
                })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
