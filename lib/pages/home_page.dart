import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_eventos/model/sport_event_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<dynamic> sportEventList = [];

  Future<SportEventModel?> fetchSportEvents() async {
    final response = await http.get(
        Uri.parse("http://10.0.2.2:8080/sport_events"),
        headers: <String, String>{
          'Authorization': "Bearer ${widget.token}",
        });
    if (response.statusCode == 200) {
      print("----------------------------- ENTROU NO RESPONSE 200");
      List<dynamic> responseJson = jsonDecode(response.body);
      setState(() {
        sportEventList = responseJson;
      });
    } else {
      throw Exception('Error fetching events');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSportEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  print("------------------------ ${sportEventList}");
                },
                child: Text('Botao pra printar')),
          ],
        ),
      ),
    );
  }
}
