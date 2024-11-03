import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/repositories/recipe_repository.dart';

class UserRepository {
  static final List<User> table = [
    User(
      id: 1,
      name: "Matheus",
      email: "matheus@gmail.com",
      password: "12345",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      favorites: [
      ],
    ),
    User(
      id: 2,
      name: "Gustavo",
      email: "gustavo@gmail.com",
      password: "12345",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      favorites: [
      ],
    ),
  ];
}
