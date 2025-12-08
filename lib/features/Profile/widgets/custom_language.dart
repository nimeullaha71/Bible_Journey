import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLanguage extends StatefulWidget {
  final String svgAssetPath;
  final String title;
  final VoidCallback onTap;

  const CustomLanguage({
    super.key,
    required this.svgAssetPath,
    required this.title,
    required this.onTap,
  });

  @override
  CustomLanguageState createState() => CustomLanguageState();
}

class CustomLanguageState extends State<CustomLanguage> {
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                widget.svgAssetPath,
                fit: BoxFit.scaleDown,
                width: 39,
                height: 39,
              ),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 7),
              child: Container(
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                  color: Color(0xffE3E9E3),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.black,
                  ),
                ),
                child: isSelected
                    ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
