import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linkcord_app/linkpage_screens/HomeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class RelaxScreen extends StatefulWidget {
  @override
  _RelaxScreenState createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
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



        Container(
          child: Align(
            alignment: Alignment(0,-0.75),
            child: Text(
              "RELAX WITH YOURSELF OR WITH OTHERS",
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


        // Relax
        Align(
          alignment: Alignment(-1,-0.95),
          child: Material(
            elevation: 8,
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage('assets/images/digital-art-420830_1280.png'),
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
              "RELAX",
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
