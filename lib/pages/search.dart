import 'package:app_receitas/widgets/app_bar.dart';
import 'package:app_receitas/widgets/menu_bar.dart';
import 'package:app_receitas/widgets/recipe_card.dart';
import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar"),
      ),
      body: const Center(
        child: Text("Tela de Pesquisa"),
      ),
      bottomNavigationBar: const MenuBarCustom(), // Adiciona o MenuBarCustom
    );
  }
}
