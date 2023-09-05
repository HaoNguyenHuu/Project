// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'TimeInputFormatter.dart';

class MedicineInfo extends StatelessWidget {
  get Continue => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        backgroundColor: Colors.green,
        title: const Text(
          'Medicine detail',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: Continue,
              child: Text(
                'Continue',
                style: TextStyle(
                    color: Colors.white
                ),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white54,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameInput(),
              SizedBox(height: 15,),
              CountInput(),
              SizedBox(height: 15,),
              Frequency(),
              SizedBox(height: 15,),
              TimesPerDay(),
              SizedBox(height: 15,),
              NoteInput(),
              SizedBox(height: 15,),
              DisplayLayout(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayLayout extends StatelessWidget{
  const DisplayLayout({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display'),
        SizedBox(height: 5,),
        DisplayImage()
      ],
    );
  }
}

class DisplayImage extends StatefulWidget {
  DisplayImage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
  List<Image> ImagesList = [
    Image.asset('lib/res/InfoImage1.png'),
    Image.asset('lib/res/InfoImage2.png'),
    Image.asset('lib/res/InfoImage3.png')
  ];

  int isSelected = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: ListView.builder(
          itemCount: ImagesList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Container(
              width: 50,
              height: 50,
              color: isSelected == index? Colors.green : Colors.white,
              padding: EdgeInsets.all(2.0),
              child: IconButton(
                icon: ImagesList[index],
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
      )
    );
  }
}

class NoteInput extends StatelessWidget {
  const NoteInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Note'),
        SizedBox(
          height: 60,
          width: 360,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter sth'
            ),
          ),
        )
      ],
    );
  }
}

class TimesPerDay extends StatelessWidget {
  const TimesPerDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Times per day'),
        SizedBox(
          height: 60,
          width: 360,
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '1'
            ),
          ),
        ),
        SizedBox(height: 13,),
        Row(
          children: [
            SizedBox(
              width: 175,
              height: 60,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    prefixIcon: Image.asset('lib/res/watch.png'),
                    border: OutlineInputBorder(),
                    hintText: '00:00:00'
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  TimeTextInputFormatter()
                ],
              ),
            ),
            SizedBox(width: 10,),
            SizedBox(
              width: 175,
              height: 60,
              child: TextField(
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      'viên',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                  ),
                    border: OutlineInputBorder(),
                    hintText: '1'
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Frequency extends StatelessWidget {
  const Frequency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Frequency'),
        SizedBox(
          height: 60,
          width: 360,
          child: TextField(
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '1'
            ),
          ),
        ),
      ],
    );
  }
}

class CountInput extends StatelessWidget {
  const CountInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Count'),
            SizedBox(
              height: 60,
              width: 215,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '1'
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Unit'),
            SizedBox(
              height: 60,
              width: 100,
              child: UnitMenu(),
            ),
          ],
        ),
      ],
    );
  }
}

class UnitMenu extends StatefulWidget{
  const UnitMenu({super.key});

  @override
  State<UnitMenu> createState() => _UnitMenuState();
}

class _UnitMenuState extends State<UnitMenu> {
  final List<String> list = <String>['Viên','Gói'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list[0];

    return DropdownMenu<String>(
      initialSelection: list[0],
      onSelected: (String? value) {
          dropdownValue = value!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}



class NameInput extends StatelessWidget {
  const NameInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name'),
        SizedBox(
          height: 60,
          width: 360,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter sth'
            ),
          ),
        ),
      ],
    );
  }
}