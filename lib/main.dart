import 'package:app_receitas/pages/login.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaborCraft',
      theme: ThemeData(
        // fontFamily: 'DM-Serif-Display',
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        child: LoginPage(),
      ),
    );
  }
}
