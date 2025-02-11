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
  Map<String, bool> ingredientCheckStatus = {};

  @override
  void initState() {
    super.initState();
    if (widget.recipe.ingredients != null) {
      for (var ingredient in widget.recipe.ingredients!) {
        ingredientCheckStatus[ingredient] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.recipe.title ?? "Receita"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem da receita
              SizedBox(
                width: double.infinity,
                height: 180,
                child: widget.recipe.imgUrl != null &&
                        widget.recipe.imgUrl!.isNotEmpty
                    ? Image.network(
                        widget.recipe.imgUrl!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/placeholder.jpg',
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
              if (widget.recipe.ingredients != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: widget.recipe.ingredients!.map((text) {
                      return Row(
                        children: [
                          Checkbox(
                            value: ingredientCheckStatus[text] ?? false,
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
                                color: (ingredientCheckStatus[text] ?? false)
                                    ? Colors.grey
                                    : Colors.black87,
                                decoration:
                                    (ingredientCheckStatus[text] ?? false)
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
              if (widget.recipe.preparationMethod != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: widget.recipe.preparationMethod!
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key + 1;
                      String text = entry.value;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$index.",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
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
