import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/Medicine_Info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      scrollBehavior: MaterialScrollBehavior().copyWith( dragDevices: {PointerDeviceKind.mouse}),
      home: MedicineInfo(),
    );
  }
}