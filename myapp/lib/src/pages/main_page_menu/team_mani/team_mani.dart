import 'package:flutter/material.dart';
import 'team_mani_menu/team_intro.dart' as team_intro;
import 'team_mani_menu/team_posi.dart' as team_posi;


class TeamMani extends StatefulWidget {
  const TeamMani({Key? key}) : super(key: key);

  @override
  State<TeamMani> createState() => _TeamManiState();
}

class _TeamManiState extends State<TeamMani> {
  var tab = 0; //bottomNavigationBar 화면 전환에 쓰이는 state
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future(()=>false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('팀 관리'),
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/main_page');
                })
          ],
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
                decoration: BoxDecoration(color: Colors.amber),
              ),
              ListTile(
                title: Text('팀 관리'),
                trailing: Icon(Icons.navigate_next),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: [team_intro.TeamIntro(), team_posi.TeamPosi()][tab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels:false,
          currentIndex: tab,
          onTap: (i){
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: '팀 소개',
            activeIcon: Icon(Icons.account_box)),
            BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined),
                label: '전술판',
                activeIcon: Icon(Icons.article_outlined)),

          ],
        ),
      ),
    );
  }
}
