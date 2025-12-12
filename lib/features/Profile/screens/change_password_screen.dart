import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/custom_password.dart';  // New improved widget

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int _selectedIndex = 3;

  // Text Controllers
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: CustomAppBar(title: "password_change".tr(), onTap: (){
        Navigator.pop(context);
      }),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              // Old Password
              CustomPassword(
                label: "enter_old_password".tr(),
                hintText: "old_password".tr(),
                controller: oldPasswordController,
              ),

              // New Password
              CustomPassword(
                label: "enter_new_password".tr(),
                hintText: "new_password".tr(),
                controller: newPasswordController,
              ),

              // Confirm Password
              CustomPassword(
                label: "re_enter_new_password".tr(),
                hintText: "confirm_new_password".tr(),
                controller: confirmPasswordController,
              ),

              const SizedBox(height: 180),

              CustomButton(
                text: "done".tr(),
                onTap: () {
                  /// TODO: Add validation
                  print("Old: ${oldPasswordController.text}");
                  print("New: ${newPasswordController.text}");
                  print("Confirm: ${confirmPasswordController.text}");
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() => _selectedIndex = index);

          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
              break;
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BibleScreen()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const JourneyScreen()));
              break;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}
