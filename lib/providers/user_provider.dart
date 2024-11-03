import 'package:flutter/material.dart';
import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/models/recipe.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void toggleFavorite(Recipe recipe) {
    if (_user != null) {
      if (_user!.favorites.contains(recipe)) {
        _user!.favorites.remove(recipe);
      } else {
        _user!.favorites.add(recipe);
      }
      notifyListeners();
    }
  }
}
