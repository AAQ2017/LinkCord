import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:linkcord_app/role_screen/LinkRoleScreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:linkcord_app/startup_screens/LandingScreen.dart';

class SignUpScreen extends StatefulWidget {


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name, email, confirmEmail, password, confirmPassword;
  bool savedAttempted = false;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  
  void _createUser({String n, String em, String pw}){
    _firebaseAuth.createUserWithEmailAndPassword(email: em, password: pw)
        .then((currentLinkUser) => FirebaseFirestore.instance.collection("users")
        .doc(currentLinkUser.user.uid).set({"uid": currentLinkUser.user.uid, "name": name, "email (.edu)": em}))
        .then((authResult) => {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LinkRoleScreen()))
        })
        .catchError((err){print(err.code);
    if (err.code == "email-already-in-use") {
      showCupertinoDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("This email already has an account assosicated with it"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
    }

    });
  }



  String emailValidator(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
        r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(('
        r'[a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value) | !value.endsWith('.edu')) {
      return "Invalid Email Format or Not an Educational Email";
    } else {
      return null;
    }
  }

  String passwordValidator(String value) {
    if (value.length < 8) {
      return "Passworld must be longer than 8 characters";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[

        // Background color
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


        // Sign Up text
        Container(
          child: Align(
            alignment: Alignment(0,-0.3),
            child: Text(
              "SIGN UP",
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


        // Form Fields
        Form(
          key: formKey,
          child: Stack(children: <Widget>[

            // Name
            Align(
              alignment: Alignment(0,-0.2),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Name",
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
                      name = textValue;
                    });
                  },
                  validator: (nameValue) {
                    if (nameValue.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },


                ),
              ),
            ),


            // Education Email
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
                    labelText: "School Email (.edu)",
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
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,

                  onChanged: (textValue) {
                    setState(() {
                      email = textValue;
                    });
                  },

                  validator: emailValidator,


                ),
              ),
            ),


            // Confirm Education Email
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
                    labelText: "Confirm School Email (.edu)",
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
                      confirmEmail = textValue;
                    });
                  },

                  validator: (emailConfValue){
                    if(emailConfValue != email) {
                      return "Education Emails must match";
                    }
                    return null;
                  },



                ),
              ),
            ),


            //  Password
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
                    labelText: "Password",
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
                  obscureText: true,

                  onChanged: (textValue) {
                    setState(() {
                      password = textValue;
                    });
                  },
                  validator: passwordValidator,

                ),
              ),
            ),


            // Confirm Password
            Align(
              alignment: Alignment(0,0.4),
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                ),

                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
                  obscureText: true,

                  onChanged: (textValue) {
                    setState(() {
                      confirmPassword = textValue;
                    });
                  },

                  validator: (pwdConfVal){
                    if (pwdConfVal != password){
                      return "Passwords must match";
                    }
                    return null;
                  },

                ),
              ),
            ),


            // Complete Sign Up --> Go to --> Role Screen
            Align(
              alignment: Alignment(0,0.6),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.15,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: () {
                    setState(() {
                      savedAttempted = true;
                    });
                    if(formKey.currentState.validate()){
                      formKey.currentState.save();
                      _createUser(em: email, pw: password);
                    }
                  },
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFFB5E8FF),
                  child: Text(
                    "COMPLETE SIGN UP",
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

          ],),
        ),


        // Go Back
        Align(
          alignment: Alignment(0,0.8),
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







      ]),

    );











  }
}
