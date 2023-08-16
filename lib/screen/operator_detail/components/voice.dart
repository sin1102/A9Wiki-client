import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class Voice extends StatelessWidget {
  const Voice({
    super.key,
    required this.size,
    required this.op,
  });

  final Size size;
  final OperatorDetail op;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Voice Lines",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(5)),
            child: Table(
              border: TableBorder.all(width: 1, color: Colors.white),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Appointed as Assistant',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.appointedAsAssistant!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talk1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talk2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talk3!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk after promotion 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talkAfterPromotion1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk after promotion 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talkAfterPromotion2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk after trust increase 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talkAfterTrustIncrease1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk after trust increase 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talkAfterTrustIncrease2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Talk after trust increase 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.talkAfterTrustIncrease3!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Idle',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.idle!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Onboard',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.onboard!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Watching battle record',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.watchingBattleRecord!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Promotion 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.promotion1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Promotion 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.promotion2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Added to squad',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.addedToSquad!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Appointed as Squad Leader',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.appointedAsSquadLeader!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Depart',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.depart!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Begin Operation',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.beginOperation!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Slecting Operator 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.selectingOperator1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Slecting Operator 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.selectingOperator2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Deployment 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.deployment1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Deployment 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.deployment2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'In battle 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.inBattle1!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'In battle 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.inBattle2!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'In battle 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.inBattle3!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'In battle 4',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.inBattle4!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      '3-Star result',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.s3StarResult!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Sub 3-Star result',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.sub3StarResult!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Operation Failure',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.operationFailure!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Assign to facility',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.assignedToFacility!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Tap',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.tap!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Trust tap',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.trustTap!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Title',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.title!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
                TableRow(children: [
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Greeting',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Center(
                      child: Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      op.voicelines!.greeting!,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
                ]),
              ],
            ),
          ),
        )
      ],
    );
  }
}
