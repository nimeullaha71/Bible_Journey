// import 'dart:convert';
// import 'package:bible_journey/app/constants.dart';
// import 'package:bible_journey/app/routes.dart';
// import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
// import 'package:bible_journey/features/home/screen/notification_screen.dart';
// import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
// import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
// import 'package:bible_journey/widgets/buttons/custom_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import '../../../app/Urls.dart';
// import '../../../core/services/api_service.dart';
// import '../../../core/services/local_storage_service.dart';
// import '../widgets/home_box.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   Map<String, dynamic>? userData;
//   bool isUserLoading = true;
//
//   Map<String, dynamic>? todayPrayer;
//   bool isPrayerLoading = true;
//   int unreadCount = 0;
//   bool isNotificationLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     loadUser();
//     loadTodayPrayer();
//     loadUnreadNotifications();
//   }
//
//   Future<void> loadUser() async {
//     try {
//       final data = await ApiServices.getProfile();
//       setState(() {
//         userData = data;
//         isUserLoading = false;
//       });
//     } catch (e) {
//       print("Error loading user: $e");
//       setState(() {
//         isUserLoading = false;
//       });
//     }
//   }
//
//   // Future<void> loadTodayPrayer() async {
//   //   try {
//   //     final token = await LocalStorage.getToken();
//   //     final url = "${Urls.baseUrl}/progress/today/prayer";
//   //
//   //     final response = await http.get(
//   //       Uri.parse(url),
//   //       headers: {
//   //         "Authorization": "Bearer $token",
//   //         "Content-Type": "application/json",
//   //       },
//   //     );
//   //
//   //     if (response.statusCode == 200) {
//   //       final data = jsonDecode(response.body);
//   //       setState(() {
//   //         todayPrayer = data;
//   //         isPrayerLoading = false;
//   //       });
//   //     } else {
//   //       throw Exception("Failed to fetch today prayer");
//   //     }
//   //   } catch (e) {
//   //     print("Error loading today prayer: $e");
//   //     setState(() {
//   //       isPrayerLoading = false;
//   //     });
//   //   }
//   // }
//   Future<void> loadTodayPrayer() async {
//     try {
//       final token = await LocalStorage.getToken();
//
//       final response = await http.get(
//         Uri.parse("${Urls.baseUrl}/progress/today"),
//         headers: {
//           "Authorization": "Bearer $token",
//           "Accept": "application/json",
//         },
//       );
//
//       print("TODAY STATUS => ${response.statusCode}");
//       print("TODAY BODY => ${response.body}");
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//
//         setState(() {
//           todayPrayer = data["data"]; // 👈 ONE source of truth
//           isPrayerLoading = false;
//         });
//       } else {
//         throw Exception("Failed to load today progress");
//       }
//     } catch (e) {
//       print("Error loading today prayer: $e");
//       setState(() {
//         isPrayerLoading = false;
//         todayPrayer = null;
//       });
//     }
//   }
//
//   Future<void> loadUnreadNotifications() async {
//     try {
//       final token = await LocalStorage.getToken();
//
//       final response = await http.get(
//         Uri.parse('${Urls.baseUrl}/notifications/'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           unreadCount = data['unread_message'] ?? 0;
//           isNotificationLoading = false;
//         });
//       }
//     } catch (e) {
//       print("Notification count error: $e");
//       isNotificationLoading = false;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(width * 0.04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: width * 0.07,
//                     backgroundColor: Colors.grey.shade200,
//                     backgroundImage: isUserLoading
//                         ? null
//                         : (userData?["avatar"] != null && userData!["avatar"].toString().isNotEmpty)
//                         ? NetworkImage(userData!["avatar"])
//                         : const AssetImage("assets/images/profile_img.png") as ImageProvider,
//                     child: isUserLoading
//                         ? const CircularProgressIndicator(strokeWidth: 2)
//                         : null,
//                   ),
//                   SizedBox(width: width * 0.03),
//                   Expanded(
//                     child: Text(
//                       isUserLoading
//                           ? "Good Morning"
//                           : "Good Morning, ${userData?["name"] ?? ""}",
//                       style: TextStyle(
//                         fontSize: width * 0.045,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       IconButton(
//                         onPressed: () async {
//                           await Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (_) => NotificationScreen()),
//                           );
//
//                           loadUnreadNotifications();
//                         },
//                         icon: const Icon(Icons.notifications_none),
//                       ),
//
//                       if (unreadCount > 0)
//                         Positioned(
//                           right: 6,
//                           top: 6,
//                           child: Container(
//                             padding: const EdgeInsets.all(4),
//                             decoration: BoxDecoration(
//                               color: Colors.white12,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             constraints: const BoxConstraints(
//                               minWidth: 18,
//                               minHeight: 18,
//                             ),
//                             child: Text(
//                               unreadCount > 99 ? '99+' : unreadCount.toString(),
//                               style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//
//                 ],
//               ),
//
//               SizedBox(height: height * 0.02),
//
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: width * 0.05,
//                 mainAxisSpacing: height * 0.015,
//                 childAspectRatio: width < 360 ? 0.95 : 1.2,
//                 children: [
//                   HomeBox(
//                     icon: SvgPicture.asset(
//                       "assets/images/Vector (3).svg",
//                       width: width * 0.06,
//                       height: width * 0.06,
//                       color: Colors.green,
//                     ),
//                     title: "Daily Prayer",
//                     subtitle: "Start your day with a guided prayer.",
//                     onTap: () {
//                       if (isPrayerLoading || todayPrayer == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text("Prayer not available yet")),
//                         );
//                         return;
//                       }
//
//                       final journeyId = todayPrayer!["journey"]["id"];
//                       final dayId = todayPrayer!["day"]["id"];
//
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => PrayerScreen(
//                             journeyId: journeyId,
//                             dayId: dayId,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//
//                   HomeBox(
//                     icon: SvgPicture.asset(
//                       "assets/images/Vector (1).svg",
//                       width: width * 0.06,
//                       height: width * 0.06,
//                       color: Colors.green,
//                     ),
//                     title: "Daily Devotion",
//                     subtitle: "Reflect on today's scripture.",
//                     onTap: () {
//                       if (isPrayerLoading || todayPrayer == null) return;
//
//                       final journeyId = todayPrayer!["journey"]["id"];
//                       final dayId = todayPrayer!["day"]["id"];
//
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => DailyDevotionScreen(
//                             journeyId: journeyId,
//                             dayId: dayId,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//
//                   HomeBox(
//                     icon: SvgPicture.asset(
//                       "assets/images/Vector (4).svg",
//                       width: width * 0.06,
//                       height: width * 0.06,
//                       color: Colors.green,
//                     ),
//                     title: "Today's Actions",
//                     subtitle: "Small tasks to grow faith.",
//                     onTap: () {
//                       final dayId = todayPrayer!["day"]["id"];
//                       final journeyId = todayPrayer!["journey"]["id"];
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => TodayActionScreen(dayId: dayId, journeyId: journeyId,)),
//                       );
//                     },
//                   ),
//
//                   HomeBox(
//                     icon: SvgPicture.asset(
//                       "assets/images/Vector (3).svg",
//                       width: width * 0.06,
//                       height: width * 0.06,
//                       color: Colors.green,
//                     ),
//                     title: "Begin a Journey",
//                     subtitle: "Guided plans for growth.",
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => JourneyScreen()),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//
//               SizedBox(height: height * 0.02),
//
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 padding: EdgeInsets.all(width * 0.04),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: Image.asset(
//                         "assets/images/home_img.jpg",
//                         height: height * 0.20,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.02),
//                     Text(
//                       "Explore Life Journeys",
//                       style: TextStyle(
//                         fontSize: width * 0.055,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.01),
//                     Text(
//                       "Find guidance on topics like gratitude, patience, or purpose.",
//                       style: TextStyle(
//                         fontSize: width * 0.035,
//                         color: Colors.grey.shade600,
//                       ),
//                     ),
//                     SizedBox(height: height * 0.02),
//                     CustomButton(
//                       text: "view_all_journeys".tr(),
//                       onTap: () {
//                         Navigator.pushNamed(context, AppRoutes.journeyScreen);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/app/Urls.dart';
import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
import 'package:bible_journey/features/home/screen/notification_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/features/prayer/screens/prayer_screen.dart';
import 'package:bible_journey/features/todays_actions/screens/todays_action_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../../../core/services/local_storage_service.dart';
import '../../../core/services/api_service.dart';
import '../widgets/home_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userData;
  bool isUserLoading = true;

  Map<String, dynamic>? todayPrayer;
  bool isPrayerLoading = true;
  int unreadCount = 0;
  bool isNotificationLoading = true;

  @override
  void initState() {
    super.initState();
    loadUser();
    loadTodayPrayer();
    loadUnreadNotifications();
  }

  Future<void> loadUser() async {
    try {
      final data = await ApiServices.getProfile();
      setState(() {
        userData = data;
        isUserLoading = false;
      });
    } catch (e) {
      print("Error loading user: $e");
      setState(() {
        isUserLoading = false;
      });
    }
  }

  Future<void> loadTodayPrayer() async {
    try {
      final token = await LocalStorage.getToken();
      final response = await http.get(
        Uri.parse("${Urls.baseUrl}/progress/today"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          todayPrayer = data["data"]; // Latest prayer data
          isPrayerLoading = false;
        });
      } else {
        throw Exception("Failed to load today progress");
      }
    } catch (e) {
      print("Error loading today prayer: $e");
      setState(() {
        isPrayerLoading = false;
        todayPrayer = null;
      });
    }
  }

  Future<void> loadUnreadNotifications() async {
    try {
      final token = await LocalStorage.getToken();
      final response = await http.get(
        Uri.parse('${Urls.baseUrl}/notifications/'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          unreadCount = data['unread_message'] ?? 0;
          isNotificationLoading = false;
        });
      }
    } catch (e) {
      print("Notification count error: $e");
      setState(() {
        isNotificationLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User & Notification Row
              Row(
                children: [
                  CircleAvatar(
                    radius: width * 0.07,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: isUserLoading
                        ? null
                        : (userData?["avatar"] != null && userData!["avatar"].toString().isNotEmpty)
                        ? NetworkImage(userData!["avatar"])
                        : const AssetImage("assets/images/profile_img.png") as ImageProvider,
                    child: isUserLoading
                        ? const CircularProgressIndicator(strokeWidth: 2)
                        : null,
                  ),
                  SizedBox(width: width * 0.03),
                  Expanded(
                    child: Text(
                      isUserLoading
                          ? "Good Morning"
                          : "Good Morning, ${userData?["name"] ?? ""}",
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => NotificationScreen()),
                          );
                          loadUnreadNotifications();
                        },
                        icon: const Icon(Icons.notifications_none),
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 18,
                              minHeight: 18,
                            ),
                            child: Text(
                              unreadCount > 99 ? '99+' : unreadCount.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              // Home Boxes
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.015,
                childAspectRatio: width < 360 ? 0.95 : 1.2,
                children: [
                  // Daily Prayer
                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (3).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Daily Prayer",
                    subtitle: "Start your day with a guided prayer.",
                    onTap: () {
                      if (isPrayerLoading || todayPrayer == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Prayer not available yet")),
                        );
                        return;
                      }

                      final journeyId = todayPrayer!["journey"]["id"];
                      final dayId = todayPrayer!["day"]["id"];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PrayerScreen(
                            journeyId: journeyId,
                            dayId: dayId,
                          ),
                        ),
                      );
                    },
                  ),

                  // Daily Devotion
                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (1).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Daily Devotion",
                    subtitle: "Reflect on today's scripture.",
                    onTap: () {
                      if (isPrayerLoading || todayPrayer == null) return;

                      final journeyId = todayPrayer!["journey"]["id"];
                      final dayId = todayPrayer!["day"]["id"];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DailyDevotionScreen(
                            journeyId: journeyId,
                            dayId: dayId,
                          ),
                        ),
                      );
                    },
                  ),

                  // Today's Actions
                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (4).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Today's Actions",
                    subtitle: "Small tasks to grow faith.",
                    onTap: () {
                      if (todayPrayer == null) return;
                      final journeyId = todayPrayer!["journey"]["id"];
                      final dayId = todayPrayer!["day"]["id"];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TodayActionScreen(dayId: dayId, journeyId: journeyId,),
                        ),
                      );
                    },
                  ),

                  // Begin a Journey
                  HomeBox(
                    icon: SvgPicture.asset(
                      "assets/images/Vector (3).svg",
                      width: width * 0.06,
                      height: width * 0.06,
                      color: Colors.green,
                    ),
                    title: "Begin a Journey",
                    subtitle: "Guided plans for growth.",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => JourneyScreen()),
                      );
                    },
                  ),
                ],
              ),

              SizedBox(height: height * 0.02),

              // Explore Life Journeys Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/home_img.jpg",
                        height: height * 0.20,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Explore Life Journeys",
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      "Find guidance on topics like gratitude, patience, or purpose.",
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    CustomButton(
                      text: "View All Journeys",
                      onTap: () {
                        Navigator.pushNamed(context, "/journeyScreen");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
