import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; //이미지 가져오는 패키지
import 'dart:io'; //파일 다루는 유용한 패키지
import 'package:http/http.dart' as http;


class TeamRegi extends StatefulWidget {
  const TeamRegi({Key? key}) : super(key: key);

  @override
  State<TeamRegi> createState() => _TeamRegiState();
}

class _TeamRegiState extends State<TeamRegi> {
  var inputTeamNameData = TextEditingController(); //팀명  textcontroller
  var inputTeamIntro = TextEditingController(); //팀 소개글  textcontroller
  var teamImage; // 이미지 담을 state
  var teamNameUsable = false; //팀명중복 X  True // 팀명중복 O False
  var teamFullArea = ''; //팀 활동 지역 선택 데이터를  '시/도 + 시/구/군 + 동/읍/면 ' 형태로 담을 state
  var teamFullAreaIsFull =
      false; // 팀 활동 지역을 '시/도 + 시/구/군 + 동/읍/면 ' 형태로 잘 선택했나를 나타내는 state
  var teamRegiFullData = {
    'teamname': '',
    'teamlogo': '',
    'teamintro': '',
    'teamarea': ''
  }; //팀 정보를 모두 담은 map 데이터 state

  // 시/도 데이터
  var areaData_1 = [
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

  // 시/구/군 데이터    @'시/도 중 1개를 선택한 값'을 back 에 보내서 해당하는 '시/구/군 리스트'를 reponse로 받은것이다@
  var areaData_2 = [
    '강남구',
    '강동구',
    '강북구',
    '강서구',
    '관악구',
    '광진구',
    '구로구',
    '금천구',
    '노원구',
    '도봉구',
    '동대문구',
    '동작구',
    '마포구',
    '서대문구',
    '서초구',
    '성동구',
    '성북구'
  ];


  //팀명 중복 확인을 위한 함수 (팀명을 back에 get요청해 중복/미중복 여부를 response로 받는다)
  void sendTeamNameToBack(String teamName) async {
    var queryParameters = {'teamname': teamName.toString()};
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: queryParameters);

    var boolresponse = true; // response로 중복/미중복 여부를 받는다 (임시로 선언함)

    if (response.statusCode == 200) {
      print("GET 정상 완료 ${response.statusCode}");

      teamNameUsableIsTrue(boolresponse);

      if (teamNameUsable == true) {
        print('팀명 중복 아님!');
        snackBar('사용가능한 팀명입니다.');
        //팀명이 중복이 아니면 teamRegiFullData state에 팀명을 저장한다.
        setState(() {
          teamRegiFullData['teamname'] = teamName;
        });
      } else if (teamNameUsable == false) {
        print('팀명 중복임!');
        snackBar('이미 존재하는 팀명 입니다.');
      }
    } else {
      throw Exception('GET 오류 ${response.statusCode}');
    }
  }

  //시/도 선택 후 값을 back에 보내고 response(ex)(시/도 --> 시/구/군 list data)를 받는다.
  void sendAreaSelectToBack(String areaData) async {

    var queryParameters = {'area': base64.encode(utf8.encode(areaData))};
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: queryParameters);
    if (response.statusCode == 200) {
      print('팀 지역 정보 ${queryParameters.toString()} 잘보내짐');
      //areaNumber 과 areaSelectNumber 에 해당하는 reponse(지역 리스트)를 return 하는 코드 자리
      print(queryParameters);
    } else {
      throw Exception('GET 오류 ${response.statusCode}');
    }
  }

  //teamRegiFullData state (팀 등록의 모든 정보를 담은 map 형식의 data state)를 back에 보낸다.
  void sendTeamRegiFullDataToBack( Map<String, String> teamRegiFullData) async {
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: teamRegiFullData);
    if (response.statusCode == 200) {
      print('팀 등록 데이터 잘 보내짐 ${teamRegiFullData.toString()}');
      print(teamRegiFullData);
    }
    else {
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

  //teamFullArea state를 자식 위젯에서 변경하기 위한 함수.
  void addTeamFullArea(String teamArea) {
    setState(() {
      teamFullArea = teamFullArea + teamArea + ' ';
    });
  }

  //teamFullAreaIsFull state를 자식 위젯에서 true로 바꾸어주는 함수
  void teamFullAreaIsFullIsTrue(bool booldata) {
    setState(() {
      teamFullAreaIsFull = booldata;
    });
    //teamFullAreaIsFull==true 이면, teamRegiFullData state에 팀 활동 지역을 저장한다.
    teamRegiFullData['teamarea'] = base64.encode(utf8.encode(teamFullArea));
  }

  //teamNameUsable state를 변경하는 함수
  void teamNameUsableIsTrue(bool booldata) {
    setState(() {
      teamNameUsable = booldata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('팀 정보 등록'),
      ),
      body: SingleChildScrollView(
        // 키보드 올라왔을 때 자동으로 scrollView로 만들어주는 위젯
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(children: [
                //팀 이름 입력하는 TextField
                Flexible(
                  child: TextField(
                    controller: inputTeamNameData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '팀 이름 (필수)',
                        hintText: '팀 이름을 입력하세요.'),
                    onSubmitted: (String str){
                      setState(() {
                        teamNameUsable = false;
                      });
                    },
                  ),
                ),
                //중복확인 버튼
                TextButton(
                    child: Text('중복확인'),
                    onPressed: () {
                      if (inputTeamNameData.text.isNotEmpty &&
                          !inputTeamNameData.text.startsWith(' ')) {
                        sendTeamNameToBack(base64.encode(utf8.encode(inputTeamNameData.text)));
                      }
                    }),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            //로고 이미지 선택하는 버튼
            ElevatedButton(
                onPressed: () async {
                  var picker = ImagePicker();
                  var image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      teamImage = File(image.path);
                      teamRegiFullData['teamlogo'] = image.path; //팀 로고를 teamRegiFullData state에 팀 로고 path를 저장한다.
                    });
                  }
                },
                child: Text('팀 로고 가져오기')),
            //선택한 로고 이미지 보여주는 sizedBox
            SizedBox(
              width: 100,
              height: 100,
              child:
                  (teamImage == null) ? Text('로고 이미지') : Image.file(teamImage),
            ),
            SizedBox(
              height: 20,
            ),
            //팀 소개하는 TextField
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '팀 소개 (선택)',
                    hintText: '팀 소개을 입력하세요.'),
                //textField에 text 입력하고 키보드에서 완료 누르면 실행
                onSubmitted: (String teammintro) {
                  setState(() {
                    teamRegiFullData['teamintro'] = base64.encode(utf8.encode(teammintro)); // 팀 설명을 teamRegiFullData state에 팀 설명을 저장한다.
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //팀 활동 지역 선택하는 버튼
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  child: Text('팀 활동 지역 선택  (필수)'),
                  onPressed: () {
                    setState(() {
                      teamFullArea = ''; // 팀 황동 지역 정보 state 초기화
                      teamFullAreaIsFull =
                          false; // 팀 활동 지역을 '시/도 + 시/구/군 + 동/읍/면 ' 형태로 잘 선택했나를 나타내는 state 초기화
                    });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AreaDialogFirst(
                              areaData_1: areaData_1,
                              sendAreaSelectToBack: sendAreaSelectToBack,
                              areaData_2: areaData_2,
                              addTeamFullArea: addTeamFullArea,
                              teamFullAreaIsFullIsTrue:
                                  teamFullAreaIsFullIsTrue);
                        });
                  },
                )),
            //팀 활동 지역 선택 결과 보여주는 Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(teamFullArea),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
                child: Text('팀 등록 완료 하기'),
                onPressed: () {
                  if (teamNameUsable == false && teamFullAreaIsFull == false) {
                    print(teamNameUsable);
                    snackBar('팀 이름 중복 and 팀 활동 지역 선택을 해주세요');
                  } else if (teamNameUsable == false &&
                      teamFullAreaIsFull == true) {
                    snackBar('팀 이름 중복 확인을 해주세요');
                  } else if (teamNameUsable == true &&
                      teamFullAreaIsFull == false) {
                    snackBar('팀 활동 지역을 선택 해주세요');
                  } else if (teamNameUsable == true &&
                      teamFullAreaIsFull == true) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return TeamRegiCompleteDailog(
                              sendTeamRegiFullDataToBack:
                                  sendTeamRegiFullDataToBack,
                              teamRegiFullData: teamRegiFullData,
                              teamImage: teamImage);
                        });
                    //Navigator.pushReplacementNamed(context, '/user_regi');
                  }
                })
          ],
        ),
      ),
    );
  }
}

//시/도 dialog
class AreaDialogFirst extends StatelessWidget {
  const AreaDialogFirst(
      {Key? key,
      this.areaData_1,
      this.sendAreaSelectToBack,
      this.areaData_2,
      this.addTeamFullArea,
      this.teamFullAreaIsFullIsTrue})
      : super(key: key);
  final areaData_1; // 시/도 리스트 데이터
  final sendAreaSelectToBack; //시/도 선택 후 값을 back에 보내고 response( 시/구/군 리스트 데이터)를 받는다.
  final areaData_2; // 시/구/군 리스트 데이터
  final addTeamFullArea; //teamFullArea state를 자식 위젯에서 변경하기 위한 함수.
  final teamFullAreaIsFullIsTrue; //teamFullAreaIsFull state를 자식 위젯에서 true로 바꾸어주는 함수

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('시/도'),
      content: SizedBox(
        width: 300.0,
        height: 300.0,
        child: ListView.builder(
          itemCount: areaData_1.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text(areaData_1[i]),
                onTap: () {
                  Navigator.pop(context);
                  addTeamFullArea(areaData_1[i]); //지역 선택한 것 출력할 텍스트 문자열에 추가
                  sendAreaSelectToBack(areaData_1[i]); //지역 선택한것 back에 보내기
                  //시/구/군 dialog 열기
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AreaDialogSecond(
                            areaData_2: areaData_2,
                            addTeamFullArea: addTeamFullArea,
                            teamFullAreaIsFullIsTrue: teamFullAreaIsFullIsTrue);
                      });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

//시/구/군 dialog
class AreaDialogSecond extends StatelessWidget {
  const AreaDialogSecond(
      {Key? key,
      this.areaData_2,
      this.addTeamFullArea,
      this.teamFullAreaIsFullIsTrue})
      : super(key: key);

  final areaData_2; // 시/구/군 데이터
  final addTeamFullArea; //teamFullArea state를 자식 위젯에서 변경하기 위한 함수.
  final teamFullAreaIsFullIsTrue; //teamFullAreaIsFull state를 자식 위젯에서 true로 바꾸어주는 함수

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('시/구/군'),
      content: SizedBox(
        width: 300.0,
        height: 300.0,
        child: ListView.builder(
          itemCount: areaData_2.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                title: Text(areaData_2[i]),
                onTap: () {
                  Navigator.pop(context);
                  addTeamFullArea(areaData_2[i]);
                  teamFullAreaIsFullIsTrue(true);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}


//팀 등록 완료 버튼 누르면 나오는 dialog
class TeamRegiCompleteDailog extends StatelessWidget {
  const TeamRegiCompleteDailog(
      {Key? key,
      this.sendTeamRegiFullDataToBack,
      this.teamRegiFullData,
      this.teamImage})
      : super(key: key);

  final sendTeamRegiFullDataToBack; //teamRegiFullData state (팀 등록의 모든 정보를 담은 map 형식의 data state)를 back에 보낸다.
  final teamRegiFullData; //팀 정보를 모두 담은 map 데이터 state
  final teamImage; // 이미지 담을 state

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('팀 등록을 완료 하겠습니까?'),
      content: SingleChildScrollView(
        child: ListBody(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Row(
                    children: [Text('팀명 : ${utf8.decode(base64.decode(teamRegiFullData['teamname']))}')]),

              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Row(children: [Text('팀 로고 :')]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: (teamImage == null)
                      ? Text('로고 이미지')
                      : Image.file(teamImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Row(children: [Text('팀 소개 : ')]),
              ),
              Text(utf8.decode(base64.decode(teamRegiFullData['teamintro']))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Row(children: [
                  Text('팀 활동 지역 : ${utf8.decode(base64.decode(teamRegiFullData['teamarea']))}')
                ]),
              ),
            ],
          ),
        ]),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              sendTeamRegiFullDataToBack(teamRegiFullData); //팀 등록 정보 백에 보냄.
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('팀 등록 완료'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/user_regi');
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
