import 'package:app_receitas/repositories/user_repository.dart';
import 'package:app_receitas/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}


class AuthService extends ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;
  var service = UserService();

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = user;
      isLoading = false;
      notifyListeners();
      print('chegou');
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
    print('chegou 2');
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      service.createUser()

      _getUser();
    } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          throw AuthException('Senha muito fraca');
        }
        if (e.code == 'email-already-in-use') {
          throw AuthException('E-mail já cadastrado');
        }
        if (e.code == 'channel-error') {
          throw AuthException('Tenha certaza que preencheu todos os campos');
        }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-credential' || e.code == 'invalid-email') {
        throw AuthException('E-mail e/ou senha incorretos');
      }

    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
