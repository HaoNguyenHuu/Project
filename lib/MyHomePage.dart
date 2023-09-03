// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          WelcomeBar(user: "john",),
          DateBar(),
          DailyMed()
        ],
      ),
    );
  }
}

class DailyMed extends StatelessWidget{
  const DailyMed({
    super.key,
  });

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
            color: Colors.grey,
            width: MediaQuery.of(context).size.width,
            height: 350,
            child:
              ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.all(5.0),
                        child: MedTimeTable(),
                    );
                  })
            ),
        ],
      ),
    );
  }
}

class MedTimeTable extends StatelessWidget {
  const MedTimeTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          width: 50,
          child: Column(
            children: [
              Text('test')
            ],
          ),
        ),
        SizedBox(width: 10,),
        Container(
          color: Colors.red,
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          width: 500,
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(5.0),
                  child: Container(
                    color: Colors.purple,
                    child: Text('data'),
                  )
                );
              }
          ),
        )
      ],
    );
  }
}

class WelcomeBar extends StatelessWidget {
  const WelcomeBar({
    super.key,
    required this.user
  });

  final String user;

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width - 50;

    return Container(
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
          Notifications()
        ],
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  get pressed => null;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      child: Image.asset(
          'lib/res/Notification.png',
      scale: 1,),
    );
  }
}

class DateBar extends StatelessWidget {
  const DateBar({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,index) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: DateDisplay(time: DateTime(2023),),
            );
          }
      ),
    );
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay({
    super.key,
    required this.time
  });
  
  final DateTime time;

  doSth() => null;

  @override
  Widget build(BuildContext context) {
    var Month = time.month;
    var Day = time.day;
    return Container(
      width: 100,
      height: 100,
      child: ElevatedButton(
          onPressed: doSth(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$Day',style: TextStyle(color: Colors.black),),
              Text('th$Month', style: TextStyle(color: Colors.black),)
            ],
          )
      ),
    );
  }
}