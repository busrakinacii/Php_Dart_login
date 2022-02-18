import 'package:flutter/material.dart';
import 'package:test_proje/detail_page.dart';
import 'package:test_proje/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(key: key),
      debugShowCheckedModeBanner: false,
    );
  }
}



