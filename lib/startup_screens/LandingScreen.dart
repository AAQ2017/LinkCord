import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:linkcord_app/startup_screens/SignUpScreen.dart';
import 'package:linkcord_app/startup_screens/LoginScreen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreen createState() => _LandingScreen();
}

class _LandingScreen extends State <LandingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[

        // Background Color
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


        // Welcome Text
        Container(
          child: Align(
            alignment: Alignment(0,-0.05),
            child: Text(
              "Connect to Fellow Students and Professionals.\n"
                  "Join Groups that Bring Out the You.\n"
                  "Relax by Yourself or with Others.\n\n"
                  "This isn't just Networking.\n"
                  "It's Networking. Better.",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                )
              ),
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


        // Sign Up Button
        Align(
          alignment: Alignment(0,0.35),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.15,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0xFFB5E8FF),
              child: Text(
                "JOIN US",
                style: GoogleFonts.roboto(
                  color: Color(0xFF39556D),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),


        // Login Button
        Align(
          alignment: Alignment(0,0.55),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: MediaQuery.of(context).size.width * 0.15,
            child: RaisedButton(
              elevation: 5,
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Color(0xFFAAFFE2),
              child: Text(
                "LOGIN",
                style: GoogleFonts.roboto(
                  color: Color(0xFF39556D),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),


        // Powered By
        Container(
          child: Align(
            alignment: Alignment(0,0.7),
            child: Text(
              "Integrated with Discord, Amazon Alexa, and Oculus",
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
