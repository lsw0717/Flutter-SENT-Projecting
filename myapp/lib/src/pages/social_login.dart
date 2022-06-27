import 'package:flutter/material.dart';
import './google_login.dart' as google_login;
import './kakao_login.dart' as kakao_login;
import './app_login.dart' as app_login;

class SocialLogin extends StatelessWidget {
  const SocialLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Social Login Page'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              kakao_login.KakaoLogin(),
              google_login.GoogleLogin(),
              app_login.AppLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
