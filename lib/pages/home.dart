import 'package:app_receitas/widgets/app_bar.dart';
import 'package:app_receitas/widgets/menu_bar.dart';
import 'package:app_receitas/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int t = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  child: Text(
                    "RECEITAS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Favoritos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height:
                        500, // Defina a altura desejada para o container de ListView
                    child: ListView.separated(
                      itemCount: 4, // Número de RecipeCards
                      itemBuilder: (context, index) {
                        return const RecipeCard();
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                            height: 20); // Espaço entre os cards
                      },
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MenuBarCustom(),
    );
  }
}
