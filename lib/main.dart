import 'package:flutter/material.dart';
import 'package:teste_001/jogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Jogo(),
          debugShowCheckedModeBanner: false,
    );
  }
}
