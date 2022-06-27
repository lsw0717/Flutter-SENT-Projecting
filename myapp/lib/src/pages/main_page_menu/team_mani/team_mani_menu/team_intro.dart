import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/stateDirectory/state_team_mani.dart' as state_team_mani;
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class TeamIntro extends StatefulWidget {
  const TeamIntro({Key? key}) : super(key: key);

  @override
  State<TeamIntro> createState() => _TeamIntroState();
}

class _TeamIntroState extends State<TeamIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //팀 정보 수정 FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditPage()),
            );
          }),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              //팀 명
              Text(
                  '${context.watch<state_team_mani.Store1>().teaminfo['팀 명']}'),
              SizedBox(
                height: 30,
              ),
              //팀 로고
              Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child:
                      context.watch<state_team_mani.Store1>().userImage == null
                          ? Text('NO Image Selected')
                          : Image.file(File(context
                              .watch<state_team_mani.Store1>()
                              .teaminfo['팀 이미지']
                              .toString()))),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(children: [Text('팀 소개')]),
              ),
              //팀 소개
              Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    '${context.watch<state_team_mani.Store1>().teaminfo['팀 소개']}',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //팀장
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text('팀장'),
                    SizedBox(width: 60),
                    Text(
                        '${context.watch<state_team_mani.Store1>().teaminfo['팀장']}',
                        style: TextStyle(color: Colors.black54, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //팀 등록일
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text('팀 등록일'),
                    SizedBox(width: 20),
                    Text(
                      '${context.watch<state_team_mani.Store1>().teaminfo['팀 등록일']}',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //총 선수
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text('총 선수'),
                    SizedBox(width: 40),
                    Text(
                        '${context.watch<state_team_mani.Store1>().teaminfo['총 선수']} 명',
                        style: TextStyle(color: Colors.black54, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //연령대
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text('연령대'),
                    SizedBox(width: 45),
                    Text(
                        '${context.watch<state_team_mani.Store1>().teaminfo['연령대']} 살',
                        style: TextStyle(color: Colors.black54, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //활동지역
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text('활동지역'),
                    SizedBox(width: 30),
                    Text(
                        '${context.watch<state_team_mani.Store1>().teaminfo['활동지역']}',
                        style: TextStyle(color: Colors.black54, fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 팀 정보 수정 페이지
class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var inputTeamNameData = TextEditingController();
  var inputTeamIntroData = TextEditingController();
  var inputTeamAreaData = TextEditingController();
  var imagePath;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('프로필 수정'),
          leading: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '취소',
                style: TextStyle(color: Colors.white),
              )),
          actions: [
            TextButton(
                onPressed: () {
                  if (imagePath != null) {
                    context
                        .read<state_team_mani.Store1>()
                        .changeTeaminfo('팀 이미지', imagePath);
                  }

                  if (inputTeamNameData.text.isNotEmpty &&
                      !inputTeamNameData.text.startsWith(' ')) {
                    context
                        .read<state_team_mani.Store1>()
                        .changeTeaminfo('팀 명', inputTeamNameData.text);
                  }
                  if (inputTeamIntroData.text.isNotEmpty &&
                      !inputTeamIntroData.text.startsWith(' ')) {
                    context
                        .read<state_team_mani.Store1>()
                        .changeTeaminfo('팀 소개', inputTeamIntroData.text);
                  }
                  if (inputTeamAreaData.text.isNotEmpty &&
                      !inputTeamAreaData.text.startsWith(' ')) {
                    context
                        .read<state_team_mani.Store1>()
                        .changeTeaminfo('활동지역', inputTeamAreaData.text);
                  }
                  Navigator.of(context).pop();
                  print(context.read<state_team_mani.Store1>().teaminfo);
                },
                child: Text('완료', style: TextStyle(color: Colors.white))),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //팀 로고
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                  child: Column(children: [
                    Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            context.watch<state_team_mani.Store1>().userImage ==
                                    null
                                ? Text('NO Image Selected')
                                : Image.file(File(context
                                    .watch<state_team_mani.Store1>()
                                    .userImage!
                                    .path))),
                    TextButton(
                        child: Text('프로필 사진 바꾸기'),
                        onPressed: () async {
                          var picker = ImagePicker();
                          var image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            context
                                .read<state_team_mani.Store1>()
                                .changeUserImage(image.path);
                            setState(() {
                              imagePath = image.path;
                            });
                            print('이미지 패스 ${image.path}');
                          }
                        }),
                  ]),
                ),

                //팀 명
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: inputTeamNameData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '팀 명',
                        hintText:
                            '${context.read<state_team_mani.Store1>().teaminfo[context.read<state_team_mani.Store1>().teaminfo.keys.toList()[0]]}'),
                  ),
                ),

                //팀 소개
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: inputTeamIntroData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '팀 소개',
                        hintText:
                            '${context.read<state_team_mani.Store1>().teaminfo[context.read<state_team_mani.Store1>().teaminfo.keys.toList()[3]]}'),
                  ),
                ),

                //활동지역
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextField(
                    controller: inputTeamAreaData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '활동 지역',
                        hintText:
                            '${context.read<state_team_mani.Store1>().teaminfo[context.read<state_team_mani.Store1>().teaminfo.keys.toList()[7]]}'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
