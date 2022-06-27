import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './pages/social_login.dart' as social_login;

class App extends StatelessWidget {
  const App({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(), //firebase 초기화
      builder: (context, snapshot) {
        //firebase core 연결이 비정상일 떄
        if (snapshot.hasError) {
          return Center(
            child: Text("Firebase load fail"));
        }
        //firebase core 연결이 정상일 때
        else if (snapshot.connectionState == ConnectionState.done) {
          return social_login.SocialLogin();
        }
        return CircularProgressIndicator();
      },
    );
  }
}


