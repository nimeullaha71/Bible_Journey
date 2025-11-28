import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/features/auth/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/screens/signup_screen.dart';

class AppRoutes{
    static const String splash = '/splash';
    static const String home = '/home';
    static const String logIn = '/signIn';
    static const String signUp = '/signUp';



    static Route<dynamic>generateRoute(RouteSettings settings){
      switch(settings.name){
        case splash:
          return MaterialPageRoute(builder: (_)=>const SplashScreen());
        case logIn:
          return MaterialPageRoute(builder: (_)=>const LoginScreen());
        case signUp:
          return MaterialPageRoute(builder: (_)=>const SignUpScreen());


        //case home:
          //return MaterialPageRoute(builder: (_)=>HomeScreen());

        default:
          return MaterialPageRoute(builder: (_)=>const Scaffold(body: Center(child: Text("No Route Found"),),),);
      }
    }
}