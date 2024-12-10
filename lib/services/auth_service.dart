import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {

  Future<void> signup({
    required String email,
    required String password,
    required String name,
    String? description,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user's UID
      String uid = userCredential.user!.uid;

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