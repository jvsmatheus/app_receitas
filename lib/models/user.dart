// lib/models/user.dart
import 'package:app_receitas/models/recipe.dart';

class User {
  static int _idCounter = 0; 

  final int id;
  final String name;
  final String email;
  final String password;
  final String description;
  final List<Recipe> favorites;

  User({
    required this.name,
    required this.email,
    required this.password,
    this.description = '',
    this.favorites = const [], 
  }): id = _idCounter++; 
}

