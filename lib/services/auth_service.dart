import 'package:app_receitas/models/user.dart';
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
  UserModel? userModel;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    if (usuario != null) {
    _getUserModel(usuario!.uid);
    }
    notifyListeners();
  }

 _getUserModel(String authId) async {
  var userModelResponse = await service.getUserByAuthId(authId);

  if (userModelResponse.isNotEmpty) {
    var userData = userModelResponse[0]; // Pega o primeiro item da lista (um mapa)

    var newUser = UserModel(
      authId: userData['authId'], // Acesse os valores do mapa corretamente
      name: userData['name'],
      email: userData['email'],
      password: userData['password'],
      favorites: List<String>.from(userData['favorites']), // Garante que seja uma lista de String
    );

    print(newUser);
    userModel = newUser; // Atualiza o estado do usuário
    notifyListeners(); // Notifica a UI para atualizar
  } else {
    print("Usuário não encontrado!");
  }
}


  register(String name, String email, String password) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      var newUser = UserModel(
      authId: user.user?.uid,
      name: name,
      email: email,
      password: password,
      favorites: [],
      );
      
      service.createUser(newUser.toJson());
      

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
