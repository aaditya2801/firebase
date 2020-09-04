import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
  Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

var url =
    "https://raw.githubusercontent.com/aaditya2801/myflutter/master/1_j_zP74-cpvXRcs8dM_pkMQ.jpeg";

_launchURL() async {
  const url =
      'https://console.cloud.google.com/home/dashboard?project=k8s-project-gke&_ga=2.152991545.1650905738.1599134394-478473094.1599134394&_gac=1.53677530.1599134395.CjwKCAjwqML6BRAHEiwAdquMndcEWl58pnulhgUwNHtrWt1ycGYFxe9oETNwSZ3R2GfJ0WWN0sPzDRoCCL8QAvD_BwE&pli=1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

myapp1() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
}

myt() {
  Fluttertoast.showToast(
      msg: "Hello, Welcome for Storing Data",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 20,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
}

myprint() {
  print('AADITYA  !! ');
}

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.store),
        title: Text(
          'FIREBASE',
          style: TextStyle(fontFamily: 'Sriracha'),
        ),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle), onPressed: _launchURL)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade200,
        margin: EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 200.0,
                    child: TextLiquidFill(
                      text: 'FIRESTORE',
                      waveColor: Colors.amber,
                      boxBackgroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontFamily: 'LuckiestGuy',
                        fontSize: 29.0,
                        fontWeight: FontWeight.bold,
                      ),
                      boxHeight: 100.0,
                    ),
                  ),
                  Card(
                    color: Colors.amber,
                    child: Image.asset('assets/firebasenew.gif'),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        side: BorderSide(width: 0, color: Colors.white)),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)),
                        color: Colors.amber,
                        onPressed: () {
                          myt();
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new Local()));
                        },
                        child: Icon(
                          Icons.data_usage,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 300.0,
                    child: ScaleAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        totalRepeatCount: 1000,
                        text: [
                          "By",
                          "Aaditya",
                        ],
                        textStyle: TextStyle(
                            fontSize: 50.0,
                            fontFamily: 'Satisfy',
                            color: Colors.amber),
                        textAlign: TextAlign.center,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyDrawerApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.lightBlue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 70.0,
                        child: Image.asset('assets/circle-cropped.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        'FIRESTORE',
                        style: TextStyle(
                            fontFamily: 'RubikMonoOne',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      'DATABASE',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
