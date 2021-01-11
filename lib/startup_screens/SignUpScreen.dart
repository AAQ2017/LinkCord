import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:linkcord_app/role_screen/LinkRoleScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController confirmEmailInputController;
  TextEditingController passwordInputController;
  TextEditingController confirmPasswordInputController;

  User currentFireBaseUser = FirebaseAuth.instance.currentUser;
 // String currentFireBaseUserID = FirebaseAuth.instance.currentUser.uid;
  //String currentFireBaseUserName = FirebaseAuth.instance.currentUser.displayName;
  //String currentFireBaseUserEmail = FirebaseAuth.instance.currentUser.email;

  @override
  void initState() {
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    confirmEmailInputController = new TextEditingController();
    passwordInputController = new TextEditingController();
    confirmEmailInputController = new TextEditingController();
    super.initState();
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

        Container(
          color: Color(0xFF39556D), // Navy Blue/Dark Blue Color
        ),

        Container(
          child: Align(
            alignment: Alignment(0,-0.9),
            child: Image.asset(
              "assets/images/Logo.png",
            ),
          ),
        ),


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


        Form(
          key: _signupFormKey,
          child: Stack(children: <Widget>[
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

                  controller: nameInputController,

                  validator: (value) {
                    if (value.length < 2) {
                      return "Please enter a valid name";
                    } else {
                      return "null";
                    }
                  },


                ),
              ),
            ),


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

                  controller: emailInputController,
                  validator: emailValidator,


                ),
              ),
            ),


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





                ),
              ),
            ),


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
                  controller: passwordInputController,
                  validator: passwordValidator,

                ),
              ),
            ),


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

                  controller: confirmPasswordInputController,
                  validator: passwordValidator,

                ),
              ),
            ),



            Align(
              alignment: Alignment(0,0.7),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                width: MediaQuery.of(context).size.width * 0.15,
                child: RaisedButton(
                  elevation: 5,
                  onPressed: (){
                    if (_signupFormKey.currentState.validate()) {
                      if ((emailInputController.text == confirmEmailInputController.text)
                      & (passwordInputController.text == confirmPasswordInputController.text)) {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailInputController.text, password: passwordInputController.text)
                            .then((currentFireBaseUser) => FirebaseFirestore.instance.collection("users")
                            .doc(currentFireBaseUser.user.uid)
                            .set({"uid":currentFireBaseUser.user.uid, "display name": nameInputController.text,
                          "email (.edu)": emailInputController.text})
                            .then((result) => {Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => LinkRoleScreen()), (_) => false),
                          nameInputController.clear(),
                          emailInputController.clear(),
                          confirmEmailInputController.clear(),
                          passwordInputController.clear(),
                          confirmPasswordInputController.clear()})
                            .catchError((err) => print(err)))
                            .catchError((err) => print(err))
                            .catchError((err){
                              print(err.code);
                              if (err.code == "ERROR_EMAIL_ALREADY_IN_USE"){
                                showCupertinoDialog(context: context, builder: (context) {
                                  return AlertDialog(
                                    title: Text("Email in Use"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                  },
                                );
                              };
                              },
                        );
                      }
                    };
                  },
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFFB5E8FF),
                  child: Text(
                    "SIGN UP",
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
        )







      ]),

    );











  }
}
