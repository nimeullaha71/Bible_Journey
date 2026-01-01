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
import 'package:image_picker/image_picker.dart';
import '../../../widgets/custom_nav_bar.dart';

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

  Map<String, dynamic>? userData;
  bool isLoading = true;

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final data = await ApiServices.getProfile();

    setState(() {
      userData = data;
      nameController.text = data?["name"] ?? "";
      emailController.text = data?["email"] ?? "";
      phoneController.text = data?["phone"] ?? "";
      genderController.text = data?["gender"] ?? "";
      dobController.text = data?["date_of_birth"] ?? "";
      isLoading = false;
    });
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  void onUpdatePressed() async {
    final success = await ApiServices.updateProfile(
      name: nameController.text,
      phone: phoneController.text,
      gender: genderController.text,
      dateOfBirth: dobController.text,
      avatar: selectedImage,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ProfileDetails()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile update failed")),
      );
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /// HEADER
              // Container(
              //   height: 173,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: const Color(0xffE3E9E3),
              //     borderRadius: BorderRadius.circular(11),
              //   ),
              //   child: Column(
              //     children: [
              //       const SizedBox(height: 15),
              //       /// IMAGE + ICON
              //       Stack(
              //         children: [
              //           ClipOval(
              //             child: selectedImage != null
              //                 ? Image.file(
              //               selectedImage!,
              //               width: 78,
              //               height: 78,
              //               fit: BoxFit.cover,
              //             )
              //                 : (userData?["avatar"] != null &&
              //                 userData!["avatar"]
              //                     .toString()
              //                     .isNotEmpty)
              //                 ? Image.network(
              //               userData!["avatar"],
              //               width: 78,
              //               height: 78,
              //               fit: BoxFit.cover,
              //             )
              //                 : Image.asset(
              //               'assets/images/User.png',
              //               width: 78,
              //               height: 78,
              //             ),
              //           ),
              //           Positioned(
              //             bottom: 0,
              //             right: 0,
              //             child: GestureDetector(
              //               onTap: pickImage,
              //               child: Container(
              //                 padding: const EdgeInsets.all(6),
              //                 decoration: const BoxDecoration(
              //                   color: Colors.green,
              //                   shape: BoxShape.circle,
              //                 ),
              //                 child: const Icon(
              //                   Icons.camera_alt,
              //                   size: 16,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 8),
              //       /// USER NAME
              //       Text(
              //         nameController.text,
              //         style: const TextStyle(
              //           fontSize: 18,
              //           fontWeight: FontWeight.bold,
              //           color: Color(0xff83BF8B),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 60),

              /// NAME FIELD
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              /// EMAIL FIELD (READ ONLY)
              TextField(
                controller: emailController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              /// DOB FIELD WITH CALENDAR PICKER
              GestureDetector(
                onTap: () async {
                  DateTime initialDate = DateTime.now();
                  if (dobController.text.isNotEmpty) {
                    initialDate =
                        DateTime.tryParse(dobController.text) ??
                            DateTime.now();
                  }

                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                      "${pickedDate.year.toString().padLeft(4, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
                    });
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              /// PHONE FIELD
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              /// GENDER DROPDOWN
              InputDecorator(
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: genderController.text.isNotEmpty
                        ? genderController.text
                        : null,
                    hint: const Text("Select Gender"),
                    items: const [
                      DropdownMenuItem(
                          value: "male", child: Text("Male")),
                      DropdownMenuItem(
                          value: "female", child: Text("Female")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        genderController.text = value ?? "";
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomButton(
                text: "update".tr(),
                onTap: onUpdatePressed,
              ),
            ],
          ),
        ),
      ),

      /// BOTTOM NAV
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
