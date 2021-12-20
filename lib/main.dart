import 'package:flutter/material.dart';
import 'home.dart';

//Fonction qui exécute le code
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAST END',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Appelle de la class HomePage du fichier home.dart
      home: const HomePage(),
    );
  }
}
