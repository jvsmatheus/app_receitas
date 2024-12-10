import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/services/auth_service.dart';
import 'package:app_receitas/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository extends ChangeNotifier {

  late FirebaseFirestore db;
  late AuthService auth;
  late UserModel _user;

  UserRepository({ required this.auth }) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DatabaseService.get();
  }

  read() async {
    if (auth.usuario != null) {
      final snapshot = await db.collection('users').doc(auth.usuario!.uid).get();
      if (snapshot.exists) {
        UserModel userModel = UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        // Faça algo com o userModel, como atribuí-lo a uma variável ou exibi-lo na tela
        print(userModel.name); // Exemplo: exibindo o nome do usuário
      } else {
        print('Usuário não encontrado no banco de dados.');
      }
      notifyListeners();
    }
  }

  create(UserModel user) async {
    await db
      .collection('users')
      .doc(user.email)
      .set({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'favorites': user.favorites
    });
    notifyListeners();
  }

  remove(UserModel user) async {
    await db
        .collection('users')
        .doc(user.email)
        .delete();
  }
}
