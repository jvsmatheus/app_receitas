import 'package:app_receitas/pages/home.dart';
import 'package:app_receitas/pages/login.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_receitas/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AuthService {

  Future<void> signup(
      {required String email,
      required String password,
      required String name,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1));

      final newUser = UserModel(
        email: email,
        name: name,
        password: password,
      );
      
      print(newUser.toString());

      Provider.of<UserProvider>(context,listen: false).setUser(newUser);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));

      // Get the user's UID
      // String uid = userCredential.user!.uid;

      // Create a user document in Cloud Firestore
      // await FirebaseFirestore.instance.collection('users').doc(uid).set({
      //   'name': name,
      //   'description': description,
      //   // Add other custom fields
      // });
    } on FirebaseAuthException catch (e) {
        print(e.code);
        String message = '';
        if (e.code == 'weak-password') {
          message = 'Senha muito fraca';
        }
        if (e.code == 'email-already-in-use') {
          message = 'E-mail já cadastrado';
        }
        if (e.code == 'channel-error') {
          message = 'Tenha certaza que preencheu todos os campos';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signin({
        required String email,
        required String password,
        required BuildContext context
      }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final currentUser = FirebaseAuth.instance.currentUser;
      print(currentUser);


      await Future.delayed(const Duration(seconds: 1));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()
          )
      );

      // Get the user's UID
      // String uid = userCredential.user!.uid;

      // Create a user document in Cloud Firestore
      // await FirebaseFirestore.instance.collection('users').doc(uid).set({
      //   'name': name,
      //   'description': description,
      //   // Add other custom fields
      // });
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-credential' || e.code == 'invalid-email') {
        message = 'E-mail e/ou senha incorretos';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> signout({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()
        )
    );
  }
}
