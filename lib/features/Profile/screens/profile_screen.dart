import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/Profile/screens/change_password_screen.dart';
import 'package:bible_journey/features/Profile/screens/deactivated_pop_up.dart';
import 'package:bible_journey/features/Profile/screens/help_support_screen.dart';
import 'package:bible_journey/features/Profile/screens/language_screen.dart';
import 'package:bible_journey/features/Profile/screens/privacy_policy_screen.dart';
import 'package:bible_journey/features/Profile/screens/profile_details.dart';
import 'package:bible_journey/features/Profile/screens/subscription_screen.dart';
import 'package:bible_journey/features/Profile/screens/terms_service_screen.dart';
import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "Profile", onTap: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainBottomNavScreen()), (predicate)=>false);
      }),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                height: 145,
                decoration: BoxDecoration(
                  color: const Color(0xffFCFAF9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color(0xffDAD6D6),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 5),
                            CustomText(
                                textIconPath: 'assets/images/User.svg',
                                text: "Profile Details",
                                trailingIcon: Icons.arrow_forward_ios,
                                onTap: (){
                                  Navigator.push(
                                     context, MaterialPageRoute(builder: (_) => const ProfileDetails()));
                                }),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: const Text(
                                "Username, Email ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            const SizedBox(height: 5),

                            CustomText(
                                textIconPath: 'assets/images/HandCoins.svg',
                                text: "Subscription",
                                trailingIcon: Icons.arrow_forward_ios,
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => const SubscriptionScreen()));
                                }),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: const Text(
                                "Manage Subscription",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account Settings",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xffFCFAF9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color(0xffDAD6D6),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    CustomText(
                        textIconPath: 'assets/images/Globe.svg',
                        text: "Change Language",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                         Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const LanguageScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/Bell.svg',
                        text: "Notifications",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          //Navigator.push(
                              //context, MaterialPageRoute(builder: (_) => const NotificationScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/LockOpen.svg',
                        text: "Change Password",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(
                             context, MaterialPageRoute(builder: (_) => const ChangePasswordScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/ShieldSlash.svg',
                        text: "Disabled Account",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          showDeactivatePopup(context, onConfirm: (){
                            print("Deactivated your account");
                          });
                        },
                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Support & Legal",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xffFCFAF9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color(0xffDAD6D6),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/Headset.svg',
                        text:  "Help & Support",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpSupportScreen()));
                        },
                    ),

                    const SizedBox(height: 10),

                    CustomText(
                        text: "Terms of Service",
                        textIconPath: 'assets/images/FileLock.svg',
                        trailingIcon:  Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const TermsServiceScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                      textIconPath: 'assets/images/Warning.svg',
                      text: "Privacy Policy ",
                      trailingIcon:  Icons.arrow_forward_ios,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));
                      },
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffFCFAF9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Color(0xffDAD6D6),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Color(0xff83BF8B),
                              size: 20,
                            ),

                            const SizedBox(width: 10),

                            const Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 13),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff83BF8B),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}