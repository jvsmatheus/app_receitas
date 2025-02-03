import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/repositories/user_repository.dart';
import 'package:app_receitas/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    var userData = userModelResponse[0];

    var newUser = UserModel(
      id: userData['id'],
      authId: userData['authId'],
      name: userData['name'],
      email: userData['email'],
      imgUrl: userData['imgUrl'],
      password: userData['password'],
      favorites: List<String>.from(userData['favorites']),
    );

    userModel = newUser;
    notifyListeners();
  } else {
    print("Usuário não encontrado!");
  }
}


  register(String name, String email, String password, String userImgRef) async {
  try {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    String? uid = user.user?.uid;

    if (uid == null) {
      throw AuthException("Erro ao obter o UID do usuário.");
    }

    String imgUrl = await FirebaseStorage.instance.ref(userImgRef).getDownloadURL();

    var newUser = UserModel(
      authId: uid,
      name: name,
      email: email,
      password: password,
      imgUrl: imgUrl,
      favorites: [],
    );

    await service.createUser(newUser.toJson());

    await _getUser();
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw AuthException('Senha muito fraca');
    }
    if (e.code == 'email-already-in-use') {
      throw AuthException('E-mail já cadastrado');
    }
    if (e.code == 'channel-error') {
      throw AuthException('Tenha certeza que preencheu todos os campos');
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
