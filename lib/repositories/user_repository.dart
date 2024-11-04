import 'package:app_receitas/models/user.dart';

class UserRepository {
  static final List<User> table = [
    User(
      name: "Matheus",
      email: "matheus@gmail.com",
      password: "12345",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      favorites: [
      ],
    ),
    User(
      name: "Gustavo",
      email: "gustavo@gmail.com",
      password: "12345",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      favorites: [
      ],
    ),
     User(
      name: "teste",
      email: "teste@gmail.com",
      password: "12345",
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      favorites: [
      ],
    ),
  ];
}
