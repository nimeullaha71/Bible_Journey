import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/routes.dart';
import 'package:bible_journey/widgets/buttons/auth_flow_custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
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
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),
                  ),

                  Image.asset(AppImages.appLogo,height: height*0.13,),

                  SizedBox(height: height*0.001,),

                  Text(
                    "set_password_button.title".tr(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),

                  SizedBox(height: height * 0.001),

                  Text(
                    "set_new_password.subtitle".tr(),
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
                      Text("set_new_password.new_password".tr(),style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "set_new_password.password_hint".tr(),
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("set_new_password.confirm_password".tr(),style: TextStyle(color: Color.fromRGBO(73, 76, 79, 1),fontSize: 16, fontWeight: FontWeight.w600,),),
                      SizedBox(height: 8,),
                      CustomTextField(
                        label: "set_new_password.password_hint".tr(),
                        controller: confirmPasswordController,
                        obscureText: true,
                      ),
                    ],
                  ),


                  SizedBox(height: height*0.03,),
                  
                  AuthCustomButton(text: "set_new_password.set_password_button".tr(), onTap: (){
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
