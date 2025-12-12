import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_form.dart';
import 'daily_journey_screen.dart';

class JourneyDetailScreen extends StatefulWidget {
  const JourneyDetailScreen({super.key});

  @override
  State<JourneyDetailScreen> createState() => _JourneyDetailScreenState();
}

class _JourneyDetailScreenState extends State<JourneyDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: CustomAppBar(title: "journey_details".tr(), onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>JourneyScreen()));
      }),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 378,
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff83BF8B),
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/tree.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Faith and Perseverance",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "A short, inspiring introduction  to the Journey’s purpose \nand what the user will learn about nurturing their \nsacred bond through spiritual focus",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "7- Day Devotional series",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 4),

            CustomForm(title: "Day 1:   Before the Beginning, God", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 2: Do I Know Jesus?", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 3:  Made to Reflect Him", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 4: The Gospel: Grace vs Works", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 5: Prayer: Talking With God", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 6: Faith in the Face of Doubt", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
            CustomForm(title: "Day 7: Faith in Action", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DailyJourneyScreen(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
