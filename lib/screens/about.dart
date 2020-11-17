import 'package:flutter/material.dart';

class About extends StatefulWidget {

  static const String id = 'about';


  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us!'),
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
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Card(
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0,vertical:10.0),
            height: 600.0,
            width: 400.0,
            child: Text(
              'Hello Universe! \n\nWe hope you are doing well. As we all know blood is a precious element of the human body and it\'s requirement is essential for the functioning of the human body. Along with the expansion of COVID pandemic , the blood requirement has considerably increased. So as to help the people, we have created MY BLOOD BUCKET. This app will help in connecting the blood donors and the blood recipients effortlessly. The app does not limits itself here. It also consists of a community post where you can post urgent messages and interact with other users. We also help people by providing them with the location of blood banks nearby. So you don\'t need to worry while we are here.\n\nCheers!',
              style: TextStyle(
                fontFamily: 'Sansita Swashed',
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
