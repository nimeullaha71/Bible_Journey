import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? backgroundColor; // ✅ ADD

  const HomeBox({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor, // ✅ OPTIONAL COLOR
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,  // ✅ DEFAULT WHITE
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green, size: 24),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
