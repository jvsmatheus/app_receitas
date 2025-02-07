import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  final FirebaseStorage storage = FirebaseStorage.instance;

  getImageDownloadUrl(String imgRef) async {
    return imgRef.isNotEmpty
        ? await FirebaseStorage.instance.ref(imgRef).getDownloadURL()
        : '';
  }

  Future<UploadTask> upload(String path) async {
    File file = File(path);
    try {
      String ref = 'images/img-${DateTime.now().toString()}.jpg';
      return storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload: ${e.code}');
    }
  }

  Future<XFile?> getImage(String type) async {
    final ImagePicker _picker = ImagePicker();
    return type.contains('gallery')
        ? await _picker.pickImage(source: ImageSource.gallery)
        : await _picker.pickImage(source: ImageSource.camera);
  }
}
