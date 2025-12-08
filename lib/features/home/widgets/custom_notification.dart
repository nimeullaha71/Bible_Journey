import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNotification extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String timeAgo;

  const CustomNotification({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: SvgPicture.asset(
              image,
              width: 36,
              height: 36,
            ),
          ),
          SizedBox(width: 11),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff787878),
                ),
              ),
            ],
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: Text(
              timeAgo,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff787878),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
