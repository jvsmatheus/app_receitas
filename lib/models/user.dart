// lib/models/user.dart
import 'package:app_receitas/models/recipe.dart';

class UserModel {

  String? id;
  String? authId;
  String? name;
  String? email;
  String? password;
  List<String>? favorites;

  UserModel({
    this.id,
    this.authId,
    this.name,
    this.email,
    this.password,
    this.favorites,
  });

  UserModel.fromJson(Map<String, Object?> json) :
    this(
        id: json['id']! as String,
        authId: json['authId']! as String,
        name: json['name']! as String,
        email: json['email']! as String,
        password: json['password']! as String,
        favorites: (json['favorites'] as List<dynamic>? ?? []).cast<String>(),
    );

  // UserModel copyWith({
  //   String? name,
  //   String? email,
  //   String? password,
  //   List<String>? favorites,
  // }) {
  //   return UserModel(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     password: password ?? this.password,
  //     favorites: favorites ?? this.favorites
  //   );
  // }

  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'authId': authId,
    'name': name,
    'email': email,
    'password': password,
    'favorites': favorites,
  };
}

  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, password: $password, favorites: $favorites}';
  }
}

