// import 'package:flutter/material.dart';
// import 'package:bible_journey/features/home/screen/home_screen.dart';
// import 'package:bible_journey/features/bible/screens/bible_screen.dart';
// import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
// import 'package:bible_journey/widgets/custom_nav_bar.dart';
// import 'package:flutter/services.dart';
//
// class MainBottomNavScreen extends StatefulWidget {
//   const MainBottomNavScreen({super.key});
//
//   @override
//   State<MainBottomNavScreen> createState() => MainBottomNavScreenState();
// }
//
// class MainBottomNavScreenState extends State<MainBottomNavScreen> {
//   int currentIndex = 0;
//
//   final GlobalKey<NavigatorState> _journeyNavigatorKey =
//   GlobalKey<NavigatorState>();
//
//   void goToTab(int index) {
//     setState(() => currentIndex = index);
//   }
//
//   NavigatorState? get journeyNavigator =>
//       _journeyNavigatorKey.currentState;
//
//   void _onTap(int index) {
//     if (index == currentIndex) return;
//     setState(() => currentIndex = index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (currentIndex == 2 &&
//             _journeyNavigatorKey.currentState!.canPop()) {
//           _journeyNavigatorKey.currentState!.pop();
//           return false;
//         }
//
//         if (currentIndex != 0) {
//           setState(() => currentIndex = 0);
//           return false;
//         }
//
//         SystemNavigator.pop();
//         return false;
//       },
//       child: Scaffold(
//         body: IndexedStack(
//           index: currentIndex,
//           children: [
//             const HomeScreen(),
//             const BibleScreen(),
//
//             Navigator(
//               key: _journeyNavigatorKey,
//               onGenerateRoute: (settings) {
//                 return MaterialPageRoute(
//                   builder: (_) => const JourneyScreen(),
//                 );
//               },
//             ),
//
//             const ProfileScreen(),
//           ],
//         ),
//         bottomNavigationBar: CustomNavbar(
//           currentIndex: currentIndex,
//           onItemPressed: _onTap,
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:bible_journey/features/home/screen/home_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/widgets/custom_nav_bar.dart';
import 'package:flutter/services.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => MainBottomNavScreenState();
}

class MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int currentIndex = 0;

  final GlobalKey<NavigatorState> _journeyNavigatorKey =
  GlobalKey<NavigatorState>();

  void goToTab(int index) {
    setState(() => currentIndex = index);
  }

  NavigatorState? get journeyNavigator =>
      _journeyNavigatorKey.currentState;

  void _onTap(int index) {
    if (index == currentIndex) return;
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;

        if (currentIndex == 2 &&
            _journeyNavigatorKey.currentState!.canPop()) {
          _journeyNavigatorKey.currentState!.pop();
          return;
        }

        if (currentIndex != 0) {
          setState(() => currentIndex = 0);
          return;
        }

        SystemNavigator.pop();
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [
            const HomeScreen(),
            const BibleScreen(),

            Navigator(
              key: _journeyNavigatorKey,
              onGenerateRoute: (_) =>
                  MaterialPageRoute(builder: (_) => const JourneyScreen()),
            ),

            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: CustomNavbar(
          currentIndex: currentIndex,
          onItemPressed: _onTap,
        ),
      ),
    );
  }
}
