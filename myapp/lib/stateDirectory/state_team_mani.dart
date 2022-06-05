import 'dart:io';
import 'package:flutter/material.dart';

//team_intro.dart 에서 사용하는 state
class Store1 extends ChangeNotifier{
  var teaminfo = {
    '팀 명' : '토트넘',
    '팀 이미지' : '/data/user/0/com.example.myapp/cache/image_picker7600132639349164358.jpg',
    '팀장': '홍길동',
    '팀 소개': '하이',
    '팀 등록일': '2022.05.28',
    '총 선수': 11,
    '연령대': 30,
    '활동지역': '강남구'
  };
  var userImage;
  //teaminfo 수정하는 함수
  changeTeaminfo(String key, String value){
    teaminfo[key.toString()] = value;
    notifyListeners();  // 재랜더링 해줌
  }
  changeUserImage(var path){
    userImage = File(path);
    notifyListeners();
  }
}