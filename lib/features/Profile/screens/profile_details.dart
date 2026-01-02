// import 'package:bible_journey/core/services/api_service.dart';
// import 'package:bible_journey/features/Profile/screens/edit_profile.dart';
// import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
// import 'package:bible_journey/features/bible/screens/bible_screen.dart';
// import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
// import 'package:bible_journey/main_bottom_nav_screen.dart';
// import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
// import 'package:bible_journey/widgets/buttons/custom_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import '../../../widgets/custom_nav_bar.dart';
// import '../widgets/custom_personal.dart';
//
// class ProfileDetails extends StatefulWidget {
//   const ProfileDetails({super.key});
//
//   @override
//   State<ProfileDetails> createState() => _ProfileDetailsState();
// }
//
// class _ProfileDetailsState extends State<ProfileDetails> {
//   int _selectedIndex = 3;
//
//   Map<String, dynamic>? userData;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     loadProfile();
//   }
//
//   Future<void> loadProfile() async {
//     final data = await ApiServices.getProfile();
//     setState(() {
//       userData = data;
//       isLoading = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF8F5F2),
//       appBar: CustomAppBar(title: "profile_details".tr(), onTap: (){
//         Navigator.pop(context);
//       }),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 23),
//                 margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
//                 height: 173,
//                 width: 380,
//                 // decoration: BoxDecoration(
//                 //   color: const Color(0xffE3E9E3),
//                 //   borderRadius: BorderRadius.circular(11),
//                 // ),
//                 // child: Stack(
//                 //   children: [
//                 //     // Column(
//                 //     //   mainAxisAlignment: MainAxisAlignment.start,
//                 //     //   crossAxisAlignment: CrossAxisAlignment.center,
//                 //     //   children: [
//                 //     //     const SizedBox(height: 15),
//                 //     //     Center(
//                 //     //       child: ClipOval(
//                 //     //         child: isLoading ? const SizedBox(
//                 //     //           width: 78,
//                 //     //           height: 78,
//                 //     //           child: CircularProgressIndicator(),
//                 //     //         ): Image.network(userData?["avatar"] ?? "",
//                 //     //         width: 78,
//                 //     //           height: 78,
//                 //     //           fit: BoxFit.cover,
//                 //     //           errorBuilder: (context,error,stackTrace){
//                 //     //           return Image.asset('assets/images/User.png',width: 78,height: 78,fit: BoxFit.cover,);
//                 //     //           },
//                 //     //         ),
//                 //     //       ),
//                 //     //     ),
//                 //     //     const SizedBox(height: 1),
//                 //     //     isLoading
//                 //     //         ? const Center(child: CircularProgressIndicator())
//                 //     //         : Column(
//                 //     //             children: [
//                 //     //               Text(
//                 //     //                 userData?["name"] ?? "No Name",
//                 //     //                 style: const TextStyle(
//                 //     //                   fontSize: 18,
//                 //     //                   fontWeight: FontWeight.bold,
//                 //     //                   color: Color(0xff83BF8B),
//                 //     //                 ),
//                 //     //               ),
//                 //     //               Text(
//                 //     //                 userData?["role"] ?? "User",
//                 //     //                 style: const TextStyle(
//                 //     //                   fontSize: 14,
//                 //     //                   color: Color(0xffABABAB),
//                 //     //                 ),
//                 //     //               ),
//                 //     //             ],
//                 //     //           ),
//                 //     //   ],
//                 //     // ),
//                 //   ],
//                 // ),
//               ),
//               SizedBox(height: 25),
//
//               CustomPersonal(
//                 textIcon: Icons.person,
//                 text: "FULL NAME",
//                 subText: userData?["name"] ?? "",
//               ),
//               SizedBox(height: 16,),
//
//               CustomPersonal(
//                 textIcon: Icons.email,
//                 text: "YOUR EMAIL",
//                 subText: userData?["email"] ?? "",
//               ),
//               SizedBox(height: 16),
//
//               CustomPersonal(
//                 textIcon: Icons.date_range,
//                 text: "DATE OF BIRTH",
//                 subText: userData?["date_of_birth"]??"",
//               ),
//
//               SizedBox(height: 16),
//               CustomPersonal(
//                 textIcon: Icons.phone,
//                 text: "PHONE",
//                 subText: userData?["phone"] ?? "",
//               ),
//               SizedBox(height: 16,),
//
//               CustomPersonal(
//                 textIcon: Icons.accessibility,
//                 text: "GENDER",
//                 subText: userData?["gender"] ?? "",
//               ),
//
//               SizedBox(height: 100),
//               CustomButton(
//                 text: "Edit",
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => EditProfileScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       bottomNavigationBar: CustomNavbar(
//         currentIndex: _selectedIndex,
//         onItemPressed: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//
//           switch (index) {
//             case 0:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const MainBottomNavScreen()),
//               );
//               break;
//             case 1:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const BibleScreen()),
//               );
//               break;
//             case 2:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const JourneyScreen()),
//               );
//               break;
//             case 3:
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ProfileScreen()),
//               );
//               break;
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:bible_journey/core/services/api_service.dart';
import 'package:bible_journey/features/Profile/screens/edit_profile.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/custom_personal.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int _selectedIndex = 3;
  Map<String, dynamic>? userData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final data = await ApiServices.getProfile();
    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // for responsiveness
    final padding = size.width * 0.05; // 5% padding from sides

    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: CustomAppBar(
        title: "profile_details".tr(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional: Title Section
              // Center(
              //   child: Text(
              //     userData?["name"] ?? "",
              //     style: TextStyle(
              //       fontSize: size.width * 0.06, // responsive font
              //       fontWeight: FontWeight.bold,
              //       color: const Color(0xff83BF8B),
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              const SizedBox(height: 60),

              // Personal info
              CustomPersonal(
                textIcon: Icons.person,
                text: "FULL NAME",
                subText: userData?["name"] ?? "",
              ),
              const SizedBox(height: 16),

              CustomPersonal(
                textIcon: Icons.email,
                text: "YOUR EMAIL",
                subText: userData?["email"] ?? "",
              ),
              const SizedBox(height: 16),

              CustomPersonal(
                textIcon: Icons.date_range,
                text: "DATE OF BIRTH",
                subText: userData?["date_of_birth"] ?? "",
              ),
              const SizedBox(height: 16),

              CustomPersonal(
                textIcon: Icons.phone,
                text: "PHONE",
                subText: userData?["phone"] ?? "",
              ),
              const SizedBox(height: 16),

              CustomPersonal(
                textIcon: Icons.accessibility,
                text: "GENDER",
                subText: userData?["gender"] ?? "",
              ),
              const SizedBox(height: 80),

              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Edit",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomNavbar(
      //   currentIndex: _selectedIndex,
      //   onItemPressed: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //
      //     switch (index) {
      //       case 0:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => const MainBottomNavScreen()),
      //         );
      //         break;
      //       case 1:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => const BibleScreen()),
      //         );
      //         break;
      //       case 2:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => const JourneyScreen()),
      //         );
      //         break;
      //       case 3:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (_) => const ProfileScreen()),
      //         );
      //         break;
      //     }
      //   },
      // ),
    );
  }
}
