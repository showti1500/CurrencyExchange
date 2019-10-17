import 'dart:math';

import 'package:currency/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home':(_)=>HomePage()
      },
      title: 'Currency',
      home: SplashScreenz(),
    );
  }
}

class SplashScreenz extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreenz> {
  @override
  Widget build(BuildContext context) {
    var splashScreen = new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      imageBackground: AssetImage('images/digital.jpg'),

      // title: Text(
      //   'Currency Exchange',
      //   textAlign: TextAlign.center,
      //   style: TextStyle(
          
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white24,
      //     fontSize: 20.0,
      //   ),
      // ),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.blue,
      loadingText: Text(
        'Initializing....',
        style: new TextStyle(
          color: Colors.white,
        ),
      ),
    );
    return splashScreen;
  }
}

