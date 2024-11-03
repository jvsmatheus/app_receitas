import 'package:app_receitas/models/user.dart';

class UserRepository {
  static List<User> table = [
    User(
      id: 1,
      name: "Matheus",
      email: "matheus@gmail.com",
      password: "12345"
    ),
    User(
      id: 2,
      name: "Gustavo",
      email: "gustavo@gmail.com",
      password: "12345"
    ),
  ];
}
