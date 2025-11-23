import 'package:bible_journey/features/auth/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes{
    static const String splash = '/splash';
    static const String home = '/home';
    static const String signIn = '/signIn';
    static const String signUp = '/signUp';



    static Route<dynamic>generateRoute(RouteSettings settings){
      switch(settings.name){
        case splash:
          return MaterialPageRoute(builder: (_)=>const SplashScreen());

        //case home:
          //return MaterialPageRoute(builder: (_)=>HomeScreen());

        default:
          return MaterialPageRoute(builder: (_)=>const Scaffold(body: Center(child: Text("No Route Found"),),),);
      }
    }
}