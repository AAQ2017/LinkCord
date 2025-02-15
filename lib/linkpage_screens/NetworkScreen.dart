import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linkcord_app/linkpage_screens/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:linkcord_app/network_screens/BiomedicalScreen.dart';
import 'package:linkcord_app/network_screens/CompSciScreen.dart';
import 'package:linkcord_app/network_screens/ElectricalEngineeringScreen.dart';
import 'package:linkcord_app/network_screens/GameDesignScreen.dart';
import 'package:linkcord_app/network_screens/MathScreen.dart';
import 'package:linkcord_app/network_screens/PreDentalScreen.dart';
import 'package:linkcord_app/network_screens/PreMedScreen.dart';
import 'package:linkcord_app/network_screens/UnsureScreen.dart';
import 'package:linkcord_app/linkpage_screens/HomeScreen.dart';




class NetworkScreen extends StatefulWidget {
  @override
  _NetworkScreenState createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          color: Color(0xFF39556D), // Navy Blue/Dark Blue Color
        ),


        // Logo
        Container(
          child: Align(
            alignment: Alignment(-0.95,0.95),
            child: Image.asset(
              "assets/images/Logo.png",
              width: 100,
            ),
          ),
        ),


        // Design - Top Right
        Container (
          child: Align (
            alignment: Alignment(1,-1),

            child: ClipPath(
              clipper: OvalLeftBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white,
              ),
            ),
          ),
        ),



        Container(
          child: Align(
            alignment: Alignment(0,-0.75),
            child: Text(
              "CONNECT WITH YOUR FELLOW CLASSMATES AND BEYOND\n\nCONNECT WITH MENTORS FROM VARIOUS SCHOOLS AND FIELDS AROUND THE WORLD",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  )
              ),
            ),
          ),
        ),


        // Network
        Align(
          alignment: Alignment(-1,-0.95),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/networking.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.12,

            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(-0.8,-0.85),
            child: Text(
              "NETWORK",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )
              ),
            ),
          ),
        ),



        // Biomedical
        Align(
          alignment: Alignment(-0.61,-0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/engineer-4915457_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BiomedicalScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(-0.55,-0.025),
            child: Text(
              "BIOMEDICAL ENGINEERING",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),


        // CS
        Align(
          alignment: Alignment(-0.225,-0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/trace-3157431_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CompSciScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(-0.2,-0.025),
            child: Text(
              "COMPUTER SCIENCE",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),



        // EE
        Align(
          alignment: Alignment(0.225,-0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/board-453758_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ElectricalEngineeringScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(0.2,-0.025),
            child: Text(
              "ELECTRICAL ENGINEERING",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),

        // Game Design
        Align(
          alignment: Alignment(0.61,-0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/child-3264751_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GameDesignScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(0.52,-0.025),
            child: Text(
              "GAME DESIGN",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),





        // MATH
        Align(
          alignment: Alignment(-0.61,0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/math-1547018_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MathScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(-0.525,0.55),
            child: Text(
              "MATHEMATICS",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),


        // PRE-DENTAL
        Align(
          alignment: Alignment(-0.225,0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/chair-2584260_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PreDentalScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(-0.2,0.55),
            child: Text(
              "PRE-DENTAL",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),


        // PRE-MED
        Align(
          alignment: Alignment(0.225,0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/surgery-1807541_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PreMedScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(0.2,0.55),
            child: Text(
              "PRE-MEDICINE",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),

        // UNSURE
        Align(
          alignment: Alignment(0.61,0.35),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/question-mark-1872665_1920.jpg'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UnsureScreen()));
                },
              ),
            ),
          ),
        ),

        Container(
          child: Align(
            alignment: Alignment(0.52,0.55),
            child: Text(
              "UNSURE",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),











        Container(
          child: Align(
            alignment: Alignment(0,0.65),
            child: Text(
              "MORE FIELDS COMING SOON",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )
              ),
            ),
          ),
        ),


        // Settings
        Align(
          alignment: Alignment(0,0.85),
          child: Material(
            elevation: 5,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/macro-1452987_1920.jpg'),
              fit: BoxFit.cover,
              width: 75,
              height: 75,
              child: InkWell(
                onTap: () {print("Hi");},
              ),
            ),
          ),

        ),

        Container(
          child: Align(
            alignment: Alignment(0,0.92),
            child: Text(
              "SETTINGS",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )
              ),
            ),
          ),
        ),



        // Home
        Align(
          alignment: Alignment(-0.85,1),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.06,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0x00000000),
              child: Text(
                "GO HOME",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),


        // About
        Align(
          alignment: Alignment(0.75,1),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.06,
            child: FlatButton(
              onPressed: () {
                print('ABOUT');
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0x00000000),
              child: Text(
                "ABOUT US",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),


        // Privacy
        Align(
          alignment: Alignment(0.85,1),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.06,
            child: FlatButton(
              onPressed: () {
                print('PRIVACY');
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0x00000000),
              child: Text(
                "PRIVACY",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),


        // Contact Us
        Align(
          alignment: Alignment(0.95,1),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.06,
            child: FlatButton(
              onPressed: () {
                print('CONTACT US');
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0x00000000),
              child: Text(
                "CONTACT US",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),


      ],),
    );
  }
}
