import 'package:flutter/material.dart';
// import '../pages/profile.dart'; // Importe a página de perfil corretamente

class MenuBarCustom extends StatefulWidget {
  const MenuBarCustom({super.key});

  @override
  State<MenuBarCustom> createState() => _MenuBarCustomState();
}

class _MenuBarCustomState extends State<MenuBarCustom> {
  // int _currentIndex = 0;

  // Lista de telas para cada opção da bottom bar
  // final List<Widget> _screens = [
  //   const Center(child: Text('Home Screen')),
  //   const Center(child: Text('Profile Screen')),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   if (index == 1) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const Profile()), 
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}