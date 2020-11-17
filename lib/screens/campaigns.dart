import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BloodCampaigns extends StatefulWidget {

  static const String id = 'blood_campaigns';

  @override
  _BloodCampaignsState createState() => _BloodCampaignsState();
}

final _firestore = FirebaseFirestore.instance;


class _BloodCampaignsState extends State<BloodCampaigns> {
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
          title: Text('Blood Donation Camps'),
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('campaigns').orderBy('createdAt').snapshots(),
                builder: (context, snapshot){

              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blueAccent,
                  ),
                );
              }

              final campaigns = snapshot.data.docs.toList();
              List<CampaignBubble> campaignBubbles = [];
              for(var campaign in campaigns){
                final cName = campaign.data()['name'];//message here is part of firebase
                final cAddress = campaign.data()['address'];
                final cWebsite = campaign.data()['website'];
                final cLat = campaign.data()['lat'];
                final cLon = campaign.data()['lon'];

//              final currentUser = loggedInUser.email;

                final campaignBubble = CampaignBubble(name: cName, address: cAddress, lat:cLat , lon: cLon, url: cWebsite,);
                campaignBubbles.add(campaignBubble);
              }
              //instead of returning columns, we should return a list view so that it is scrollable, but it should be
              //under expanded so that it does not cover entire screen
              //maintains the space for text container as well
              return Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
                  children: campaignBubbles,
                ),
              );
            }

            ),
          ],
        ),
      );
  }
}

void _launchWebsite(String url) async{
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch Website';
  }
}

void _launchMap(double lat , double lon) async{
   var googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${lat},${lon}";

   if (await canLaunch(googleMapslocationUrl)) {
  await launch(googleMapslocationUrl);
  } else {
  print('Could not launch $googleMapslocationUrl');
//  throw 'Could not launch $encodedURl';
  }

}

class CampaignBubble extends StatelessWidget {

  final String name;
  final String address;
  final String url;
  final double lat;
  final double lon;

  CampaignBubble({this.name,this.address,this.lat, this.lon, this.url});

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
              child: Container(child: Image.asset('images/hospital.png'),height: 40.0,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0,),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,),
                    height: 30.0,
                    child: Text(
                      'Name : $name',
                      style: TextStyle(
                        fontFamily: 'Sansita Swashed',
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,),
                  width: 250.0,
                  child: Text(
                    'Address : $address',
                    style: TextStyle(
                      fontFamily: 'Sansita Swashed',
                      fontSize: 18.0,),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset('images/web.png'),
                      iconSize: 28.0,
                      onPressed: (){
                      _launchWebsite(url);
                      },
                    ),
                    SizedBox(width: 40.0),
                    IconButton(
                      icon: Icon(
                        Icons.pin_drop,
                        color: Colors.teal,
                      ),
                      iconSize: 30.0,
                      onPressed: (){
                      _launchMap(lat,lon);
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

  }
}
