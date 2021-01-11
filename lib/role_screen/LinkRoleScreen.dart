import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


class LinkRoleScreen extends StatefulWidget {
  @override
  _LinkRoleScreenState createState() => _LinkRoleScreenState();
}

class _LinkRoleScreenState extends State<LinkRoleScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



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
            alignment: Alignment(0,-0.9),
            child: Image.asset(
              "assets/images/Logo.png",
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


        // Design - Bottom left
        Container (
          child: Align (
            alignment: Alignment(-1,1),
            child: ClipPath(
              clipper: OvalRightBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.20,
                color: Colors.white,
                child: Align(
                  alignment: Alignment(-0.25,0),
                  child: Text(
                    "LINKCORD",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color(0xFF39556D),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),


      ],),
    );
  }
}
