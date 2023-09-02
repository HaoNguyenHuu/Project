// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var myAppState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          WelcomeBar(appState: myAppState),
          Date(appState: myAppState,),
          DailyMed(appState: myAppState),
        ],
      ),
    );
  }
}

class DailyMed extends StatelessWidget{
  const DailyMed({
    super.key,
    required this.appState
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    int x = 5;

    return Container(
      color: Colors.blueAccent,
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      height: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Daily Medication',textScaleFactor: 2, style: TextStyle(color: Colors.black),),
          Text('You have missed $x pills today'),
          Container(
            width: 450,
            height: 350,
            child: Row(
              children:[
                Container(width: 100,child: TimeColumn()),
                Container(width: 350,child: MedicationsColumn()),
              ]
            ),
          )
        ],
      ),
    );
  }
}

class MedicationsColumn extends StatelessWidget {
  const MedicationsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    var user = appState.user.toString();
    var width = MediaQuery.of(context).size.width - 50;

    return Container(
      color: Colors.green,
      width: width > 500? width : 500,
      padding: const EdgeInsets.only(left: 9,right: 9,top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello, $user',textScaleFactor: 2,),
              Text('Have a nice day')
            ],
          ),
          Notifications(),
        ],
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: pressed(),clipBehavior: Clip.antiAlias, child: Image.asset('lib/res/Notification.png'),);
  }

  pressed() {

  }
}

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.appState
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 50;

    return Align(
      alignment: Alignment.center,
      widthFactor: 24,
      child: Container(
        color: Colors.grey,
        height: 100,
        width: width > 500? width : 500,
        padding: EdgeInsets.all(9),
        child: DayBar(appState: appState,),
      )
    );
  }
}

class DayBar extends StatelessWidget {
  const DayBar({
    super.key,
    required this.appState
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now().subtract(const Duration(days: 15));
    int timespan = 30;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (int i = 0; i < timespan; i++)
          DateDisplay(time: time.add(Duration(days: i)),appState: appState),
      ],
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    super.key,
    required this.time,
    required this.appState
  });
  
  final DateTime time;
  final MyAppState appState;

  dosth(){
    appState.getDate(time);
  }

  @override
  Widget build(BuildContext context) {
    var Month = time.month;
    var Day = time.day;
    return ClipRect(
      child: ElevatedButton(
          onPressed: dosth(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$Day',style: TextStyle(color: Colors.black),textScaleFactor: 2.2,),
              Text('th$Month', style: TextStyle(color: Colors.black),)
            ],
          )
      ),
    );
  }
}