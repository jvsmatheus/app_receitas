import 'package:flutter/material.dart';
import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/models/recipe.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool get isLoggedIn => _user != null;

  // void toggleFavorite(Recipe recipe) {
  //   print(_user);
  //   if (_user != null) {
  //     if (_user!.favorites.contains(recipe)) {
  //       _user!.favorites.remove(recipe);
  //     } else {
  //       _user!.favorites.add(recipe);
  //     }
  //     notifyListeners();
  //   }
  // }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}
