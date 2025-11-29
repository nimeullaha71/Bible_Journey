import 'package:bible_journey/features/auth/screens/forgot_password_screen.dart';
import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/features/auth/screens/set_new_password_screen.dart';
import 'package:bible_journey/features/auth/screens/splash_screen.dart';
import 'package:bible_journey/features/auth/screens/verify_otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/screens/signup_screen.dart';

class AppRoutes{
    static const String splash = '/splash';
    static const String home = '/home';
    static const String logIn = '/signIn';
    static const String signUp = '/signUp';
    static const String forgotPassword = '/forgotPassword';
    static const String otpScreen = '/otpScreen';
    static const String setPasswordScreen = '/setPasswordScreen';



    static Route<dynamic>generateRoute(RouteSettings settings){
      switch(settings.name){
        case splash:
          return MaterialPageRoute(builder: (_)=>const SplashScreen());
        case logIn:
          return MaterialPageRoute(builder: (_)=>const LoginScreen());
        case signUp:
          return MaterialPageRoute(builder: (_)=>const SignUpScreen());
        case forgotPassword:
          return MaterialPageRoute(builder: (_)=>const ForgotPasswordScreen());
        case otpScreen:
          return MaterialPageRoute(builder: (_)=>const VerifyOtpScreen());
        case setPasswordScreen:
          return MaterialPageRoute(builder: (_)=>const SetNewPasswordScreen());


        //case home:
          //return MaterialPageRoute(builder: (_)=>HomeScreen());

        default:
          return MaterialPageRoute(builder: (_)=>const Scaffold(body: Center(child: Text("No Route Found"),),),);
      }
    }
}