// import 'package:bible_journey/app/constants.dart';
// import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
// import 'package:bible_journey/features/bible/screens/bible_screen.dart';
// import 'package:bible_journey/features/devotions/screens/daily_devotion_screen.dart';
// import 'package:bible_journey/features/home/screen/home_screen.dart';
// import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
// import 'package:bible_journey/widgets/buttons/custom_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import '../../../widgets/custom_nav_bar.dart';
// import '../models/prayer_response.dart';
// import '../services/prayer_api.dart';
// import '../widgets/audio_player_card.dart';
//
// // class PrayerScreen extends StatefulWidget {
// //   final Prayer prayer;
// //   final Devotion devotion;
// //   final JourneyContentResponse? devotionResponse; // ✅ ADD THIS
// //
// //   const PrayerScreen({
// //     super.key,
// //     required this.prayer,
// //     required this.devotion,
// //     this.devotionResponse,
// //   });
// //
// //   @override
// //   State<PrayerScreen> createState() => _PrayerScreenState();
// // }
// //
// //
// // class _PrayerScreenState extends State<PrayerScreen> {
// //   int _selectedIndex = 2;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.bgColor,
// //       appBar: CustomAppBar(title: "daily_prayer".tr(), onTap: () {
// //         Navigator.pop(context);
// //       }),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 const SizedBox(height: 20),
// //
// //                 // Dynamic Prayer Title
// //                 Text(
// //                   "Today's Prayer",
// //                   style: const TextStyle(
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.black,
// //                   ),
// //                   textAlign: TextAlign.left,
// //                 ),
// //
// //                 const SizedBox(height: 25),
// //
// //                 // Dynamic Prayer Text
// //                 Text(
// //                   widget.prayer.prayer,
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 60),
// //
// //                 // Dynamic Audio Player
// //                 AudioPlayerCard(
// //                   url: widget.prayer.audioUrl,
// //                   title: "Prayer Audio",
// //                   subtitle: "Read by Daily Devotions",
// //                   thumbnail: Container(color: Colors.redAccent.shade100),
// //                 ),
// //
// //                 const SizedBox(height: 32),
// //
// //                 // Next Button to Devotion Screen
// //                 CustomButton(
// //                   text: "Next",
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => DailyDevotionScreen(devotion: widget.devotion,devotionResponse: widget.devotionResponse!,
// //                           // এখানে পরবর্তীতে devotion object pass করতে পারো
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //
// //       bottomNavigationBar: CustomNavbar(
// //         currentIndex: _selectedIndex,
// //         onItemPressed: (index) {
// //           setState(() {
// //             _selectedIndex = index;
// //           });
// //           switch (index) {
// //             case 0:
// //               Navigator.push(
// //                   context, MaterialPageRoute(builder: (_) => const HomeScreen()));
// //               break;
// //             case 1:
// //               Navigator.push(
// //                   context, MaterialPageRoute(builder: (_) => const BibleScreen()));
// //               break;
// //             case 2:
// //               Navigator.push(
// //                   context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
// //               break;
// //             case 3:
// //               Navigator.push(
// //                   context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
// //               break;
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
//
// class PrayerScreen extends StatefulWidget {
//   final int journeyId;
//   final int dayId;
//
//   const PrayerScreen({
//     super.key,
//     required this.journeyId,
//     required this.dayId,
//   });
//
//   @override
//   State<PrayerScreen> createState() => _PrayerScreenState();
// }
//
// class _PrayerScreenState extends State<PrayerScreen> {
//   int _selectedIndex = 2;
//   late Future<PrayerResponse> prayerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     prayerFuture = PrayerApi.getTodayPrayer(
//       widget.journeyId,
//       widget.dayId,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgColor,
//       appBar: CustomAppBar(
//         title: "daily_prayer".tr(),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//       body: SafeArea(
//         child: FutureBuilder<PrayerResponse>(
//           future: prayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             if (snapshot.hasError) {
//               return Center(child: Text("Something went wrong"));
//             }
//
//             final prayer = snapshot.data!.data;
//
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//
//                     // Title (UNCHANGED)
//                     Text(
//                       "Today's Prayer",
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//
//                     const SizedBox(height: 25),
//
//                     // Prayer Text (DYNAMIC)
//                     Text(
//                       prayer.prayer,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         color: Colors.black87,
//                       ),
//                     ),
//
//                     const SizedBox(height: 60),
//
//                     // Audio Player (UNCHANGED UI)
//                     AudioPlayerCard(
//                       url: prayer.audioUrl,
//                       title: "Prayer Audio",
//                       subtitle: "Read by Daily Devotions",
//                       thumbnail: Container(
//                         color: Colors.redAccent.shade100,
//                       ),
//                     ),
//
//                     const SizedBox(height: 32),
//
//                     // Next Button
//                     CustomButton(
//                       text: "Next",
//                       onTap: () async {
//                         // 🔥 Mark completed in backend
//                         // await ProgressApi.completePrayer(
//                         //   widget.journeyId,
//                         //   widget.dayId,
//                         // );
//
//                         // 🔥 Return success → unlock next item
//                         Navigator.pop(context, true);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//
//       // Bottom nav (UNCHANGED)
//       bottomNavigationBar: CustomNavbar(
//         currentIndex: _selectedIndex,
//         onItemPressed: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//
//           switch (index) {
//             case 0:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const HomeScreen()));
//               break;
//             case 1:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const BibleScreen()));
//               break;
//             case 2:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const JourneyScreen()));
//               break;
//             case 3:
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => const ProfileScreen()));
//               break;
//           }
//         },
//       ),
//     );
//   }
// }
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../app/constants.dart';
import '../../../widgets/appbars/custom_appbar.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../models/prayer_model.dart';
import '../services/prayer_api.dart';
import '../../journeys/screens/journey_screen.dart';
import '../../Profile/screens/profile_screen.dart';
import '../../bible/screens/bible_screen.dart';
import '../../home/screen/home_screen.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/audio_player_card.dart';

class PrayerScreen extends StatefulWidget {
  final int journeyId;
  final int dayId;

  const PrayerScreen({super.key, required this.journeyId, required this.dayId});

  @override
  State<PrayerScreen> createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  int _selectedIndex = 2;
  late Future<PrayerResponse> prayerFuture;

  @override
  void initState() {
    super.initState();
    prayerFuture = PrayerApi.getTodayPrayer(widget.journeyId, widget.dayId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "daily_prayer".tr(),
        onTap: () => Navigator.pop(context),
      ),
      body: FutureBuilder<PrayerResponse>(
        future: prayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ✅ API call e error
          if (snapshot.hasError) {
            print("Prayer API Error: ${snapshot.error}");
            return Center(child: Text("Something went wrong"));
          }

          // ✅ Null or empty data
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No prayer data found"));
          }

          final prayer = snapshot.data!.data;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Today's Prayer",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    prayer.prayer,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const SizedBox(height: 60),
                  AudioPlayerCard(
                    url: prayer.audioUrl,
                    title: "Prayer Audio",
                    subtitle: "Read by Daily Devotions",
                    thumbnail: Container(color: Colors.redAccent.shade100),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Next",
                    onTap: () => Navigator.pop(context, true),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() => _selectedIndex = index);
          switch (index) {
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const BibleScreen()));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}

