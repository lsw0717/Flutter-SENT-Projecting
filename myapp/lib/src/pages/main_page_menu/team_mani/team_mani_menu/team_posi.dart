import 'package:flutter/material.dart';

class TeamPosi extends StatelessWidget {
  const TeamPosi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () {}),
      body: Text('팀 전술판'),
    );
  }
}
