import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Setting",
              style: TextStyle(
                color: Colors.white,
              ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){},
            color: Colors.white,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: (){},
                child: Text(
                  "Countinue",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ))
          ],
          backgroundColor: Color(0xff209f84),
      ),
      body: Container(
        color: Color(0xffbdbdbd),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Account',
                        style: TextStyle(
                          color: Color(0xff209f84),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('Personal Information'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Family Profile'),
                      ],
                    ),
                  ],
                )
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Notification',
                      style: TextStyle(
                        color: Color(0xff209f84),
                      )
                    ),
                    Column(
                      children: <Widget>[
                        Text('Remind Space'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Remind the re-examination date'),
                      ]
                    ),
                    Column(
                      children: <Widget>[
                        Text('Remind the re-examination date before'),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Other Information',
                      style: TextStyle(
                        color: Color(0xff209f84),
                      )
                    ),
                    Row(
                      children: <Widget>[
                        Text('Privacy Policy'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Terms of Use'),
                      ],
                    ),
                    Text(
                        'Log in',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
