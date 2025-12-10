import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLanguage extends StatelessWidget {
  final String svgAssetPath;
  final String title;
  final VoidCallback onTap;
  final bool isSelected; // new

  const CustomLanguage({
    super.key,
    required this.svgAssetPath,
    required this.title,
    required this.onTap,
    this.isSelected = false, // default false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xffE3E9E3),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(svgAssetPath, width: 30, height: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 23,
              height: 23,
              decoration: BoxDecoration(
                color: Color(0xffE3E9E3),
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? Colors.green : Colors.black),
              ),
              child: isSelected
                  ? Align(
                alignment: Alignment.center,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

