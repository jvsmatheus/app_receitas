import 'package:flutter/material.dart';
import '../pages/search.dart'; // Importe a sua página de pesquisa

class MenuBarCustom extends StatefulWidget {
  const MenuBarCustom({super.key});

  @override
  State<MenuBarCustom> createState() => _MenuBarCustomState();
}

class _MenuBarCustomState extends State<MenuBarCustom> {
  int _currentIndex = 0;

  // Lista de telas para cada opção da bottom bar
  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Menu')),
    const Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Verifica se o índice é o da página de pesquisa e navega para a SearchPage
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SearchPage()), // Substitua SearchPage pelo nome da sua página de pesquisa
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
