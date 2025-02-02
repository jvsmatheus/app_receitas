import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EnvProvider with ChangeNotifier {
  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  Future<void> fetchImageUrl(String path) async {
    try {
      String url = await FirebaseStorage.instance.ref(path).getDownloadURL();
      _imageUrl = url;
      notifyListeners();
    } catch (e) {
      print("Erro ao carregar imagem: $e");
      _imageUrl = null;
    }
  }
}
