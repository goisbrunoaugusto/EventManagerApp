import 'package:flutter/material.dart';
import 'package:projeto_eventos/pages/home_page.dart';
import 'package:projeto_eventos/pages/register_page.dart';
import '../components/my_textfield.dart';
import '../components/my_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  void navigateRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  void navigateHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste login',
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                    hintText: 'Digite seu email',
                    obscuredText: false,
                    controller: usernameController),
                MyTextField(
                    hintText: 'Digite sua senha',
                    obscuredText: true,
                    controller: passwordController),
                const SizedBox(
                  height: 25,
                ),
                MyButton(buttonText: 'Log in', buttonFunction: navigateHome),
                const SizedBox(
                  height: 25,
                ),
                MyButton(
                    buttonText: 'Registrar', buttonFunction: navigateRegister),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
