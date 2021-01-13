import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:linkcord_app/linkpage_screens/HomeScreen.dart';

class LinkRoleScreen extends StatefulWidget {
  @override
  _LinkRoleScreenState createState() => _LinkRoleScreenState();
}

class _LinkRoleScreenState extends State<LinkRoleScreen> {
  String uid, name, uni, gradDate, discordName;
  bool saveAttempted = false;
  final roleFormKey = GlobalKey <FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  void _LinkRoles({String ed, String grdate, String nDis}) {
    if (_firebaseAuth.currentUser != null) {
      FirebaseFirestore.instance.collection("users").doc(_firebaseAuth.currentUser.uid).update({
        "university": ed,
        "graduation date (month year)": grdate,
        "discord userid": nDis,
      }).then((roleResult) => {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()))});
    }
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


        // Finish Sign Up Text
        Container(
          child: Align(
            alignment: Alignment(0,-0.3),
            child: Text(
              "FINISH SIGN UP",
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


        Container(
          child: Align(
            alignment: Alignment(0,-0.2),
            child: Text(
              "Your account has been created.\n"
                  "Please complete the following to finish Sign Up",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
        ),

        // Form
        Form(
          key: roleFormKey,
          child: Stack(children: <Widget>[

            // University
            Align(
              alignment: Alignment(0,-0.05),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirm University Name",
                    labelStyle: TextStyle(color:Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),

                    //border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,

                  onChanged: (textValue) {
                    setState(() {
                      uni = textValue;
                    });
                  },
                  validator: (uniValue) {
                    if (uniValue.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },


                ),
              ),
            ),

            // Graduation Date (Month Year)
            Align(
              alignment: Alignment(0,0.1),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Anticipated Graduation Date (MONTH YEAR)",
                    labelStyle: TextStyle(color:Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),

                    //border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,

                  onChanged: (textValue) {
                    setState(() {
                      gradDate = textValue;
                    });
                  },
                  validator: (gradDateValue) {
                    if (gradDateValue.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },

                ),
              ),
            ),


            // Discord Handle
            Align(
              alignment: Alignment(0,0.25),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Discord Handle (Username#1234)",
                    labelStyle: TextStyle(color:Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    border: UnderlineInputBorder(),

                    //border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: false,

                  onChanged: (textValue) {
                    setState(() {
                      discordName = textValue;
                    });
                  },
                  validator: (discValue) {
                    if (discValue.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },

                ),
              ),
            ),


            // Finish Sign Up (Submit Button)
            Align(
              alignment: Alignment(0,0.6),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.15,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: () {
                    setState(() {
                      saveAttempted = true;
                    });
                    if(roleFormKey.currentState.validate()){
                      roleFormKey.currentState.save();
                      _LinkRoles(ed: uni, grdate: gradDate, nDis: discordName);
                    }
                  },
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFF64CFFF),
                  child: Text(
                    "FINISH SIGN UP",
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
        ),






      ],),
    );
  }
}
