import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_blood_bucket/constants.dart';
//import 'package:flutter_launch/flutter_launch.dart';
//import 'package:my_blood_bucket/constants.dart';

final _firestore = FirebaseFirestore.instance;
var loggedInUser;

class ReceiveOne extends StatefulWidget {

  static const String id = 'receive_one';

  @override
  _ReceiveOneState createState() => _ReceiveOneState();
}

class _ReceiveOneState extends State<ReceiveOne> {
//  final _auth = FirebaseAuth.instance;
  String selectedGroup = 'All';

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
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (String group){
            setState(() {
              selectedGroup = group;
            });


          },itemBuilder:(BuildContext context){
            return bloodList2.map((String choice){
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          }),
        ],
        title: Text('Available Donors'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            StreamBuilder<QuerySnapshot>(
              stream: (selectedGroup == 'All')? _firestore.collection('donors').orderBy('createdAt').snapshots():  _firestore.collection('donors').where('blood_type', isEqualTo: '$selectedGroup').snapshots(),

              builder: (context, snapshot){

                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }

                      final donors = snapshot.data.docs.toList();
                      List<DonorBubble> donorBubbles = [];
                      for(var donor in donors){
                        final donorName = donor.data()['name'];//message here is part of firebase
                        final donorAge = donor.data()['age'];
                        final donorGp = donor.data()['blood_type'];
                        final donorState = donor.data()['state'];
                        final donorGender = donor.data()['gender'];
                        final donorMail = donor.data()['email'];
                        final donorContact = donor.data()['contact'];

//                        final currentUser = loggedInUser.email;

                        final donorBubble = DonorBubble(name: donorName, age: donorAge, bloodGp: donorGp, state: donorState,gender: donorGender,email: donorMail,contact: donorContact);
                        donorBubbles.add(donorBubble);
                      }
                      //instead of returning columns, we should return a list view so that it is scrollable, but it should be
                      //under expanded so that it does not cover entire screen
                      //maintains the space for text container as well
                      return Expanded(
                        child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
                          children: donorBubbles,
                        ),
                      );
                    }

            ),
        ],
      ),
    );
  }
}


void _launchWhatsApp(int contact) async{
 var url ="whatsapp://send?phone=+91$contact";
 if (await canLaunch(url)) {
   await launch(url);
 } else {
   throw 'Could not launch WhatsApp';
 }
}

void _launchGmail(String email) async{
  var url = 'mailto:${email}?subject=Blood Donor Required';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch Gmail';
  }
}

Icon getIcon(String gender){
  if(gender == 'Male') 
      return Icon(FontAwesomeIcons.mars, size: 60,color: Colors.teal,);
  else if(gender == 'Female')
      return Icon(FontAwesomeIcons.venus, size: 60, color: Colors.pink,);
  else
    return Icon(FontAwesomeIcons.venusMars, size : 60, color: Colors.teal,);
}




class DonorBubble extends StatelessWidget {

  final String name;
  final String bloodGp;
  final String gender;
  final int contact;
  final String email;
  final int age;
  final String state;

  DonorBubble({this.name,this.age,this.bloodGp, this.contact, this.gender, this.state, this.email});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        elevation: 5.0,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: getIcon(gender),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : $name',
                    style: TextStyle(
                      fontFamily: 'Sansita Swashed',
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Age : $age',
                        style: TextStyle(
                          fontFamily: 'Sansita Swashed',
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(width: 12.0,),
                      Text(
                        'Blood Gp : $bloodGp',
                        style: TextStyle(
                          fontFamily: 'Sansita Swashed',
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'State : $state',
                    style: TextStyle(
                      fontFamily: 'Sansita Swashed',
                    fontSize: 18.0,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.green,),
                        iconSize: 28.0,
                        onPressed: (){
                            _launchWhatsApp(contact);
                        },
                      ),
                      SizedBox(width: 40.0),
                      IconButton(
                        icon: Icon(
                          Icons.email,
                          color: Colors.pink,
                        ),
                        iconSize: 28.0,
                        onPressed: (){
                          _launchGmail(email);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
      ),
    );

//    return Padding(
//      padding: EdgeInsets.all(10.0),
//      child: Column(
//          Text('$sender',
//            style: TextStyle(fontSize: 12.0,
//                color: Colors.black54),),
//          Material(
//            elevation: 5.0,
//            borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),):BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),),
//            color: isMe?Colors.lightBlueAccent:Colors.white,
//            child: Padding(
//              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
//              child: Text('$message',
//                //we will wrap Material widdget around a text widget so as to specify some background colour to widget
//                style: TextStyle(fontSize: 18.0,color: isMe?Colors.white:Colors.black54,),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );

  }
}
