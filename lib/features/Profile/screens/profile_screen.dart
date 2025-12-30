import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/core/services/auth_service.dart';
import 'package:bible_journey/features/Profile/screens/change_password_screen.dart';
import 'package:bible_journey/features/Profile/screens/deactivated_pop_up.dart';
import 'package:bible_journey/features/Profile/screens/help_support_screen.dart';
import 'package:bible_journey/features/Profile/screens/language_screen.dart';
import 'package:bible_journey/features/Profile/screens/money_back_policy_screen.dart';
import 'package:bible_journey/features/Profile/screens/privacy_policy_screen.dart';
import 'package:bible_journey/features/Profile/screens/profile_details.dart';
import 'package:bible_journey/features/Profile/screens/subscription_terms_screen.dart';
import 'package:bible_journey/features/Profile/screens/terms_service_screen.dart';
import 'package:bible_journey/features/auth/screens/login_screen.dart';
import 'package:bible_journey/features/auth/screens/trial_expired_payment_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/services/local_storage_service.dart';
import '../services/deactivated_service.dart';
import '../widgets/custom_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
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
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "account".tr(),
                    style: TextStyle(
                      fontSize: 18,
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
                                text: "profile_details".tr(),
                                trailingIcon: Icons.arrow_forward_ios,
                                onTap: (){
                                  Navigator.push(
                                     context, MaterialPageRoute(builder: (_) => const ProfileDetails()));
                                }),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child:  Text(
                                "username_email".tr(),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            const SizedBox(height: 5),

                            CustomText(
                                textIconPath: 'assets/images/HandCoins.svg',
                                text: "subscription".tr(),
                                trailingIcon: Icons.arrow_forward_ios,
                                onTap: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => const TrialExpiredPaymentScreen()));
                                }),

                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child:  Text(
                                "manage_subscription".tr(),
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
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "account_settings".tr(),
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
                height: 150,
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
                        text: "change_language".tr(),
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                         Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const LanguageScreen()));
                        }),

                    const SizedBox(height: 10),

                    // CustomText(
                    //     textIconPath: 'assets/images/Bell.svg',
                    //     text: "notifications".tr(),
                    //     trailingIcon: Icons.arrow_forward_ios,
                    //     onTap: (){
                    //       //Navigator.push(
                    //           //context, MaterialPageRoute(builder: (_) => const NotificationScreen()));
                    //     }),

                    // const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/LockOpen.svg',
                        text: "change_password".tr(),
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(
                             context, MaterialPageRoute(builder: (_) => const ChangePasswordScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                        textIconPath: 'assets/images/ShieldSlash.svg',
                        text: "disabled_account".tr(),
                        trailingIcon: Icons.arrow_forward_ios,
                      onTap: () {
                        showDeactivatePopup(
                          context,
                          onConfirm: () async {

                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => const Center(child: CircularProgressIndicator()),
                            );

                            final success = await DeactivateAccountService.deactivateAccount();

                            Navigator.pop(context);
                            if (success) {
                              await LocalStorage.clearAll();

                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Account deactivation failed"),
                                ),
                              );
                            }
                          },
                        );
                      },

                    ),
                    const SizedBox(height: 10),

                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child:  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "support_legal".tr(),
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
                        textIconPath: 'assets/images/money_back.svg',
                        //text:  "help_support".tr(),
                      text: "Money Back Policy",
                        trailingIcon: Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MoneyBackPolicyScreen()));
                        },
                    ),

                    const SizedBox(height: 10),

                    CustomText(
                        text: "terms_of_service".tr(),
                        textIconPath: 'assets/images/FileLock.svg',
                        trailingIcon:  Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const TermsAndConditionsOfUseScreen()));
                        }),

                    const SizedBox(height: 10),
                    CustomText(
                        //text: "terms_of_service".tr(),
                      text: "Subscription Terms ",
                        textIconPath: 'assets/images/subscription.svg',
                        trailingIcon:  Icons.arrow_forward_ios,
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (_) => const SubscriptionTermsScreen()));
                        }),

                    const SizedBox(height: 10),

                    CustomText(
                      textIconPath: 'assets/images/Warning.svg',
                      text: "privacy_policy".tr(),
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
                        onTap: () async {
                          try {
                            final email = await LocalStorage.getEmail(); // এখানে login_id / email পাবে
                            final token = await LocalStorage.getToken();

                            if (email != null && token != null) {
                              await AuthService().logOut(email: email); // email ঠিকভাবে পাঠাচ্ছে
                              await LocalStorage.clearAll();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => LoginScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('User not logged in')),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Logout failed: $e')),
                            );
                          }
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Color(0xff83BF8B),
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "logout".tr(),
                              style: TextStyle(fontSize: 14),
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