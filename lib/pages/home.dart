import 'package:app_receitas/widgets/app_bar.dart';
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
        ));
  }
}
