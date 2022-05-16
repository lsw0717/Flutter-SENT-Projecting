import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import './style.dart' as style;
import './signin.dart' as signin;

void main() {
  //KakaoContext.clientId = '471360d9cc01e28f66ae693bc7b9cae7';
  KakaoSdk.init(nativeAppKey: '471360d9cc01e28f66ae693bc7b9cae7');
  runApp(MaterialApp(
    theme: style.theme,
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background.png'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              signin.SignIn(),
              ElevatedButton(onPressed: () {}, child: Text('key'))
            ],
          ),
        ),
      ),
    );
  }
}
