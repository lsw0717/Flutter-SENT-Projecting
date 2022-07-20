import 'package:flutter/material.dart';
import 'package:myapp/stateDirectory/state_team_mani.dart' as state_team_mani;
import 'package:provider/provider.dart';

class Card4 extends StatefulWidget {
  const Card4({Key? key}) : super(key: key);

  @override
  State<Card4> createState() => _Card4State();
}

class _Card4State extends State<Card4> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //bottom up sheet을 보여줌
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              color: Colors.white,
              child:ListView.builder(
                  itemCount: context.read<state_team_mani.Store3>().bottomlist(0).length,
                  itemBuilder: (context, i){
                    return ListTile(
                      title: Text(context.read<state_team_mani.Store3>().bottomlist(1)[i]['name']),
                      onTap: ()  async {
                        //앱 최초 실행 후 team position page에 들어왔을 때 대비하기 위해,
                        if(context.read<state_team_mani.Store3>().card4['name']!=''){
                          //카드에서 삭제한 선수 positioned true로 바꾸기(선수 선택 리스트에 추가)
                          await context.read<state_team_mani.Store3>().changePositioned2(context.read<state_team_mani.Store3>().card4);
                        }
                        //카드에 선수 이름 추가
                        context.read<state_team_mani.Store3>().changeCard4('name',context.read<state_team_mani.Store3>().bottomlist(1)[i]['name']);
                        //카드에 선수 등번호 추가
                        context.read<state_team_mani.Store3>().changeCard4('number',context.read<state_team_mani.Store3>().bottomlist(1)[i]['number']);
                        //카드에 추가한 선수 positioned false로 바꾸기(선수 선택 리스트에서 삭제)
                        context.read<state_team_mani.Store3>().changePositioned(i);
                        Navigator.pop(context);
                      },
                    );
                  })
            );
          },
        );
      },
      child: Container(
        width: 70,
        height: 90,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(19),
              topRight: Radius.circular(19),
              bottomLeft: Radius.circular(19),
              bottomRight: Radius.circular(19),
            ),
            border: Border.all(color: Colors.black, width: 3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //카드 포메이션
            Text(
              context
                  .watch<state_team_mani.Store3>()
                  .card4['position']
                  .toString(),
              style: TextStyle(fontSize: 15),
            ),
            //선수 이름
            Text(
              context.watch<state_team_mani.Store3>().card4['name'].toString(),
              style: TextStyle(fontSize: 15),
            ),
            //등번호
            Text(
              context
                  .watch<state_team_mani.Store3>()
                  .card4['number']
                  .toString(),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
