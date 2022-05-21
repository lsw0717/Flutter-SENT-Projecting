import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';  //Jason Decode를 위한 패키지




class KakaoLogin extends StatefulWidget {
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  State<KakaoLogin> createState() => _KakaoLoginState();
}
class _KakaoLoginState extends State<KakaoLogin> {

  var isUser = false;    //백단 코드가 없어서 이 state 값을 조종하며 '신규(true)'/'기존 유저(false)' 페이지 이동을 실험한다.

  //토큰 정보 보기
  void _getTokenInfo() async {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print('토큰 정보 보기 성공'
          '\n회원정보: ${tokenInfo.id}'
          '\n만료시간: ${tokenInfo.expiresIn} 초');
    } catch (error) {
      print('토큰 정보 보기 실패 $error');
    }
  }

  //사용자 정보 요청
  void _getUserInfo() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  //카카오톡 어플로 로그인
  void kakaoAppLogin() async{
    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
    print('카카오톡으로 로그인 성공 ${token.accessToken}');
    var queryParameters = {'Authorization': token.accessToken}; //access token을 Map에 담는다.
    sendTokenBack(queryParameters); // access token을 넘겨준다.
  }

  //카카오톡 계정으로(웹페이지) 로그인
  void kakaoAccountLogin() async{
    // prompts를 [Prompt.login]으로 지정하여
    //기존의 로그인 여부와 상관없이 사용자에게 재인증을 요청
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount(prompts: [Prompt.login]);
    print('카카오계정으로 로그인 성공 ${token.accessToken}');
    var queryParameters = {'Authorization': token.accessToken.toString()};  //access token을 Map에 담는다.
    sendTokenBack(queryParameters); // access token을 넘겨준다.
  }

  //access token을 백에 보내기
  void sendTokenBack(Map<String, String> queryParameters)async{
    var response= await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'),headers: queryParameters);

    if(response.statusCode==200){
      print("GET 정상 완료 ${response.statusCode}");

      // print(jsonDecode(response.body));
      //access token을 보내고 받은 response가 '기존 유저' (isUser = true) 이면 main_page 로 이동
      if ( isUser == true ){
        // main_page 로 이동
        moveToMainPage();
      }
      //access token을 보내고 받은 response가 '기존 유저' (isUser = true) 이면  user_info_regi 로 이동
      else if ( isUser == false ){
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
    return InkWell(
        child: Image.asset(
          'assets/kakaobtn.png',
        ),
        onTap: () async {
          //카카오톡이 설치 되었다면
          if (await isKakaoTalkInstalled()) {
            //카카오톡으로 로그인
            try {
              kakaoAppLogin(); //카카오톡 어플로 로그인
              _getTokenInfo(); //토큰 정보 보기
              _getUserInfo(); //사용자 정보 가져오기
            } catch (error) {
              print('카카오톡으로 로그인 실패 $error');
              //사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
              //의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
              if (error is PlatformException && error.code == 'CANCELED') {
                return;
              }
              // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오 계정으로 웹 로그인
              try {
                kakaoAccountLogin(); //카카오톡 계정으로(웹페이지) 로그인
                _getTokenInfo(); //토큰 정보 보기
                _getUserInfo(); //사용자 정보 가져오기
              } catch (error) {
                print('카카오계정으로 로그인 실패 $error');
              }
            }
          }
          //카카오톡이 설치 안되어 있다면
          else {
            //카카오 계정으로 웹 로그인
            try {
              kakaoAccountLogin(); //카카오톡 계정으로(웹페이지) 로그인
              _getTokenInfo(); //토큰 정보 보기
              _getUserInfo(); //사용자 정보 가져오기
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        });
  }
}
