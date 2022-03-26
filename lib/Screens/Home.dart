// ignore_for_file: prefer_const_constructors

import 'package:fnb/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fnb/constants.dart';

enum SingingCharacter { debit, credit }

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cc = "";
  String dropValue = "ICICI";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  SingingCharacter? _character = SingingCharacter.debit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () {
                _auth.signOut();
                print("Signout");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Choose type of card:",
                style: TextStyle(fontSize: 15),
              ),
              ListTile(
                title: const Text('Debit'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.debit,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Credit'),
                leading: Radio<SingingCharacter>(
                  value: SingingCharacter.credit,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  Text(
                    "Choose bank:",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: dropValue,
                    items: <String>['ICICI', 'Axis', 'HDFC', 'PNB']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        dropValue = val!;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
