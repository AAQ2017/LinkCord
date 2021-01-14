import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class LinkRoleScreen extends StatefulWidget {
  @override
  _LinkRoleScreenState createState() => _LinkRoleScreenState();
}

class _LinkRoleScreenState extends State<LinkRoleScreen> {
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


      ],),
    );
  }
}
