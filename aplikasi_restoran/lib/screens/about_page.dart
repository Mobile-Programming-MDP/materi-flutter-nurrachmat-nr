import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Aplikasi Restoran\n\nDemo sederhana untuk menggunakan named routes dan BottomNavigationBar.\n\nDeveloper: Pak Jr',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
