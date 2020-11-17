import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blood_bucket/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
var loggedInUser;

class CommunityPost extends StatefulWidget {


  static const String id = 'community_post';

  @override
  _CommunityPostState createState() => _CommunityPostState();
}

class _CommunityPostState extends State<CommunityPost> {
  final _auth = FirebaseAuth.instance;

  final messageEditingController = TextEditingController();
  // ignore: deprecated_member_use

  String messageText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }


  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;

      }
    }catch(e){
      print(e);
    }
  }

//  void getMessageStream() async{
//    //snapshots are stream (future list of documents)
//    await for(var snapshots in _firestore.collection('messages').snapshots()){
//      for( var messages in snapshots.documents ){
//        print(messages.data());
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
//                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡Community Post'),
        backgroundColor: Color(0xFF28313E),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageEditingController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageEditingController.clear();
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        'sender':loggedInUser.email,
                        'text':messageText,
                        'createdAt':Timestamp.now(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('createdAt').snapshots(),
      //snapshot will be an  async snapshot
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        //snapshot is async snapshot which is part of flutter
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for(var message in messages){
          final textMessage = message['text'];//message here is part of firebase
          final messageSender = message['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(message: textMessage,sender: messageSender,isMe:currentUser==messageSender ,);
          messageBubbles.add(messageBubble);
        }
        //instead of returning columns, we should return a list view so that it is scrollable, but it should be
        //under expanded so that it does not cover entire screen
        //maintains the space for text container as well
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {

  final String message;
  final String sender;
  final bool isMe;

  MessageBubble({this.message,this.sender,this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender',
            style: TextStyle(fontSize: 12.0,
                color: Colors.black54),),
          Material(
            elevation: 5.0,
            borderRadius:isMe? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),):BorderRadius.only(topRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),),
            color: isMe?Colors.blueGrey:Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
              child: Text('$message',
                //we will wrap Material widdget around a text widget so as to specify some background colour to widget
                style: TextStyle(fontSize: 18.0,color: isMe?Colors.white:Colors.black54,),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
