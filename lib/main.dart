import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firechat/screens/welcome_screen.dart';
import 'package:firechat/screens/login_screen.dart';
import 'package:firechat/screens/registration_screen.dart';
import 'package:firechat/screens/chat_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    FireChat(),
    // routes: {
    //   WelcomeScreen.id: (context) => WelcomeScreen(),
    //   LoginScreen.id: (context) => LoginScreen(),
    //   RegistrationScreen.id: (context) => RegistrationScreen(),
    //   ChatScreen.id: (context) => ChatScreen(),
    // },
  );
}

class FireChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}