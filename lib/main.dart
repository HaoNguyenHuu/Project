import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith( dragDevices: {PointerDeviceKind.mouse}),
      home: MyHomePage(),
    );
  }
}
