import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../widgets/custom_nav_bar.dart';
import '../widgets/custom_password.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: const Text("Password Change"),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        // Disables the default back button
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                CustomPassword(title: "Enter Your Old Password", onTap: (){}),

                CustomPassword(title: "Enter a New Password", onTap: (){}),

                CustomPassword(title: "Re-enter Your New Password", onTap: (){}),

                const SizedBox(height: 200),

                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomButton(
                    text: "Done",
                    onTap: () {},
                  ),
                )

              ]
          )
      ),


      bottomNavigationBar: CustomNavbar(
        currentIndex: _selectedIndex,
        onItemPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const MainBottomNavScreen()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const BibleScreen()));
              break;
            case 2:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const JourneyScreen()));
              break;
            case 3:
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
              break;
          }
        },
      ),
    );
  }
}
