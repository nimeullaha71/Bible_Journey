import 'package:flutter/material.dart';

class CustomPassword extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CustomPassword({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  CustomPasswordState createState() => CustomPasswordState();
}

class CustomPasswordState extends State<CustomPassword> {
  bool _isPasswordVisible = false;
  bool _isTextVisible = false;


  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
      _isTextVisible = !_isTextVisible;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Container(
        height: 100,
        width: 381,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 1, bottom: 1),
        margin: const EdgeInsets.only(left: 13, right: 13, top: 1, bottom: 1),
        decoration: BoxDecoration(
          color: const Color(0xffF8F5F2),
          borderRadius: BorderRadius.circular(14),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),

            Container(
              height: 56,
              width:381 ,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: !_isPasswordVisible,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
