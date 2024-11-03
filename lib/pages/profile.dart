import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/pages/login.dart';
import 'package:app_receitas/pages/recipe.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    recipeDetails(Recipe recipe) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => RecipePage(recipe: recipe)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    // backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user?.name ?? 'Usuário',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    user?.description ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Receitas favoritas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            
            // Lista de Receitas Favoritas
            Expanded(
              child: user?.favorites.isNotEmpty == true
                  ? ListView.builder(
                      itemCount: user!.favorites.length,
                      itemBuilder: (context, index) {
                        final recipe = user.favorites[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(recipe.image),
                            ),
                            title: Text(recipe.name),
                            subtitle: Text(recipe.type),
                            onTap: () => recipeDetails(recipe),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'Nenhuma receita favorita encontrada.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
