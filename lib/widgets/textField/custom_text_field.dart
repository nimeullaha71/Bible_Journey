import 'package:bible_journey/app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomTextField({super.key,required this.hint,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 60,
      decoration: BoxDecoration(
        color:  AppColors.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
