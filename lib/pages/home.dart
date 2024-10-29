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
  @override
  Widget build(BuildContext context) {

    return const Scaffold(
    appBar: AppBarCustom(),
    body: Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Text(
            "RECEITAS",
            style: TextStyle(
              fontSize: 24, // Aumenta o tamanho da fonte para dar destaque
              fontWeight: FontWeight.bold, // Deixa o texto negrito
              letterSpacing:
                  2, // Adiciona espaçamento entre as letras para um efeito estilizado
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    bottomNavigationBar: MenuBarCustom(),
    );


    return Scaffold(
      appBar: AppBarCustom(),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Flex(
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
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favoritos",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  ),
                  RecipeCard(),
                  RecipeCard(),
                  RecipeCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
