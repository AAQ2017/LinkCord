import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkcord_app/linkpage_screens/HomeScreen.dart';
import 'package:linkcord_app/startup_screens/LandingScreen.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;
  bool saveAttempt = false;
  final loginKey = GlobalKey<FormState>();
  FirebaseAuth _fireAuth = FirebaseAuth.instance;

  void _signIn({String em, String pw}){
    _fireAuth.signInWithEmailAndPassword(email: em, password: pw).then((loginVal){
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }).catchError((err){
      print(err.code);
      if((err.code == "user-not-found") | (err.code == "wrong-password")){
        showCupertinoDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("Email and/or password is incorrect.\nPlease try again."),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
      }
    });
  }

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


        Container(
          child: Align(
            alignment: Alignment(0,-0.3),
            child: Text(
              "LOGIN",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),


        Form(
          key: loginKey,
          child: Stack(children: <Widget>[

            // Email
            Align(
              alignment: Alignment(0,-0.1),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email (.edu)",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,

                  onChanged: (emailValue){
                    setState(() {
                      email = emailValue;
                    });
                  },

                ),
              ),
            ),


            // Password
            Align(
              alignment: Alignment(0,0.1),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextField(

                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,

                  onChanged: (passValue){
                    setState(() {
                      password = passValue;
                    });
                  },

                ),
              ),
            ),


            Align(
              alignment: Alignment(0,0.4),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.15,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: (){
                    _signIn(em: email, pw: password);
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
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),



            Align(
              alignment: Alignment(0,0.6),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.15,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LandingScreen()));
                  },
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFFFFCCCB),
                  child: Text(
                    "GO BACK",
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

          ],),
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
