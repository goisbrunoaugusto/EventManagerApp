import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_eventos/components/my_alert_dialog.dart';
import 'package:projeto_eventos/model/user_model.dart';
import 'package:projeto_eventos/pages/home_page.dart';
import 'package:projeto_eventos/pages/register_page.dart';
import 'package:projeto_eventos/components/my_textfield.dart';
import 'package:projeto_eventos/components/my_button.dart';
import "package:projeto_eventos/service/navigation.dart";

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

  Future<UserRequestModel> loginUserJson(
      String username, String password) async {
    var url = Uri.parse("http://10.0.2.2:8080/auth/login");
    var response = await http.post(url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(<String, dynamic>{
          "username": username,
          "password": password,
        }));
    final reponseJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/');
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return MyAlertDialog(
                title: 'Backend Response', content: response.body);
          });
    }
    return reponseJson;
  }

  void navigateRegister() async {
    Navigator.pushNamed(context, '/register');
  }

  void validation() {
    loginUserJson(usernameController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MyButton(buttonText: 'Log in', buttonFunction: validation),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  buttonText: 'Registrar', buttonFunction: navigateRegister),
            ],
          ),
        ),
      ),
    );
  }
}
