import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  final Recipe recipe;

  const RecipePage({super.key, required this.recipe});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  // Mapeia cada ingrediente para seu estado de checkbox (marcado ou não)
  Map<String, bool> ingredientCheckStatus = {};

  @override
  void initState() {
    super.initState();
    // Inicializa todos os ingredientes como desmarcados
    for (var ingredient in widget.recipe.ingredients) {
      ingredientCheckStatus[ingredient] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.name),
          elevation: 0, // Remove a sombra da AppBar
          actions: [FavoriteButton(recipe: widget.recipe,)],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem da receita
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Image.asset(
                  widget.recipe.image,
                  fit: BoxFit.cover,
                ),
              ),

              // Título "Ingredientes"
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 4.0, left: 15),
                child: Text(
                  "Ingredientes",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Lista de ingredientes com checkbox
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: widget.recipe.ingredients.map((text) {
                    return Row(
                      children: [
                        Checkbox(
                          value: ingredientCheckStatus[text],
                          onChanged: (bool? value) {
                            setState(() {
                              ingredientCheckStatus[text] = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              fontSize: 16,
                              color: ingredientCheckStatus[text]!
                                  ? Colors.grey
                                  : Colors.black87,
                              decoration: ingredientCheckStatus[text]!
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),

              // Título "Modo de Preparo"
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 4.0, left: 15),
                child: Text(
                  "Modo de Preparo",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Lista de etapas de preparo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: widget.recipe.prepare.map((text) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              text,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
