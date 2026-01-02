// // import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
// // import 'package:bible_journey/features/bible/screens/bible_screen.dart';
// // import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// // import 'package:bible_journey/widgets/custom_nav_bar.dart';
// // import 'package:flutter/material.dart';
// // import 'features/home/screen/home_screen.dart';
// //
// // class MainBottomNavScreen extends StatefulWidget {
// //   const MainBottomNavScreen({super.key});
// //
// //   @override
// //   State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
// // }
// //
// // class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
// //
// //   int currentIndex = 0;
// //   final screens =  [
// //      const HomeScreen(),
// //      const BibleScreen(),
// //      const JourneyScreen(),
// //      const ProfileScreen(),
// //
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: screens[currentIndex],
// //       bottomNavigationBar: CustomNavbar(
// //         currentIndex: currentIndex,
// //         onItemPressed: (index) {
// //           setState(() {
// //             currentIndex = index;
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
// import 'package:bible_journey/features/bible/screens/bible_screen.dart';
// import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// import 'package:bible_journey/features/home/screen/home_screen.dart';
// import 'package:bible_journey/widgets/custom_nav_bar.dart';
// import 'package:flutter/material.dart';
//
// class MainBottomNavScreen extends StatefulWidget {
//   const MainBottomNavScreen({super.key});
//
//   @override
//   State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
// }
//
// class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
//   int currentIndex = 0;
//
//   // Each tab has its own navigator key to maintain its navigation stack
//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//
//   void _onTap(int index) {
//     if (currentIndex == index) {
//       // If tapping the same tab, pop to first route
//       _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
//     } else {
//       setState(() {
//         currentIndex = index;
//       });
//     }
//   }
//
//   Widget _buildOffstageNavigator(int index, Widget screen) {
//     return Offstage(
//       offstage: currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (_) => screen,
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _buildOffstageNavigator(0, const HomeScreen()),
//           _buildOffstageNavigator(1, const BibleScreen()),
//           _buildOffstageNavigator(2, const JourneyScreen()),
//           _buildOffstageNavigator(3, const ProfileScreen()),
//         ],
//       ),
//       bottomNavigationBar: CustomNavbar(
//         currentIndex: currentIndex,
//         onItemPressed: _onTap,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:bible_journey/features/home/screen/home_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/widgets/custom_nav_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => MainBottomNavScreenState();
}

/// ❗ underscore REMOVED
class MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  /// 🔑 HomeScreen এখানেই call করবে
  void switchToTab(int index, {Widget? pushScreen}) {
    setState(() => currentIndex = index);

    if (pushScreen != null) {
      _navigatorKeys[index]
          .currentState
          ?.push(MaterialPageRoute(builder: (_) => pushScreen));
    }
  }

  void _onTap(int index) {
    if (currentIndex == index) {
      _navigatorKeys[index]
          .currentState
          ?.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentIndex = index);
    }
  }

  Widget _buildNavigator(int index, Widget child) {
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (_) =>
            MaterialPageRoute(builder: (_) => child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildNavigator(0, const HomeScreen()),
          _buildNavigator(1, const BibleScreen()),
          _buildNavigator(2, const JourneyScreen()),
          _buildNavigator(3, const ProfileScreen()),
        ],
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: currentIndex,
        onItemPressed: _onTap,
      ),
    );
  }
}

