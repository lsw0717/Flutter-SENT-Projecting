import 'package:flutter/material.dart';
import 'package:myapp/style.dart' as style;

class UserIfoRegi extends StatelessWidget {
  const UserIfoRegi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('유저 정보 등록 페이지 IS NOT USER'),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '팀장이신가요?',
                  style: style.text2,
                ),
                ElevatedButton(
                  child: Text('예'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/team_regi');
                  },
                ),
                ElevatedButton(
                  child: Text('아니요'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/user_regi');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
