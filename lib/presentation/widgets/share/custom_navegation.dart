


import 'package:flutter/material.dart';

class CustomBottomNavegation extends StatelessWidget {
  const CustomBottomNavegation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar
    (
      elevation: 0,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.label_outline),label: 'Categorias'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Favoritos')
    ]);
  }
}