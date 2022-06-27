
import 'dart:io';
import 'package:flutter/material.dart';

//team_intro.dart 에서 사용하는 state
class Store1 extends ChangeNotifier {
  var teaminfo = {
    '팀 명': '토트넘',
    '팀 이미지':
        '/data/user/0/com.example.myapp/cache/image_picker7600132639349164358.jpg',
    '팀장': '홍길동',
    '팀 소개': '하이',
    '팀 등록일': '2022.05.28',
    '총 선수': 11,
    '연령대': 30,
    '활동지역': '강남구'
  };
  var userImage;

  //teaminfo 수정하는 함수
  changeTeaminfo(String key, String value) {
    teaminfo[key.toString()] = value;
    notifyListeners(); // 재랜더링 해줌
  }

  changeUserImage(var path) {
    userImage = File(path);
    notifyListeners();
  }
}

//team_posi.dart 에서 사용하는 state
class Store2 extends ChangeNotifier {
  var dropDownList = [
    '3-4-3',
    '3-4-3(2)',
    '3-4-1-2',
    '3-2-3-2',
    '3-2-2-1-2',
    '3-1-2-1-3',
    '3-1-4-2',
    '4-5-1',
    '4-4-2',
    '4-4-2(2)',
    '4-4-1-1',
    '4-3-3',
    '4-3-3(2)',
    '4-3-2-1',
    '4-3-1-2,',
    '4-2-4',
    '4-2-3-1',
    '4-2-2-2',
    '4-2-2-2(2)',
    '4-2-2-1-1',
    '4-2-1-3',
    '4-2-1-3(2)',
    '4-1-4-1',
    '4-1-3-2',
    '4-1-2-3',
    '4-1-2-3(2)',
    '4-1-2-1-2',
    '4-1-2-1-2(2)',
    '5-4-1',
    '5-3-2',
    '5-2-3',
    '5-2-1-2',
    '5-1-2-1-1'
  ];
  var dropDownSelectedValue = '3-4-3';

  //dropDownSelectedValue을 바꾸는 함수
  changeDropDownSelectedValue(var value) {
    dropDownSelectedValue = value;
    notifyListeners();
  }

  //card1의 위치 state
  var top1 = 60.0;
  var left1 = 160.0;

  //card1의 위치 바꾸는 함수
  changeCard1(double top, double left) {
    top1 = top;
    left1 = left;
    notifyListeners();
  }

  //card2의 위치 state
  var top2 = 150.0;
  var left2 = 80.0;

  //card2의 위치 바꾸는 함수
  changeCard2(double top, double left) {
    top2 = top;
    left2 = left;
    notifyListeners();
  }

  //card3의 위치 state
  var top3 = 150.0;
  var left3 = 240.0;

  //card3의 위치 바꾸는 함수
  changeCard3(double top, double left) {
    top3 = top;
    left3 = left;
    notifyListeners();
  }

  //card4의 위치 state
  var top4 = 250.0;
  var left4 = 10.0;

  //card4의 위치 바꾸는 함수
  changeCard4(double top, double left) {
    top4 = top;
    left4 = left;
    notifyListeners();
  }

  //card5의 위치 state
  var top5 = 250.0;
  var left5 = 110.0;

  //card5의 위치 바꾸는 함수
  changeCard5(double top, double left) {
    top5 = top;
    left5 = left;
    notifyListeners();
  }

  //card6의 위치 state
  var top6 = 250.0;
  var left6 = 210.0;

  //card6의 위치 바꾸는 함수
  changeCard6(double top, double left) {
    top6 = top;
    left6 = left;
    notifyListeners();
  }

  //card7의 위치 state
  var top7 = 250.0;
  var left7 = 310.0;

  //card7의 위치 바꾸는 함수
  changeCard7(double top, double left) {
    top7 = top;
    left7 = left;
    notifyListeners();
  }

  //card8의 위치 state
  var top8 = 350.0;
  var left8 = 60.0;

  //card8의 위치 바꾸는 함수
  changeCard8(double top, double left) {
    top8 = top;
    left8 = left;
    notifyListeners();
  }

  //card9의 위치 state
  var top9 = 350.0;
  var left9 = 160.0;

  //card9의 위치 바꾸는 함수
  changeCard9(double top, double left) {
    top9 = top;
    left9 = left;
    notifyListeners();
  }

  //card10의 위치 state
  var top10 = 350.0;
  var left10 = 260.0;

  //card10의 위치 바꾸는 함수
  changeCard10(double top, double left) {
    top10 = top;
    left10 = left;
    notifyListeners();
  }

  //card11의 위치 state
  var top11 = 450.0;
  var left11 = 160.0;

  //card11의 위치 바꾸는 함수
  changeCard11(double top, double left) {
    top11 = top;
    left11 = left;
    notifyListeners();
  }
}

//card 1 ~ 11 까지 에서 사용하는 state
class Store3 extends ChangeNotifier{
  //카드 클릭했을 때 나오는 이름 리스틑 ( Bottom up sheet에 나오는 이름들)
  var player= ['이상우','윤상원','이상빈','김남형','장준하','강동균','이승호','전대윤','이재혁','서영민','김예준'];
  //카드 1 ~ 11까지 선수 이름 넣은 리스트
  var playerCardList = ['1','2','3','4','5','6','7','8','9','10','11'];

  //playerCardList에 선수 이름 추가하는 함수
  changePlayerCardList(int index, String value){
    if(playerCardList[index].isNotEmpty){
      playerCardList.removeAt(index);
    }
    playerCardList.insert(index, value);
    notifyListeners();
  }
}