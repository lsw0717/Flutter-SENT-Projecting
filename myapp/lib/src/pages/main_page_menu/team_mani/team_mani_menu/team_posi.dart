import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:myapp/src/pages/main_page_menu/team_mani/team_mani_menu/posi_cards/card_1.dart';
import 'package:myapp/stateDirectory/state_team_mani.dart' as state_team_mani;
import 'package:provider/provider.dart';

import 'posi_cards/card_1.dart';
import 'posi_cards/card_2.dart';
import 'posi_cards/card_3.dart';
import 'posi_cards/card_4.dart';
import 'posi_cards/card_5.dart';
import 'posi_cards/card_6.dart';
import 'posi_cards/card_7.dart';
import 'posi_cards/card_8.dart';
import 'posi_cards/card_9.dart';
import 'posi_cards/card_10.dart';
import 'posi_cards/card_11.dart';

class TeamPosi extends StatefulWidget {
  const TeamPosi({Key? key}) : super(key: key);

  @override
  State<TeamPosi> createState() => _TeamPosiState();
}

class _TeamPosiState extends State<TeamPosi> {
  //Card1의 위치
  card1Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard1(60, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard1('position', 'ST');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard1(60, 80);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard1('position', 'LS');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard1(60, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard1('position', 'ST');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard1(60, 100);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard1('position', 'LS');
    }
  }

  //Card2의 위치
  card2Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard2(150, 80);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard2('position', 'LF');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard2(60, 240);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard2('position', 'RS');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard2(120, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard2('position', 'CF');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard2(60, 220);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard2('position', 'RS');
    }
  }

  //Card3의 위치
  card3Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      context.read<state_team_mani.Store2>().changeCard3(150, 240);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard3('position', 'RF');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard3(150, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard3('position', 'CAM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard3(150, 20);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard3('position', 'LM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard3(150, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard3('position', 'CAM');
    }
  }

  //Card4의 위치
  card4Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard4(250, 10);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard4('position', 'LM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard4(250, 10);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard4('position', 'LM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard4(150, 300);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard4('position', 'RM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard4(210, 10);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard4('position', 'LM');
    }
  }

  //Card5의 위치
  card5Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard5(250, 110);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard5('position', 'LCM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard5(250, 110);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard5('position', 'LCM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard5(220, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard5('position', 'CM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard5(250, 100);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard5('position', 'LDM');
    }
  }

  //Card6의 위치
  card6Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard6(250, 210);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard6('position', 'RCM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard6(250, 210);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard6('position', 'RCM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard6(270, 80);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard6('position', 'LDM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard6(250, 220);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard6('position', 'RDM');
    }
  }

  //Card7의 위치
  card7Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard7(250, 310);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard7('position', 'RM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard7(250, 310);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard7('position', 'RM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard7(270, 240);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard7('position', 'RDM');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard7(210, 310);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard7('position', 'RM');
    }
  }

  //Card8의 위치
  card8Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard8(350, 60);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard8('position', 'LCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard8(350, 60);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard8('position', 'LCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard8(320, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard8('position', 'CB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard8(390, 60);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard8('position', 'CB');
    }
  }

  //Card9의 위치
  card9Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard9(350, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard9('position', 'CB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard9(350, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard9('position', 'CB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard9(380, 30);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard9('position', 'LCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard9(340, 160);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard9('position', 'LCB');
    }
  }

  //Card10의 위치
  card10Pos() {
    if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-3') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard10(350, 260);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard10('position', 'RCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-4-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard10(350, 260);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard10('position', 'RCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-3-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard10(380, 290);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard10('position', 'RCB');
    } else if (context.read<state_team_mani.Store2>().dropDownSelectedValue ==
        '3-2-2-1-2') {
      //위치 바꾸기
      context.read<state_team_mani.Store2>().changeCard10(390, 260);
      //카드 포지션
      context.read<state_team_mani.Store3>().changeCard10('position', 'RCB');
    }
  }

  //Card11의 위치
  card11Pos() {
    //위치 바꾸기
    context.read<state_team_mani.Store2>().changeCard11(450, 160);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //배경 이미지 (축구 코트)
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/soccer_ground.png'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //선수 리스트 보여주기 modal side sheet으로
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              child: Icon(Icons.accessibility_new, color: Colors.white),
              onPressed: () {
                showModalSideSheet(
                  withCloseControll: false,
                  width: MediaQuery.of(context).size.width * 3 / 4,
                  context: context,
                  ignoreAppBar: true,
                  barrierDismissible: true,
                  body: ListView.builder(
                    itemCount:
                    context.read<state_team_mani.Store3>().player.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(
                            "${context.read<state_team_mani.Store3>().player[i].values.toList()[1]}                      "
                                "${context.read<state_team_mani.Store3>().player[i].values.toList()[0]}                       "
                                "${context.read<state_team_mani.Store3>().player[i].values.toList()[2]}"),
                      );
                    },
                  ),
                );
              }),
          body: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: Stack(children: [
                //포메이션 선택 드롭다운(Dialog)
                Positioned(
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('포메이션 선택'),
                              content: SizedBox(
                                width: 50,
                                height: 300,
                                child: ListView.builder(
                                    itemCount: context
                                        .read<state_team_mani.Store2>()
                                        .dropDownList
                                        .length,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        child: ListTile(
                                          title: Text(context
                                              .read<state_team_mani.Store2>()
                                              .dropDownList[i]),
                                          onTap: () {
                                            context
                                                .read<state_team_mani.Store2>()
                                                .changeDropDownSelectedValue(
                                                context
                                                    .read<
                                                    state_team_mani
                                                        .Store2>()
                                                    .dropDownList[i]);
                                            Navigator.pop(context);
                                            card1Pos();
                                            card2Pos();
                                            card3Pos();
                                            card4Pos();
                                            card5Pos();
                                            card6Pos();
                                            card7Pos();
                                            card8Pos();
                                            card9Pos();
                                            card10Pos();
                                            card11Pos();
                                          },
                                        ),
                                      );
                                    }),
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Container(
                        width: 130,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // 선택값.
                            Text(
                              context
                                  .watch<state_team_mani.Store2>()
                                  .dropDownSelectedValue
                                  .toString(),
                              style: const TextStyle(
                                fontSize: 15,
                                height: 22 / 16,
                                color: Colors.black,
                              ),
                            ),
                            // 아이콘.
                            const Icon(
                              Icons.arrow_downward,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //선수 1
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top1,
                    left: context.read<state_team_mani.Store2>().left1,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card1()),
                //선수 2
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top2,
                    left: context.read<state_team_mani.Store2>().left2,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card2()),
                //선수 3
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top3,
                    left: context.read<state_team_mani.Store2>().left3,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card3()),
                //선수 4
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top4,
                    left: context.read<state_team_mani.Store2>().left4,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card4()),
                //선수 5
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top5,
                    left: context.read<state_team_mani.Store2>().left5,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card5()),
                //선수 6
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top6,
                    left: context.read<state_team_mani.Store2>().left6,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card6()),
                //선수 7
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top7,
                    left: context.read<state_team_mani.Store2>().left7,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card7()),
                //선수 8
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top8,
                    left: context.read<state_team_mani.Store2>().left8,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card8()),
                //선수 9
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top9,
                    left: context.read<state_team_mani.Store2>().left9,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card9()),
                //선수 10
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top10,
                    left: context.read<state_team_mani.Store2>().left10,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card10()),
                //선수 11
                AnimatedPositioned(
                    top: context.read<state_team_mani.Store2>().top11,
                    left: context.read<state_team_mani.Store2>().left11,
                    duration: Duration(milliseconds: 260),
                    curve: Curves.easeIn,
                    child: Card11()),
              ])),
        ));
  }
}
