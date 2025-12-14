import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const HomeBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),

        /// This prevents overflow
        child: Column(
          mainAxisSize: MainAxisSize.min,  // 🔥 Fix #1
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,                           // Already has fixed width/height

            SizedBox(height: width * 0.03),

            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,                  // 🔥 Fix #2
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: width * 0.015),

            Flexible(                       // 🔥 Fix #3
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: width * 0.032,
                  color: Colors.grey.shade600,
                ),
                maxLines: 3,                // Prevent overflow
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
