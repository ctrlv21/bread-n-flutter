import 'package:fnb/Screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fnb/Screens/welcome_screen.dart';
import 'package:fnb/Screens/login_screen.dart';
import 'package:fnb/Screens/registration_screen.dart';
// import 'package:fnb/Screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  //necessary for firebase initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context)=>LoginScreen(),
        WelcomeScreen.id: (context)=>const WelcomeScreen(),
        RegistrationScreen.id: (context)=>RegistrationScreen(),
        // ChatScreen.id: (context)=>ChatScreen(),
      },
      home: Wrapper(),
    );
  }
}