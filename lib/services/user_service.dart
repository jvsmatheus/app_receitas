import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  // URL base da API
  static const String _baseUrl =
      'https://67941aa25eae7e5c4d90bf49.mockapi.io/usuarios';

  getUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  getUserById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

  getUserByAuthId(String authId) async {
    final response = await http.get(Uri.parse('$_baseUrl?authId=$authId'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load user');
    }
  }

  getUserFavorites(List<String> favorites) async {
    if (favorites.isEmpty) {
      return [];
    }

    final uri = Uri.parse(
        "https://67941aa25eae7e5c4d90bf49.mockapi.io/usuarios?${_buildQueryParams(favorites)}");

    final response =
        await http.get(uri, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar favoritos');
    }
  }

  // Função auxiliar para criar query params
  _buildQueryParams(List<String> favorites) {
    return favorites.map((id) => "id=$id").join("&");
  }

  createUser(Map<String, dynamic> user) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user');
    }
  }

  updateUser(int id, Map<String, dynamic> user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

  updateImgUrlUser(int id, String downloadUrl) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({"imgUrl": downloadUrl}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user');
    }
  }

  deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
