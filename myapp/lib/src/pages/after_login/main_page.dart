import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메인 페이지 IS USESR'),),
      body: Column(children: [Text('메인페이지라고 라고라고')],),
    );
  }
}
