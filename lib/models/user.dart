// lib/models/user.dart
import 'package:app_receitas/models/recipe.dart';

class UserModel {

  String name;
  String email;
  String password;
  List<String> favorites;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.favorites,
  });

  UserModel.fromJson(Map<String, Object?> json) :
    this(
        name: json['name']! as String,
        email: json['email']! as String,
        password: json['password']! as String,
        favorites: (json['favorites'] as List<dynamic>? ?? []).cast<String>(),
    );

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    List<String>? favorites,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      favorites: favorites ?? this.favorites
    );
  }

  Map<String, Object> toJson() {
    return {
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

