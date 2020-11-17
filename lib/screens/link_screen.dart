import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blood_bucket/components/rounded_button.dart';
import 'package:my_blood_bucket/screens/about.dart';
import 'package:my_blood_bucket/screens/campaigns.dart';
import 'package:my_blood_bucket/screens/donate_one.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_blood_bucket/screens/edit_details.dart';
import 'package:my_blood_bucket/screens/receive_one.dart';
import 'package:my_blood_bucket/screens/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'community_post.dart';

class LinkScreen extends StatefulWidget {
  static const String id = 'link_screen';

  @override
  _LinkScreenState createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String username;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        username = loggedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  void cancelRegistration(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Donor De-Registered'),
            content: Text('You have successfully de-registered as a blood-donor.\nWe hope to see you soon!'),
            elevation: 8.0,
            actions: [
              FlatButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.popUntil(context,
                      ModalRoute.withName(LinkScreen.id));
                },
              ),
            ],
          );
        },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 240.0,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 80.0,
                    ),
                    Text(
                      'Hi $username !',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'Sansita Swashed',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('About'),
                onTap: () {
                  Navigator.pushNamed(context, About.id);
                },
              ),
              ListTile(
                title: Text('Edit Account Info'),
                onTap: () {
                  Navigator.pushNamed(context, EditDetails.id);
                },
              ),
              ListTile(
                title: Text('Nearby Blood Donation Camps'),
                onTap: (){
                  Navigator.pushNamed(context, BloodCampaigns.id);
                },
              ),
              ListTile(
                title: Text('Cancel Donor Registration'),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Account'),
                          content: Text('Do you wish to no longer be a blood-donor?'),
                          elevation: 8.0,
                          actions: [
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                    Navigator.pop(context);
                                    _firestore.collection('donors').doc('$username').delete();

                                    cancelRegistration();

                              },
                            ),
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Log Out'),
                          content: Text('Do you wish to log out ?'),
                          elevation: 8.0,
                          actions: [
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                _auth.signOut();
                                Navigator.popUntil(context,
                                    ModalRoute.withName(WelcomeScreen.id));
                              },
                            ),
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
           IconButton(
             icon: Icon(Icons.chat),
             onPressed: () {
               Navigator.pushNamed(context, CommunityPost.id);
             },
              tooltip: 'Community Post',
          ),
        ],
        title: Text('At Your Service!'),
        backgroundColor: Color(0xFF28313E),
//        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Text(
                'Do You Wish To ?',
                style: TextStyle(
                  fontFamily: 'Sansita Swashed',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.black,
                ),
              ),
            ),
            RoundedButton(
                color: Colors.blueGrey,
                text: 'Donate',
                onPressed: () {
                  Navigator.pushNamed(context, DonateOne.id);
                }),
            RoundedButton(
                color: Color(0xFF28313E),
                text: 'Receive',
                onPressed: () {
                  Navigator.pushNamed(context, ReceiveOne.id);
                }),
          ],
        ),
      ),
    );
  }
}
