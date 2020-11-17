import 'package:flutter/material.dart';
import 'package:my_blood_bucket/screens/donate_two.dart';
import 'package:my_blood_bucket/screens/link_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
class Conditions extends StatefulWidget {
  static const String id = 'conditions';
  @override
  _ConditionsState createState() => _ConditionsState();
}

class _ConditionsState extends State<Conditions> {
  int con1=0;
  int con2, con3, con4, con5, con6, con7, con8 ;

  bool conditionPassed(){
    if(con1 == 0 && con2 == 1 && con3 == 1 && con4 ==1 && con5 == 1 && con6 == 1 && con7 == 1 && con8 == 1)
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  child: Text(
                    'Conditions Form',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 2.5,
                      fontSize: 30.0,
                      fontFamily: 'Sansita Swashed',
                    ),
                  ),
                  height: 50.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Do you agree to show your details publicly for blood donation purpose? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
//                      print('switched to: $index');
                        con1 = index;
//                        print(con1);
                    },

                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Are you currently on any type of medications? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con2 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Are you facing any time of continuous weight-loss? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con3 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Have you suffered from any disease in past 3-4 months? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con4 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('If you are a female, are you undergoing pregnancy? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con5 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Are you a regular smoker/drinker? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con6 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Are you diabetic? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
                      con7 = index;
//                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    width: 200.0,
                    child: Text('Have undergone any surgery? ',
                        style: TextStyle(
                          fontSize:18.0,
                          fontFamily: 'SOURCE SANS PRO',
//                        fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  ToggleSwitch(
                    minWidth: 50.0,
                    cornerRadius: 20.0,
                    activeBgColor: Colors.black,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    labels: ['', ''],
                    icons: [Icons.check, Icons.close],
                    onToggle: (index) {
//                      print('switched to: $index');
                      con8 = index;
//                        print(con1);
                    },

                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 230.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MaterialButton(onPressed: (){
                        if(conditionPassed() == true){
                          Navigator.pushNamed(context, DonateTwo.id);
                        }else{
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Unsatisfactory Conditions :('),
                                  content: Text('Conditions for becoming a donor were unsatisfactory. Thanks for your efforts. Take care!'),
                                  elevation: 8.0,
                                  actions: [
                                    FlatButton(
                                      child: Text('Go Back'),
                                      onPressed: () {
                                        Navigator.popUntil(context, ModalRoute.withName(LinkScreen.id));
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                    },
                      child: Icon(Icons.navigate_next,
                      size: 50.0,),
                      textColor: Colors.white,

                      color: Color(0xFF28313E),
                      shape: CircleBorder(),),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

