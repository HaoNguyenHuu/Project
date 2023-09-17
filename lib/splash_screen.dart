import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Add your logo or branding elements here
        child: Image(
          image: AssetImage('lib/res/logo.png'),
        ),
      ),
    );
  }
}

