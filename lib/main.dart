import 'package:flutter/material.dart';
import 'package:projeto_eventos/pages/login_page.dart';
import 'package:projeto_eventos/pages/home_page.dart';
import 'package:projeto_eventos/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const LoginPage(), routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => const HomePage(),
      '/register': (BuildContext context) => const RegisterPage(),
    });
  }
}
