import 'package:flutter/material.dart';
import 'package:my_blood_bucket/screens/conditions.dart';
//import 'package:my_blood_bucket/screens/donate_two.dart';

class DonateOne extends StatefulWidget {
  static const String id = 'donate_one';

  @override
  _DonateOneState createState() => _DonateOneState();
}

class _DonateOneState extends State<DonateOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('😇'),
         backgroundColor: Color(0xFF28313E),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 40.0,
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: 'Back',
            );
          },
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Card(
              elevation: 5.0,
              child: Container(
                height: 350,
                child: Text(
                  'That\'s so kind of you!!\n\nWe will require some additional details ',
                  style: TextStyle(
                    fontFamily: 'Sansita Swashed',
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
//            SizedBox(
//              height: 40.0,
//            ),
//            Card(
//              elevation: 5.0,
//              child: Container(
//                height: 120.0,
//                child: Text(
//                  'We will require some additional details ',
//                  style: TextStyle(
//                    fontSize: 35.0,
//                    fontFamily: 'Sansita Swashed',
//                  ),
//                ),
//              ),
//            ),
            SizedBox(
              height: 40.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, Conditions.id);
                },
                foregroundColor: Colors.lightBlueAccent,
                backgroundColor: Color(0xFF28313E),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 38.0,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],)
          ],
        ),
      ),
    );
  }
}
