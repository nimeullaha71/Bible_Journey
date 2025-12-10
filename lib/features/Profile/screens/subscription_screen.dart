import 'package:bible_journey/features/Profile/screens/payment_screen.dart';
import 'package:bible_journey/features/Profile/screens/profile_screen.dart';
import 'package:bible_journey/features/bible/screens/bible_screen.dart';
import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_nav_bar.dart';
import '../../payment/payment_screen.dart';
import '../widgets/custom_premium.dart';
import '../widgets/custom_premium1.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5F2),
        title: const Text("Go Premium"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  "Unlock Your Full Journey",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Gain access to our complete library of guided \nplans, studies, and an ad-free experience.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),

                CustomPremium(
                    icon: Icons.explore,
                    title: "Access All Journeys",
                    subtitle: "Explore our full library of devotional journeys."),
                const SizedBox(height: 5),

                CustomPremium(
                    icon: Icons.book,
                    title: "Guided Bible Studies",
                    subtitle: "Unlimited access to all study plans."),
                const SizedBox(height: 5),

                CustomPremium(
                    icon: Icons.eleven_mp,
                    title: "Ad-Free Experience",
                    subtitle: "Enjoy uninterrupted time for reflection."),
                const SizedBox(height: 5),

                CustomPremium(
                    icon: Icons.menu_book,
                    title: "Daily Devotion",
                    subtitle: "Download content for your quiet time."),
                const SizedBox(height: 10),

                CustomPremium1(
                    title: "Yearly Premium",
                    subtitle: "\$39.99/year (equals \$3.33/month)",
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                    },
                ),

                CustomPremium1(
                    title: "Monthly Premium",
                    subtitle: "\$5.99/month",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(text: "Start 7-Day Free Trial", onTap: (){
                  //Navigator.push(
                      //context, MaterialPageRoute(builder: (_) => const PaymentPage()));
                }),

                const SizedBox(height: 4),
                Text(
                  "Restore Purchase",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "A 7-day free trial is available for the annual plan. Your subscription will \nautomatically renew unless cancelled at least 24 hours before the end of the trial \nperiod. You can manage your subscription in \nyour App Store settings.",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),

              ],
            ),
          ),
        ),
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
