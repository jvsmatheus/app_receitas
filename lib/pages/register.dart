import 'package:app_receitas/models/user.dart';
import 'package:app_receitas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      final newUser = User
      (
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text,
        description: _descriptionController.text,
      );
      Provider.of<UserProvider>(context,listen: false).setUser(newUser);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body:Center(
        child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Por favor, insira um email válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo de nome
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo de senha
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter ao menos 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo de descrição
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Botão de cadastro
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
