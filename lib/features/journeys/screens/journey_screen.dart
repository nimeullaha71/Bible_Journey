import 'package:bible_journey/app/constants.dart';
import 'package:bible_journey/features/home/widgets/home_box.dart';
import 'package:bible_journey/features/journeys/screens/journey_detail_screen.dart';
import 'package:bible_journey/main_bottom_nav_screen.dart';
import 'package:bible_journey/widgets/appbars/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class JourneyScreen extends StatefulWidget {
  const JourneyScreen({super.key});

  @override
  State<JourneyScreen> createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(title: "life_area_journey".tr(), onTap: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainBottomNavScreen()), (predicate)=>false);
      }),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Find guidance and wisdom for every season of life."),
              SizedBox(height: 8,),

              Column(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (3).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),
                        title: "Happiness & Joy",
                        subtitle: "Discovering true contentment",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>JourneyDetailScreen()));
                        },
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (1).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),
                        title: "Parenting",
                        subtitle: "Parenting Raising a family in faith",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (4).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Happiness & Joy",
                        subtitle: "Discovering true contentment",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (2).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Friendship",
                        subtitle: "Building godly relationships",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (3).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Work & Career",
                        subtitle: "Navigating your Friendship",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (1).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Community",
                        subtitle: "Connecting with professional life believers",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (4).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Overcoming Anxiety",
                        subtitle: "Finding peace in His presence",
                        onTap: () {},
                      ),
                      HomeBox(
                        icon: SvgPicture.asset(
                          "assets/images/Vector (2).svg",
                          width: 28,
                          height: 28,
                          color: Colors.green,
                        ),                        title: "Finding Purpose",
                        subtitle: "Living a life of meaning.",
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
