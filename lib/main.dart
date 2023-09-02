import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:project/MyHomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<medDay> list = [];

    return ChangeNotifierProvider(
      create: (context) => MyAppState('john',list),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();          //this has no use, you can delete it
  String user;
  List<medDay> list;
  DateTime selectedDate = DateTime.now();

  MyAppState(this.user,this.list);

  getDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}

class medDay{
  DateTime date;
  var list = List<medicine>;

  medDay(this.date,this.list);
}

class medicine{
  DateTime time;
  String name;
  bool taken;

  medicine(this.time,this.name,this.taken);

  void takeIt() {
    if (taken == false) taken = true;
  }
}