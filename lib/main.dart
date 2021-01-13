import 'package:flutter/material.dart';
import 'package:linkcord_app/startup_screens/LandingScreen.dart';


void main() {
  runApp(LinkCordApp());
}

class LinkCordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}


