import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1, // Adiciona uma borda sutil para destacar o AppBar
      centerTitle: true, // Centraliza o título no AppBar
      title: const Text(
        "SaborCraft",
        style: TextStyle(
          fontWeight: FontWeight.bold, // Fonte negrito
          color: Colors.black, // Deixa o título na cor preta
        ),
      ),
    );
  }

  // Sobrescreve preferredSize para definir o tamanho preferido
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
