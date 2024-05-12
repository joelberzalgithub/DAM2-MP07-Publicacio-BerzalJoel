import 'package:flutter/material.dart';
import 'layout_characters.dart';
import 'layout_demons.dart';
import 'layout_menu.dart';
import 'layout_weapons.dart';

// Main application widget
class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

// Main application state
class AppState extends State<App> {
  // Definir el contingut del widget 'App'
  @override
  Widget build(BuildContext context) {
    // Farem servir la base 'Cupertino'
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LayoutMenu(),
      routes: {
        'menu': (context) => const LayoutMenu(),
        'info': (context) => const LayoutCharacters(),
        'demons': (context) => const LayoutDemons(),
        'weapons': (context) => const LayoutWeapons(),
      },
    );
  }
}
