import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  final Recipe recipe;

  const FavoriteButton({super.key, required this.recipe});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _isFavorited = userProvider.user?.favorites.contains(widget.recipe) ?? false;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.toggleFavorite(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
