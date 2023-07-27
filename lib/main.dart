//import 'package:projek/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:projek/pages/splash_screen.dart';

import 'package:projek/pages/login_page.dart';

import 'package:projek/pages/about_page.dart';

import 'package:projek/pages/add_page.dart';

import 'package:projek/pages/token.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // for development uncoment this line below
      home: SplashScreen(),
      //home: AddPage(),
      // home: LoginPage(),
    );
  }
}
