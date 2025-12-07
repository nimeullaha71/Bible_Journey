import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CustomForm({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool isUnlocked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isUnlocked = true;
        });
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffE5EDE8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  isUnlocked = true;
                });
                widget.onTap();
              },
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    )
                  ],
                ),
                child: Icon(
                  isUnlocked ? Icons.check : Icons.lock,
                  size: 16,
                  color: isUnlocked ? Colors.green : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
