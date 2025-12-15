import 'package:bible_journey/features/journeys/screens/journey_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../models/daily_journey_details_model.dart';
import '../services/daily_journey_details_api.dart';
import '../widgets/custom_form.dart';
import 'daily_journey_details1_screen.dart';

class JourneyDetailScreen extends StatefulWidget {
  final int journeyId; // journeyId pass করা হবে

  const JourneyDetailScreen({super.key, required this.journeyId});

  @override
  State<JourneyDetailScreen> createState() => _JourneyDetailScreenState();
}

class _JourneyDetailScreenState extends State<JourneyDetailScreen> {
  late Future<DailyJourneyResponse> dailyJourneyFuture;

  @override
  void initState() {
    super.initState();
    dailyJourneyFuture = DailyJourneyApi.getDailyJourney(widget.journeyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),
      appBar: CustomAppBar(
        title: "journey_details".tr(),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const JourneyScreen()));
        },
      ),
      body: FutureBuilder<DailyJourneyResponse>(
        future: dailyJourneyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Text("Something went wrong: ${snapshot.error}"));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                // Banner Image
                Container(
                  width: double.infinity,
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

                //Journey Info
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         data.journey.name,
                //         style: const TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //       const SizedBox(height: 4),
                //       Text(
                //         "${data.days.length}-Day Devotional series",
                //         style: const TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.black,
                //         ),
                //       ),
                //       const SizedBox(height: 16),
                //     ],
                //   ),
                // ),
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

                // Dynamic Days List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: data.days.map((day) {
                      return CustomForm(
                        title: "Day ${day.dayOrder}: ${day.dayName}",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => JourneyDetails1(
                                journeyId: data.journey.id,
                                dayId: day.dayId,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
