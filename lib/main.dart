import 'package:app_receitas/firebase_options.dart';
import 'package:app_receitas/pages/login.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:app_receitas/repositories/user_repository.dart';
import 'package:app_receitas/services/auth_service.dart';
import 'package:app_receitas/widgets/auth_check.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => UserRepository(auth: context.read<AuthService>())),
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
        child: AuthCheck(),
      ),
    );
  }
}
