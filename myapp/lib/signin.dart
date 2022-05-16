import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

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

  //사용자 정보 가져오기
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Image.asset(
          'assets/kakao_login_medium_narrow.png',
        ),
        onTap: () async {
          //카카오톡이 설치 되었다면
          if (await isKakaoTalkInstalled()) {
            //카카오톡으로 로그인
            try {
              OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
              print('카카오톡으로 로그인 성공 ${token.accessToken}');
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
                OAuthToken token =
                    await UserApi.instance.loginWithKakaoAccount();
                print('카카오계정으로 로그인 성공 ${token.accessToken}');
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
              // prompts를 [Prompt.login]으로 지정하여
              //기존의 로그인 여부와 상관없이 사용자에게 재인증을 요청
              OAuthToken token = await UserApi.instance
                  .loginWithKakaoAccount(prompts: [Prompt.login]);
              print('카카오계정으로 로그인 성공 ${token.accessToken}');
              _getTokenInfo(); //토큰 정보 보기
              _getUserInfo(); //사용자 정보 가져오기
            } catch (error) {
              print('카카오계정으로 로그인 실패 $error');
            }
          }
        });
  }
}
