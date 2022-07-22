import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'dart:convert';  //Jason Decode를 위한 패키지

class UserRegi extends StatefulWidget {
  const UserRegi({Key? key}) : super(key: key);

  @override
  State<UserRegi> createState() => _UserRegiState();
}

class _UserRegiState extends State<UserRegi> {
  var inputNickNameData = TextEditingController(); //닉네임  textcontroller
  var nickNameUsable = false; // 닉네임 중복 여부를 확인하기 위한 state
  var areaIsTrue = false; //활동 지역 필수 입력 사항을 조종하기 위한 state
  //유저 정보를 모두 담아 저장하는 map 형식의 state
  var userFullData = {'nickname': '', 'area': '', 'position': '', 'pro': ''};

  // 선호 포지션 dropdown lsit
  List<String> posidropdownList = ['포지션 선택', '공격수', '수비수', '미드필더', '골키퍼'];

  // 선호 포지션 dropdown value
  String posiselectedDropdown = '포지션 선택';

  // 선호 포지션 선택 유무 플래그
  bool ispositioned = false;

  // 프로유무 dropdown lsit
  List<String> prodropdownList = ['선출여부 선택', '네', '아니요'];

  // 프로유무 dropdown value
  String proselectedDropdown = '선출여부 선택';

  // 프로유무 선택 유무 플래그
  bool isproed = false;

  // 시/도 데이터
  var areaData = [
    '서울',
    '경기',
    '인천',
    '강원',
    '대전',
    '세종',
    '충남',
    '충북',
    '부산',
    '울산',
    '경남',
    '경북',
    '대구',
    '광주',
    '전남',
    '전북',
    '제주'
  ];

  //닉네임 중복 확인을 위한 함수 (닉네임을 back에 get요청해 중복/미중복 여부를 response로 받는다)
  void sendNickNameToBack(String nickname) async {
    var queryParameters = {'nickname': nickname.toString()};
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: queryParameters);

    var boolresponse = true; // response로 중복/미중복 여부를 받는다 (임시로 선언함)

    if (response.statusCode == 200) {
      print("GET 정상 완료 ${response.statusCode}");
      nickNameUsableIsTrue(boolresponse);
      if (nickNameUsable == true) {
        print('팀명 중복 아님!');
        snackBar('사용가능한 팀명입니다.');
        //팀명이 중복이 아니면 userFullData state에 팀명을 저장한다.
        setState(() {
          userFullData['nickname'] = nickname;
        });
      } else if (nickNameUsable == false) {
        print('팀명 중복임!');
        snackBar('이미 존재하는 팀명 입니다.');
      }
    } else {
      throw Exception('GET 오류 ${response.statusCode}');
    }
  }

  //스낵바 함수
  void snackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.amber,
    ));
  }

  //teamNameUsable state를 변경하는 함수
  void nickNameUsableIsTrue(bool booldata) {
    setState(() {
      nickNameUsable = booldata;
    });
  }

  // userFullData['area'] state를 자식 위젯에서 변경하기 위한 함수
  void areaDataSave(String area) {
    setState(() {
      userFullData['area'] = base64.encode(utf8.encode(area));
      areaIsTrue = true;
    });
  }

  //userFullData state (유저 등록의 모든 정보를 담은 map 형식의 data state)를 back에 보낸다.
  void sendUserRegiFullDataToBack(Map<String, String> userFullData) async {
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: userFullData);
    if (response.statusCode == 200) {
      print('팀 등록 데이터 잘 보내짐');
      print(userFullData);
    } else {
      throw Exception('GET 오류 ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('유저 정보 등록'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //닉네임 입력
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: Row(children: [
                  Flexible(
                    child: TextField(
                      controller: inputNickNameData,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '닉네임 (필수)',
                          hintText: '닉네임을 입력하세요.'),
                      onSubmitted: (String str) {
                        setState(() {
                          nickNameUsable = false;
                        });
                      },
                    ),
                  ),
                  TextButton(
                      child: Text('중복확인'),
                      onPressed: () {
                        if (inputNickNameData.text.isNotEmpty &&
                            !inputNickNameData.text.startsWith(' ')) {
                          sendNickNameToBack(base64
                              .encode(utf8.encode(inputNickNameData.text)));
                        }
                      }),
                ]),
              ),
              //활동 지역

              ElevatedButton(
                child: Text('활동 지역 선택  (필수)'),
                onPressed: () {
                  setState(() {
                    areaIsTrue = false;
                  });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AreaDialog(
                          areaData: areaData,
                          areaDataSave: areaDataSave,
                        );
                      });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(utf8
                      .decode(base64.decode(userFullData['area'].toString()))),
                ],
              ),

              //선수 포지션 dropdown
              DropdownButton(
                value: posiselectedDropdown,
                items: posidropdownList.map((String item) {
                  return DropdownMenuItem<String>(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  setState(() {
                    posiselectedDropdown = value;
                    if (posiselectedDropdown != '포지션 선택') {
                      ispositioned = true;
                      userFullData['position'] =
                          base64.encode(utf8.encode(posiselectedDropdown));
                    } else {
                      snackBar('선호 포지션을 예시 중 하나를 선택하세요');
                      ispositioned = false;
                    }
                  });
                },
              ),

              //선출 여부 dropdown
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: DropdownButton(
                  value: proselectedDropdown,
                  items: prodropdownList.map((String item) {
                    return DropdownMenuItem<String>(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      proselectedDropdown = value;
                      if (proselectedDropdown != '선출여부 선택') {
                        isproed = true;
                        userFullData['pro'] =
                            base64.encode(utf8.encode(proselectedDropdown));
                      } else {
                        snackBar('선출 여부를 예시 중 하나를 선택하세요');
                        isproed = false;
                      }
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 0),
                child: ElevatedButton(
                    child: Text('유저 등록 완료 하기'),
                    onPressed: () {
                      if (inputNickNameData.text.isNotEmpty &&
                          areaIsTrue == true &&
                          ispositioned == true &&
                          isproed == true) {
                        if (nickNameUsable == false) {
                          snackBar('닉네임 중복 체크 해주세요');
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return UserRegiCompleteDialog(
                                    userFullData: userFullData,
                                    sendUserRegiFullDataToBack:
                                        sendUserRegiFullDataToBack);
                              });
                        }
                      } else {
                        snackBar('필수 사항들을 모두 입력해 주세요');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//유저 활동 지역 리스트를 보여주는 dialog
class AreaDialog extends StatelessWidget {
  const AreaDialog({
    Key? key,
    this.areaData,
    this.areaDataSave,
  }) : super(key: key);
  final areaData; // 활동 지역 리스트
  final areaDataSave; // 활동 지역 리스트에서 택 1 한 값을 userFullData['area'] state에 저장하는 함수

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('시/도'),
      content: SizedBox(
        width: 300.0,
        height: 300.0,
        child: ListView.builder(
          itemCount: areaData.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text(areaData[i]),
                onTap: () {
                  areaDataSave(areaData[i]);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class UserRegiCompleteDialog extends StatelessWidget {
  const UserRegiCompleteDialog(
      {Key? key, this.userFullData, this.sendUserRegiFullDataToBack})
      : super(key: key);
  final userFullData;
  final sendUserRegiFullDataToBack;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('유저 등록을 완료 하겠습니까?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(children: [
                    Text(
                        '닉네임 : ${utf8.decode(base64.decode(userFullData['nickname']))}'),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(children: [
                    Text(
                        '활동 지역 : ${utf8.decode(base64.decode(userFullData['area']))}'),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(children: [
                    Text(
                        '선호 포지션 : ${utf8.decode(base64.decode(userFullData['position']))}'),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                  child: Row(children: [
                    Text(
                        '선출 여부 : ${utf8.decode(base64.decode(userFullData['pro']))}'),
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              sendUserRegiFullDataToBack(userFullData);
              Navigator.of(context).pop();
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('유저 등록 완료'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              //Navigator.of(context).pop();
                              Navigator.pushReplacementNamed(
                                  context, '/main_page');
                            },
                            child: Text('OK')),
                      ],
                    );
                  });
            },
            child: Text('OK')),
      ],
    );
  }
}
