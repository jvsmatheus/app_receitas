import 'package:app_receitas/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaborCraft',
      theme: ThemeData(
        fontFamily: 'DM-Serif-Display',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: HomePage(),
      ),
    );
  }
}
 