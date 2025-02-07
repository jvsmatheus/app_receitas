import 'package:app_receitas/services/image_service.dart';
import 'package:app_receitas/services/user_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/models/recipe.dart';
import 'package:app_receitas/pages/recipe.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:app_receitas/services/auth_service.dart';
import '../widgets/auth_check.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  final imageService = ImageService();
  final userService = UserService();

  bool _isUploading = false;

  _pickImage(UserModel user) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selecionar imagem"),
          content: const Text("Deseja tirar uma foto ou escolher da galeria?"),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final XFile? file = await imageService.getImage('camera');
                if (file != null) {
                  setState(() {
                    _isUploading = true;
                  });

                  UploadTask task = await imageService.upload(file.path);
                  task.snapshotEvents.listen((TaskSnapshot snapshot) async {
                    if (snapshot.state == TaskState.running) {
                      print("Upload em andamento...");
                    }

                    if (snapshot.state == TaskState.success) {
                      var updatedUser = await userService.updateImgUrlUser(
                          int.parse(user.id!),
                          await imageService.getImageDownloadUrl(
                              task.snapshot.metadata!.fullPath));

                      print(updatedUser);
                      setState(() {
                        _isUploading = false;
                      });
                    }

                    if (snapshot.state == TaskState.error) {
                      print("Erro no upload");
                      setState(() {
                        _isUploading = false;
                      });
                    }
                  });
                }
              },
              child: const Text("Tirar Foto"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                final XFile? file = await imageService.getImage('gallery');
                if (file != null) {
                  setState(() {
                    _isUploading = true;
                  });

                  UploadTask task = await imageService.upload(file.path);
                  task.snapshotEvents.listen((TaskSnapshot snapshot) async {
                    if (snapshot.state == TaskState.running) {
                      print("Upload em andamento...");
                    }

                    if (snapshot.state == TaskState.success) {
                      var updatedUser = await userService.updateImgUrlUser(
                          int.parse(user.id!),
                          await imageService.getImageDownloadUrl(
                              task.snapshot.metadata!.fullPath));

                      print(updatedUser);
                      setState(() {
                        _isUploading = false;
                      });
                    }

                    if (snapshot.state == TaskState.error) {
                      print("Erro no upload");
                      setState(() {
                        _isUploading = false;
                      });
                    }
                  });
                }
              },
              child: const Text("Escolher da Galeria"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userModel = Provider.of<AuthService>(context).userModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              context.read<AuthService>().logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AuthCheck()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: userModel?.imgUrl != null &&
                            userModel!.imgUrl!.isNotEmpty
                        ? NetworkImage(userModel.imgUrl!)
                        : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  IconButton(
                    onPressed: () => _pickImage(userModel!),
                    icon: Icon(Icons.photo_camera),
                  ),
                  if (_isUploading)
                    Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    userModel?.name ?? "Usuário",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Receitas favoritas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: userModel?.favorites != null &&
                      userModel!.favorites!.isNotEmpty
                  ? ListView.builder(
                      itemCount: userModel.favorites?.length,
                      itemBuilder: (context, index) {
                        return Container(); // Implementação do item
                      },
                    )
                  : const Center(
                      child: Text(
                        'Nenhuma receita favorita encontrada.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
