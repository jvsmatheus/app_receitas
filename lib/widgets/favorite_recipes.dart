import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/pages/recipe.dart';
import 'package:app_receitas/repositories/recipe_repository.dart';
import 'package:app_receitas/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class FavoriteRecipes extends StatefulWidget {
  const FavoriteRecipes({super.key});

  @override
  State<FavoriteRecipes> createState() => _FavoriteRecipesState();
}

class _FavoriteRecipesState extends State<FavoriteRecipes> {

   recipeDetails(Recipe recipe) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => RecipePage(recipe: recipe)));
  }

  @override
  Widget build(BuildContext context) {
    final repository = RecipeRepository.table;

    return ListView.separated(
      itemBuilder: (BuildContext context, int recipe) {
        return ListTile(
          leading: SizedBox(
            width: 110, // Defina uma largura fixa para a imagem
            child: Image.asset(
              repository[recipe].image,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            repository[recipe].name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(repository[recipe].type),
          trailing: const FavoriteButton(),
          onTap: () => recipeDetails(repository[recipe]),
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      separatorBuilder: (_, __) => const Divider(
        indent: 10,
        endIndent: 10,
      ),
      itemCount: repository.length,
    );
  }
}
