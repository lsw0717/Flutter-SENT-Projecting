import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import './style.dart' as style;
import './kakao_login.dart' as kakao_login;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Page",style: style.text2,),
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              kakao_login.SignIn(),
              ElevatedButton(onPressed: () {}, child: Text('key'))
            ],
          ),
        ),
      );

  }
}
