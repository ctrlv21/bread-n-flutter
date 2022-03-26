import 'package:fnb/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fnb/Constants/constants.dart';
class Home extends StatelessWidget {

  String cc="";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          TextField(
            obscureText: true,
            obscuringCharacter: '*',
            textAlign: TextAlign.center,
            onChanged: (value) {
              cc = value;
            },
            decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your credit card no.'),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Logout"),
              onPressed: (){
                _auth.signOut();
                print("Signout");
                Navigator.push(context,MaterialPageRoute(builder: (context)=>WelcomeScreen()));
              },
            ),
          ),
        ],
      )
    );
  }
}
