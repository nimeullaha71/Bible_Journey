import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/home/widgets/home_box.dart';
import 'package:bible_journey/features/journeys/screens/journey_detail_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../models/journey_model.dart';
import '../services/journey_api.dart';


class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  late Future<List<Journey>> journeyFuture;

  @override
  void initState() {
    super.initState();
    journeyFuture = JourneyApi.getJourneys();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        title: "life_area_journey".tr(),
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => MainBottomNavScreen()),
                (_) => false,
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<List<Journey>>(
            future: journeyFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }

              final journeys = snapshot.data!;

              return GridView.builder(
                itemCount: journeys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final journey = journeys[index];

                  return HomeBox(
                    icon: Icon(
                      Icons.explore,
                      size: 28,
                      color: journey.status == "current"
                          ? Colors.green
                          : Colors.grey,
                    ),
                    title: journey.name,
                    subtitle: "Completed days: ${journey.completedDays}",
                    onTap: journey.status == "locked"
                        ? null
                        : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JourneyDetailScreen(
                            journeyId: journey.id,
                          ),
                        ),
                      );
                    },
                  );
                },
              );

            },
          ),
        ),
      ),
    );
  }
}

