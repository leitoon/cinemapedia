
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavegation extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavegation({super.key, required this.currentIndex});
  void onItemTapped(BuildContext context, int index){
    switch(index){
      case 0:
      context.go('/home/0');
      break;
      case 1:
      context.go('/home/1');
      break;
      case 2:
      context.go('/home/2');
      break;
    }

    
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar
    (
      elevation: 0,
      selectedItemColor: colors.primary,
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context,value),

      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.thumbs_up_down_outlined),label: 'Populares'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Favoritos')
    ]);
  }
}