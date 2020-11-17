import 'package:flutter/material.dart';
import 'package:my_blood_bucket/screens/about.dart';
import 'package:my_blood_bucket/screens/campaigns.dart';
import 'package:my_blood_bucket/screens/community_post.dart';
import 'package:my_blood_bucket/screens/conditions.dart';
import 'package:my_blood_bucket/screens/donate_one.dart';
//import 'package:my_blood_bucket/screens/donate_three.dart';
import 'package:my_blood_bucket/screens/donate_two.dart';
import 'package:my_blood_bucket/screens/edit_details.dart';
import 'package:my_blood_bucket/screens/receive_one.dart';
//import 'package:my_blood_bucket/screens/receive_two.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/link_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyBloodBucket());
}


class MyBloodBucket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id : (context) => LoginScreen(),
        RegistrationScreen.id: (context)=>RegistrationScreen(),
        LinkScreen.id : (context)=>LinkScreen(),
        Conditions.id : (context)=> Conditions(),
        About.id : (context)=> About(),
        EditDetails.id : (context)=>EditDetails(),
        DonateOne.id : (context)=>DonateOne(),
        DonateTwo.id : (context)=>DonateTwo(),
//        DonateThree.id : (context)=>DonateThree(),
        ReceiveOne.id : (context)=>ReceiveOne(),
//        ReceiveTwo.id : (context)=>ReceiveTwo(),
        CommunityPost.id : (context) => CommunityPost(),
        BloodCampaigns.id : (context) => BloodCampaigns(),
      },
    );
  }
}


