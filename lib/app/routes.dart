import 'package:flutter/material.dart';
import 'package:bible_journey/features/auth/screens/forgot_password_screen.dart';
import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/features/auth/screens/set_new_password_screen.dart';
import 'package:bible_journey/features/auth/screens/splash_screen.dart';
import 'package:bible_journey/features/auth/screens/verify_otp_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/features/reflection/screens/daily_reflection_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';

import '../features/auth/screens/signup_screen.dart';
import '../features/devotions/models/daily_journey_model.dart';
import '../features/questionnaire/screens/question_intro_screen.dart';
import '../features/journeys/models/daily_journey_details_model.dart';
class AppRoutes {
  static const String splash = '/splash';
  static const String logIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String otpScreen = '/otpScreen';
  static const String setPasswordScreen = '/setPasswordScreen';
  static const String mainBottomNavScreen = '/mainBottomNavScreen';
  static const String quizIntroScreen = '/quizIntroScreen';
  static const String prayerScreen = '/prayerScreen';
  static const String journeyScreen = '/journeyScreen';
  static const String dailyDevotionScreen = '/dailyDevotionScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case logIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case otpScreen:
        final email = settings.arguments as String; // ✅ email from previous screen
        return MaterialPageRoute(
          builder: (_) => VerifyOtpScreen(email: email),
        );

      case setPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SetNewPasswordScreen());

      case mainBottomNavScreen:
        return MaterialPageRoute(builder: (_) => const MainBottomNavScreen());

      case quizIntroScreen:
        return MaterialPageRoute(builder: (_) => const QuizIntroScreen());

      case journeyScreen:
        return MaterialPageRoute(builder: (_) => const JourneyScreen());

    /// ✅ PRAYER SCREEN
      case prayerScreen:
        final data = settings.arguments as JourneyContentResponse;
        return MaterialPageRoute(
          builder: (_) => PrayerScreen(
            prayer: data.prayer,
            devotion: data.devotion,
            devotionResponse: data,
          ),
        );

    /// ✅ DAILY DEVOTION SCREEN
      case dailyDevotionScreen:
        final data = settings.arguments as JourneyContentResponse;
        return MaterialPageRoute(
          builder: (_) => DailyDevotionScreen(
            devotion: data.devotion,
            devotionResponse: data,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}

