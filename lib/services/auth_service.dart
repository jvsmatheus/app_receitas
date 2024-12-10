import 'package:app_receitas/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthService {
  Future<void> signup(
      {required String email,
      required String password,
      required String name,
      String? description,
      required BuildContext context}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await Future.delayed(const Duration(seconds: 1));

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
      print("Teste");
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

      await Future.delayed(const Duration(seconds: 1));

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
      print("Teste");
    } catch (e) {
      print(e);
    }
  }
}
