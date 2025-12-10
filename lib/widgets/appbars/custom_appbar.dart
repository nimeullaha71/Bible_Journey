import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onTap;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,

      leading: GestureDetector(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
