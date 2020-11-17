import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'package:my_blood_bucket/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/blood-type.png'),
                      height: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Flexible(
                    child: Text(
                      'My Blood Bucket',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sansita Swashed',
                        fontSize: 45.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 42.0,
              ),
              RoundedButton(color: Colors.blueGrey,text: 'Log In',onPressed: (){
                Navigator.pushNamed(context,LoginScreen.id);
              },),
              RoundedButton(color: Color(0xFF28313E),text:'Register',onPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              }, )
            ],
          ),
      ),
    );
  }
}

