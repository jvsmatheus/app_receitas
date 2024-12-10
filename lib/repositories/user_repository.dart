import 'package:app_receitas/models/user.dart';

class UserRepository {
  static final List<UserModel> table = [
    UserModel(
      name: "Matheus",
      email: "matheus@gmail.com",
      password: "12345",
      favorites: [
      ],
    ),
    UserModel(
      name: "Gustavo",
      email: "gustavo@gmail.com",
      password: "12345",
      favorites: [
      ],
    ),
     UserModel(
      name: "teste",
      email: "teste@gmail.com",
      password: "12345",
      favorites: [
      ],
    ),
  ];
}
