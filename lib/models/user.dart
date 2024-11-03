// lib/models/user.dart
import 'package:app_receitas/models/recipe.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String description;
  final List<Recipe> favorites;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.description = '',
    this.favorites = const [], // Inicializa como lista vazia por padrão
  });
}
