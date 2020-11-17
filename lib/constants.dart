import 'package:flutter/material.dart';


const kSendButtonTextStyle = TextStyle(
  color: Color(0xFF28313E),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xFF28313E), width: 2.0),
  ),
);

const kInputTextDecoration = InputDecoration(
  hintText: 'Enter the value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kInputDecoration = InputDecoration(
  hintText: 'Enter the value',
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),

);

const List<String> bloodList2 = [
  'All',
  'A +ve',
  'B +ve',
  'O +ve',
  'AB +ve',
  'A -ve',
  'B -ve',
  'O -ve',
  'AB -ve'
];


const List<String> bloodList = [
  'A +ve',
  'B +ve',
  'O +ve',
  'AB +ve',
  'A -ve',
  'B -ve',
  'O -ve',
  'AB -ve'
];

const List<String> genderList = [
  'Male',
  'Female',
  'Others'
];

const List<String> stateList = [
  'Andhra Pradesh',
  'Arunachal Pradesh',
 	'Assam',
 	'Bihar',
 	'Chhattisgarh',
  'Delhi',
 	'Goa',
  'Gujarat',
 	'Haryana',
 	'Himachal Pradesh',
 	'Jharkhand',
  'Jammu',
 	'Karnataka',
 	'Kerala',
 	'Madhya Pradesh',
 	'Maharashtra',
 	'Manipur',
 	'Meghalaya',
 	'Mizoram',
 	'Nagaland',
 	'Odisha',
 	'Punjab',
 	'Rajasthan',
 	'Sikkim',
 	'Tamil Nadu',
 	'Telangana',
 	'Tripura',
 	'Uttar Pradesh',
  'Uttarakhand',
  'West Bengal'
];