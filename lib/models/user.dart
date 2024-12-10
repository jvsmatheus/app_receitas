// lib/models/user.dart
import 'package:app_receitas/models/recipe.dart';

class UserModel {

  late final String id;
  final String name;
  final String email;
  final String password;
  final List<Recipe> favorites;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.favorites = const [], 
  });
}

