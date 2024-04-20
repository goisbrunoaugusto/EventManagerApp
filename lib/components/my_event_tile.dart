import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String description;

  const EventTile({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(43, 168, 168, 168),
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
