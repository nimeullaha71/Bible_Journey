import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        height: 100,
        width: 100,
        "https://biblejourney.pro/cdn/shop/files/Bible_Journey_-_Square_Logo_-_Copy.png?height=77&v=1764301938",
        fit: BoxFit.contain,
      ),
    );
  }
}
