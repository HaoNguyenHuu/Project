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
      home: test(),
    );
  }
}

class test extends StatelessWidget{
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: 360,
        height: 360,
        padding: EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: 100,
            itemBuilder: (context,index){
              return Container(
                color: Colors.red,
                padding: EdgeInsets.all(2.0),
                height: 100,
                width: 150,
                child: Text('hello $index',style: TextStyle(fontSize: 30),),
              );
            }
        ),
      ),
    );
  }
}