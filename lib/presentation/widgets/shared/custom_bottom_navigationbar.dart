import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
   // final color = Theme.of(context).colorScheme;
    return  BottomNavigationBar(
      elevation: 0,
     // backgroundColor: color.secondary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: "Películas",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: "Favoritas",
        ),
      ]);
  }
}