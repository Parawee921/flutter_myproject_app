import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myproject_app/character_page.dart';
import 'package:flutter_myproject_app/home_page.dart';
import 'package:flutter_myproject_app/ss1ss2_page.dart';
import 'package:flutter_myproject_app/start_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StartPage()
    );
  }
}
