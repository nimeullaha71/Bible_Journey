import 'package:flutter/material.dart';

class CustomPassword extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const CustomPassword({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
  });

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),

          /// TextField Container
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,               // White background
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xffBFBFBF),
                width: 1,
              ),
            ),

            child: Row(
              children: [
                /// Actual TextField
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(fontSize: 15),
                  ),
                ),

                /// Eye Icon Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  child: Icon(
                    _passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
