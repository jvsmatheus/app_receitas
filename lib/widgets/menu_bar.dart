import 'package:flutter/material.dart';
import '../pages/search.dart';
import '../pages/profile.dart'; // Importe a página de perfil corretamente

class MenuBarCustom extends StatefulWidget {
  const MenuBarCustom({super.key});

  @override
  State<MenuBarCustom> createState() => _MenuBarCustomState();
}

class _MenuBarCustomState extends State<MenuBarCustom> {
  int _currentIndex = 0;

  // Lista de telas para cada opção da bottom bar
  final List<Widget> _screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Search Screen')),
    Center(child: Text('Menu')),
    Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navegação para a SearchPage quando o índice for 1
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    }

    // Navegação para a Profile quando o índice for 3
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()), // Chame a Profile corretamente
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 16,
      unselectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Pesquisar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
