import 'package:flutter/material.dart';

class CustomMinibox extends StatelessWidget {
  final int number;
  final VoidCallback onTap;

  const CustomMinibox({
    super.key,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 23,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff629E6A),
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          "$number",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
