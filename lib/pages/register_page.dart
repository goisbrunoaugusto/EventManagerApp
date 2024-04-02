import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_eventos/components/my_alert_dialog.dart';
import 'package:projeto_eventos/components/my_button.dart';
import 'package:projeto_eventos/model/user_model.dart';
import '../components/my_textfield.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

Future<UserModel> registerUserJson(String name, String password, String email,
    List roles, String phone, String cpf, BuildContext context) async {
  print("Entrou no registerUserJson");
  var url = Uri.parse("http://10.0.2.2:8080/auth/signup");
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, Object>{
        "username": name,
        "password": password,
        "email": email,
        "cpf": cpf ?? "",
        "phone": phone ?? "",
        "roles": roles,
      }));
  final responseJson = jsonDecode(response.body);
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return MyAlertDialog(
              title: 'Backend Response', content: response.body);
        });
  } else {
    throw Error;
  }
  return responseJson;
}

class _RegisterPageState extends State<RegisterPage> {
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cpfController = TextEditingController();
  final roleController = TextEditingController();

  void registerUser() {
    List<String> roles = [roleController.text];
    print("Entrou no registerUser");
    registerUserJson(
        usernameController.text,
        passwordController.text,
        emailController.text,
        roles,
        phoneController.text,
        cpfController.text,
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              MyTextField(
                hintText: 'Digite seu nome',
                obscuredText: false,
                controller: usernameController,
              ),
              MyTextField(
                hintText: 'Digite seu email',
                obscuredText: false,
                controller: emailController,
              ),
              MyTextField(
                hintText: 'Digite sua senha',
                obscuredText: true,
                controller: passwordController,
              ),
              MyTextField(
                hintText: 'Digite seu telefone',
                obscuredText: false,
                controller: phoneController,
              ),
              MyTextField(
                hintText: 'Digite seu endereco',
                obscuredText: false,
                controller: addressController,
              ),
              MyTextField(
                hintText: 'Digite seu cpf',
                obscuredText: false,
                controller: cpfController,
              ),
              MyTextField(
                hintText: 'Digite sua role',
                obscuredText: false,
                controller: roleController,
              ),
              MyButton(buttonText: 'Register', buttonFunction: registerUser),
            ]),
          ),
        ),
      ),
    );
  }
}
