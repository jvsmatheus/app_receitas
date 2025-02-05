import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/pages/recipe.dart';
import 'package:app_receitas/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class FavoriteRecipes extends StatefulWidget {
  final List<Recipe> recipes; // Recebe a lista de receitas para exibir

  const FavoriteRecipes({super.key, required this.recipes});

  @override
  State<FavoriteRecipes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteRecipes> {
  void recipeDetails(Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RecipePage(recipe: recipe)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final recipe = widget.recipes[index];
        return ListTile(
          leading: SizedBox(
            width: 110, // Define uma largura fixa para a imagem
            child: Image.asset(
              'assets/images/user.jpg',
              // recipe.image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            recipe.title!,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(recipe.type!),
          trailing: FavoriteButton(recipe: recipe),
          onTap: () => recipeDetails(recipe),
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      separatorBuilder: (_, __) => const Divider(
        indent: 10,
        endIndent: 10,
      ),
      itemCount: widget.recipes.length,
    );
  }
}
