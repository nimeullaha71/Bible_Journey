import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final String title;
  final String box;

  const CustomProfile({
    super.key,
    required this.title,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child:   Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.only(left: 18, right: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffDAD6D6)),
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: box,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
