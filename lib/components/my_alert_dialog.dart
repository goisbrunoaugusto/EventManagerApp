import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  var title;
  var content;
  final List<Widget> actions;

  MyAlertDialog({
    this.title,
    this.content,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        this.title,
      ),
      actions: actions,
      content: Text(
        content,
      ),
    );
  }
}
