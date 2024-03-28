import 'package:flutter/material.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            MyTextField(
              hintText: 'Digite seu nome',
              obscuredText: false,
            ),
            MyTextField(
              hintText: 'Digite seu email',
              obscuredText: false,
            ),
            MyTextField(
              hintText: 'Digite sua senha',
              obscuredText: true,
            ),
            MyTextField(
              hintText: 'Digite seu telefone',
              obscuredText: false,
            ),
            MyTextField(
              hintText: 'Digite seu endereco',
              obscuredText: false,
            ),
            MyTextField(
              hintText: 'Digite seu cpf',
              obscuredText: false,
            ),
          ]),
        ),
      ),
    );
  }
}
