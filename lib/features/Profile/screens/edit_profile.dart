import 'dart:io';
import 'package:bible_journey/core/services/api_service.dart';
import 'package:bible_journey/features/Profile/screens/profile_details.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/custom_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectedIndex = 3;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final dobController = TextEditingController();

  File? selectedImage;

  @override
  void initState() {
    super.initState();

    /// 💡 এখানে তুমি initial data load করবে API / Local storage থেকে
    /// এখন demo data বসিয়ে দিলাম—তুমি পরে API response দিয়ে fill করবে
    // nameController.text = "Anik";
    // emailController.text = "anik@gmail.com";
    // phoneController.text = "01700000000";
    // genderController.text = "Male";
    // dobController.text = "1998-10-12";
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void onUpdatePressed() async {
    final success = await ApiServices.updateProfile(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      gender: genderController.text,
      dateOfBirth: dobController.text,
    );

    if (success) {
      print("Profile Updated Successfully");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfileDetails()),
      );
    } else {
      print("Failed to update");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: Text("profile_details".tr()),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Profile header
              Container(
                height: 173,
                width: 380,
                decoration: BoxDecoration(
                  color: const Color(0xffE3E9E3),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/User.png',
                        width: 78,
                        height: 78,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      nameController.text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff83BF8B),
                      ),
                    ),
                    const Text(
                      'Premium User',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffABABAB),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              CustomProfile(title: "name".tr(), controller: nameController, box: ""),
              CustomProfile(title: "your_email".tr(), controller: emailController, box: ""),
              CustomProfile(title: "date_of_birth".tr(), controller: dobController, box: ""),
              CustomProfile(title: "phone".tr(), controller: phoneController, box: ""),
              CustomProfile(title: "gender".tr(), controller: genderController, box: ""),

              const SizedBox(height: 20),

              CustomButton(
                text: "update".tr(),
                onTap: onUpdatePressed,
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
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
