import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/textField/custom_text_field.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {


  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(child: Image.asset(AppImages.splashBg,fit: BoxFit.cover,)),

          SafeArea(

            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Align(
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                    alignment: Alignment.centerLeft,
                  ),

                  Image.asset(AppImages.appLogo,height: height*0.13,),

                  SizedBox(height: height*0.001,),

                  Text(
                    "Set a new password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),

                  SizedBox(height: height * 0.001),

                  Text(
                    "Create a new password. Ensure it differs from previous ones for security",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),


                  SizedBox(height: height * 0.06),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter New Password",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Confirm New Password",style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "Password",
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                    ],
                  ),


                  SizedBox(height: height*0.03,),
                  
                  AuthCustomButton(text: "Set Password", onTap: (){
                    Navigator.pushNamed(context, AppRoutes.logIn);
                  })
                  
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
