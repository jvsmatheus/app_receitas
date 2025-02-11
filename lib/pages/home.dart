import 'package:app_receitas/pages/profile.dart';
import 'package:app_receitas/services/auth_service.dart';
import 'package:app_receitas/services/recipe_service.dart';
import 'package:app_receitas/services/user_service.dart';
import 'package:app_receitas/widgets/favorite_recipes.dart';
import 'package:app_receitas/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/models/recipe.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final recipeService = RecipeService();

  Future<List<Recipe>> _filteredRecipes = Future.value([]);

  @override
  void initState() {
    super.initState();
    _filteredRecipes = recipeService.getRecipes();
  }

  void _filterRecipes(String query) async {
    final allRecipes = await recipeService.getRecipes();
    setState(() {
      _filteredRecipes = Future.value(allRecipes.where((recipe) {
        return recipe.title!.toLowerCase().contains(query.toLowerCase());
      }).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<AuthService>(context).userModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SABORCRAFT"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const Profile()));
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Pesquisar...',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _filterRecipes(_searchController.text);
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    _filterRecipes(value);
                  },
                  onChanged: (value) {
                    _filterRecipes(value);
                  },
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: FutureBuilder<List<Recipe>>(
                future: _filteredRecipes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro ao carregar receitas'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhuma receita encontrada'));
                  } else {
                    return FavoriteRecipes(recipes: snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
