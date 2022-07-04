import 'package:flutter/material.dart';
import 'package:myapp/stateDirectory/state_team_mani.dart' as state_team_mani;
import 'package:provider/provider.dart';

class Card9 extends StatefulWidget {
  const Card9({Key? key}) : super(key: key);

  @override
  State<Card9> createState() => _Card9State();
}

class _Card9State extends State<Card9> {
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
              child: Center(
                  child: ListView.builder(
                    itemCount: context.read<state_team_mani.Store3>().player.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(context
                            .read<state_team_mani.Store3>()
                            .player[i]
                            .values
                            .toList()[0]
                            .toString()),
                        onTap: () {
                          context.read<state_team_mani.Store3>().changeCard9(
                              'name',
                              context
                                  .read<state_team_mani.Store3>()
                                  .player[i]
                                  .values
                                  .toList()[0]
                                  .toString());
                          //카드 등번호
                          context.read<state_team_mani.Store3>().changeCard9(
                              'number',
                              context
                                  .read<state_team_mani.Store3>()
                                  .player[i]
                                  .values
                                  .toList()[2]
                                  .toString());
                          Navigator.pop(context);
                        },
                      );
                    },
                  )),
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
                  .card9['position']
                  .toString(),
              style: TextStyle(fontSize: 15),
            ),
            //선수 이름
            Text(
              context.watch<state_team_mani.Store3>().card9['name'].toString(),
              style: TextStyle(fontSize: 15),
            ),
            //등번호
            Text(
              context
                  .watch<state_team_mani.Store3>()
                  .card9['number']
                  .toString(),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
