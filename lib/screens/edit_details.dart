import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_blood_bucket/constants.dart';
//import 'package:my_blood_bucket/screens/donate_three.dart';
import 'package:my_blood_bucket/screens/link_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class EditDetails extends StatefulWidget {

  static const String id = 'edit_details';

  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  void end() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Donor Details Updated!'),
            content: Text(
                'Your details have been edited successfully! '),
            elevation: 8.0,
            actions: [
              FlatButton(
                child: Text('Go Back'),
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(LinkScreen.id));
                },
              ),
            ],
          );
        });
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  String selectedGroup = 'A +ve';
  String selectedState = 'Andhra Pradesh';
  String selectedGender = 'Male';

  String name;
  String cityName = ' New Delhi';
  String contact;
  String stateName = 'Delhi';
  String age;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
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
        title: Text('Edit Details'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: SizedBox(
                  child: Text(
                    'Enter the details you want to edit: ',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Sansita Swashed',
                    ),
                  ),
                  height: 90.0,
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
                    child: Text('Name               ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your name'),
                    ),
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
                    child: Text('Blood Group  ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text('Blood Grp'), // Not necessary for Option 1
                      value: selectedGroup,
                      onChanged: (newValue) {
                        setState(() {
                          selectedGroup = newValue;
                        });
                      },
                      items: bloodList.map((blood) {
                        return DropdownMenuItem(
                          child: Text(blood),
                          value: blood,
                        );
                      }).toList(),
                    ),
                  )
                ],
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
                    child: Text('Gender             ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text('Gender'), // Not necessary for Option 1
                      value: selectedGender,
                      onChanged: (newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      items: genderList.map((gender) {
                        return DropdownMenuItem(
                          child: Text(gender),
                          value: gender,
                        );
                      }).toList(),
                    ),
                  )
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
                    child: Text('Age                  ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        age = value;
                      },
                      decoration:
                      kInputDecoration.copyWith(hintText: 'Enter your age'),
                    ),
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
                    child: Text('State  ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(
                    width: 90.0,
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text('State Name'), // Not necessary for Option 1
                      value: selectedState,
                      onChanged: (newValue) {
                        setState(() {
                          selectedState = newValue;
                        });
                      },
                      items: stateList.map((state) {
                        return DropdownMenuItem(
                          child: Text(state),
                          value: state,
                        );
                      }).toList(),
                    ),
                  )
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
                    child: Text('Contact        ',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'SOURCE SANS PRO',
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Flexible(
                    child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        contact = value;
                      },
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your contact'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FloatingActionButton(
                      elevation: 5.0,
                      onPressed: () {
                        end();
                        _firestore
                            .collection('donors')
                            .doc(loggedInUser.email)
                            .set({
                          'name': name,
                          'gender': selectedGender,
                          'blood_type': selectedGroup,
                          'age': int.parse(age),
                          'state': selectedState,
                          'contact': int.parse(contact),
                          'email': loggedInUser.email,
                          'createdAt': Timestamp.now(),
                        });
                      },
                      foregroundColor: Colors.blueGrey,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 45.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 22.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
