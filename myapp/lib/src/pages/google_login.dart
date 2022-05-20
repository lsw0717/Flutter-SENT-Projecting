//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';//Jason Decode를 위한 패키지


class GoogleLogin extends StatefulWidget {
  const GoogleLogin({Key? key}) : super(key: key);

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {

  var isUser = false;    //백단 코드가 없어서 이 state 값을 조종하며 '신규(true)'/'기존 유저(false)' 페이지 이동을 실험한다.
  var pageMove = 0;     // 1 == main_page , 2 == user_info_regi.


  //google Login 함수
  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    print('로그인 성공!!');
    print('엑세스 토큰  ${googleAuth?.accessToken}');
    print('아이디 토큰  ${googleAuth?.idToken}');
    //access token을 Map에 담는다.
    var queryParameters = {'Authorization': (googleAuth?.accessToken).toString()};
    //access token을 백에 보내기
    sendTokenBack(queryParameters);
    // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //access token을 백에 보내기
  void sendTokenBack(Map<String, String> queryParameters)async{
    var response= await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'),headers: queryParameters);

    if(response.statusCode==200){
      print("GET 정상 완료 ${response.statusCode}");
      //print(jsonDecode(response.body));
      //access token을 보내고 받은 response가 '기존 유저' (isUser = true) 이면 --> state pageMove == 1 바꾼다.
      if ( isUser == true ){
        setState(() {
          pageMove = 1;
        });
        // main_page 로 이동
        moveToMainPage();
      }
      //access token을 보내고 받은 response가 '기존 유저' (isUser = true) 이면 --> state pageMove == 1 바꾼다.
      else if ( isUser == false ){
        setState(() {
          pageMove = 2;
        });
        // user_info_regi 로 이동
        moveToUserInfoRegi();
      }
    }
    else{
      throw Exception('GET 오류 ${response.statusCode}');
    }
  }


  // main_page 로 이동
  void moveToMainPage() async {
    await Navigator.pushReplacementNamed(context, '/main_page');
  }

  // user_info_regi 로 이동
  void moveToUserInfoRegi() async {
    await Navigator.pushReplacementNamed(context, '/user_info_regi');
  }


  @override
  Widget build(BuildContext context) {
    return TextButton(
            child: Text("Google Login"),
            onPressed:(){
              signInWithGoogle();
              },
          );
  }
}


