import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('메인 페이지'),
          actions: [IconButton(icon: Icon(Icons.home), onPressed: () {})],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('유저 이름'),
                accountEmail: Text('유저 이메일'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/img.png'),
                ),
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text('팀 관리'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  Navigator.pushNamed(context, '/team_mani');
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [Text('메인페이지라고 라고라고')],
        ),
      ),
    );
  }
}
