import 'package:app_receitas/pages/home.dart';
import 'package:app_receitas/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final repository = UserRepository.table;
  bool _isPasswordVisible = false;

  void _authenticate() {
    String email = _emailController.text;
    String password = _passwordController.text;

    bool isAuthenticated = false;

    for (var item in repository) {
      if (email == item.email && password == item.password) {
        isAuthenticated = true;
        break;
      }
    }

    if (isAuthenticated) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha incorretos.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              // Campo de e-mail
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),

              // Campo de senha
              TextField(
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
              ),
              const SizedBox(height: 30),

              // Botão de Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _authenticate,
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 20),

              // Texto de "Esqueceu a senha?"
              TextButton(
                onPressed: () {
                  // Navegar para a página de recuperação de senha
                },
                child: const Text('Esqueceu a senha?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
