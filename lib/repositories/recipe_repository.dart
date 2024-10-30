import 'package:app_receitas/models/recipe.dart';

class RecipeRepository {
  static List<Recipe> table = [
    Recipe(
      name: "Frango Agridoce",
      ingredients: [
        "500g de peito de frango em cubos",
        "1 pimentão vermelho fatiado",
        "1 pimentão verde fatiado",
        "1 cebola cortada em pedaços grandes",
        "1 cenoura fatiada",
        "1 abacaxi em pedaços",
        "2 colheres de sopa de molho de soja",
        "2 colheres de sopa de vinagre de arroz",
        "3 colheres de sopa de ketchup",
        "2 colheres de sopa de açúcar",
        "1 colher de chá de amido de milho",
        "sal e pimenta a gosto",
      ],
      prepare: [
        "1. Tempere o frango com sal e pimenta",
        "2. Em uma frigideira grande, aqueça um pouco de óleo e refogue o frango até dourar",
        "3. Adicione os pimentões, a cebola, a cenoura e refogue por mais alguns minutos",
        "4. Em uma tigela, misture o molho de soja, vinagre, ketchup, açúcar e amido de milho",
        "5. Adicione o abacaxi e a mistura de molho à frigideira",
        "6. Cozinhe até que o molho engrosse e cubra bem os ingredientes",
        "7. Sirva quente"
      ],
      image: "assets/images/recipes/frango-agridoce.jpg",
      type: "Agridoce",
    )
  ];
}
