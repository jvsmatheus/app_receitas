import 'package:app_receitas/pages/home.dart';
import 'package:app_receitas/pages/login.dart';
import 'package:app_receitas/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {

    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      print("loading");
      return loading();
    } else if(auth.usuario == null) {
      print("login");
      return LoginPage();
    } else {
      print("home");
      return HomePage();
    }
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
