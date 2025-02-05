import 'dart:convert';
import 'package:app_receitas/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  // URL base da API
  static const String _baseUrl = 'https://67941aa25eae7e5c4d90bf49.mockapi.io/receitas';

  Future<List<Recipe>> getRecipes() async {
  final response = await http.get(Uri.parse(_baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> decodedJson = jsonDecode(response.body);
    List<Recipe> recipes = decodedJson.map((recipe) => Recipe.fromJson(recipe)).toList();
    return recipes;
  } else {
    throw Exception('Failed to load recipes');
  }
}

  Future<List<dynamic>> getRecipesByIds(List<int> ids) async {
    List<Future<dynamic>> requests = ids.map((id) => getRecipeById(id)).toList();
  
    return await Future.wait(requests);
  }

  Future<dynamic> getRecipeById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recipe with ID: $id');
    }
  }


  // getRecipeFavorites(List<String> favorites) async {
  //   if (favorites.isEmpty) {
  //     return [];
  //   }

  //   final uri = Uri.parse("$_baseUrl?${_buildQueryParams(favorites)}");

  //   final response = await http.get(uri, headers: {"Content-Type": "application/json"});

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Falha ao carregar favoritos');
  //   }
  // }

  // // Função auxiliar para criar query params
  // _buildQueryParams(List<String> favorites) {
  //   return favorites.map((id) => "id=$id").join("&");
  // }

  createRecipe(Map<String, dynamic> recipes) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(recipes),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create recipes');
    }
  }

  // updateRecipe(int id, Map<String, dynamic> recipes) async {
  //   final response = await http.put(
  //     Uri.parse('$_baseUrl/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(recipes),
  //   );

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to update recipes');
  //   }
  // }

  // deleteRecipe(int id) async {
  //   final response = await http.delete(Uri.parse('$_baseUrl/$id'));

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to delete recipes');
  //   }
  // }
}