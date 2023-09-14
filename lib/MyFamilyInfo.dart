// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'MyInfo.dart';

class MyFamilyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
            'Personal information'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.green,
                child: Icon(
                  Icons.icecream,
                  size: 150,
                ),
              ),
            ),
            SizedBox(height: 18,),
            Name(),
            SizedBox(height: 10,),
            FamilyName(),
            SizedBox(height: 10,),
            Birth(),
            SizedBox(height: 10,),
            Relation(),
            SizedBox(height: 35,),
            SaveButton(),
          ],
        ),
      ),
    );
  }
}

class Relation extends StatelessWidget{
  const Relation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Relationship'),
          SizedBox(height: 5,),
          RelationShip(),
        ],
      ),
    );
  }
}

class RelationShip extends StatefulWidget {
  const RelationShip({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _RelationShipState();
}

class _RelationShipState extends State<RelationShip>{
  List<String> RelationShipList = [
    'Con','Ba','Me','Vo','Chong','Khac'
  ];
  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Flexible(
        child: GridView.builder(
            itemCount: RelationShipList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 130,
              childAspectRatio: 4/2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
            ),
            itemBuilder: (context,index){
              return SizedBox(
                width: 100,
                height: 15,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.white,
                      foregroundColor: isSelected == index? Colors.green.shade900 : Colors.black45,
                      side: BorderSide(
                        width: 2.0,
                        color: isSelected == index? Colors.green.shade900 : Colors.black45
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  child: Text(
                    RelationShipList[index],
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  onPressed: (){
                    setState(() {
                      if (isSelected == index) {
                        isSelected = -1;
                      } else {
                        isSelected = index;
                      }
                    });
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}

class FamilyName extends StatelessWidget {
  const FamilyName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Family name'),
        SizedBox(
          height: 60,
          width: 345,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: ''
            ),
          ),
        ),
      ],
    );
  }
}