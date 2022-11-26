import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nachoo/common/colors.dart';
import 'package:nachoo/home/homepage.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nachoo',
      theme: ThemeData(
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(backgroundColor: whitecolor),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple
        ),
      ),
      home: HomePage(),
    );
  }
}