import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

import '../../../constaint.dart';

class Costs extends StatelessWidget {
  const Costs(
      {super.key,
      required this.elitImg,
      required this.masteryIcon,
      required this.op,
      required this.size});
  final Size size;
  final OperatorDetail op;
  final List<String> masteryIcon;
  final List<String> elitImg;

  @override
  Widget build(BuildContext context) {
    var cost17 = op.costs17;
    var cost810 = op.costs810;
    var eliteCost = op.costsElite;
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Upgrade Costs",
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
            child: Column(children: [
              Table(
                columnWidths: {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(5),
                },
                border: TableBorder.all(width: 1, color: Colors.white),
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Level',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Requisites',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Materials',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]),
                  for (var i = 0; i < cost17!.length; i++)
                    TableRow(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          cost17[i].lvl!,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Lv1 ',
                              style: TextStyle(color: Colors.white),
                            ),
                            if (i <= 2)
                              Image(
                                image: NetworkImage(elitImg[0]),
                                width: 25,
                                height: 25,
                              )
                            else
                              Image(
                                image: NetworkImage(elitImg[1]),
                                width: 25,
                                height: 25,
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          for (var k = 0; k < cost17[i].cost!.length; k++)
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        BASE + cost17[i].cost![k].icon!),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Positioned(
                                      bottom: 3,
                                      left: 3,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Text(
                                          cost17[i].cost![k].amount!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ],
                      ),
                    ])
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Table(
                border: TableBorder.all(width: 1, color: Colors.white),
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(2.5),
                  3: FlexColumnWidth(4)
                },
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Skill',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Level',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Requisites',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Materials',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ]),
                  for (var i = 0; i < cost810!.length; i++)
                    TableRow(children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          cost810[i].lvl!.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            if (cost810[i].time == '8h')
                              Image(
                                image: NetworkImage(masteryIcon[0]),
                                width: 25,
                                height: 25,
                              ),
                            if (cost810[i].time == '16h')
                              Image(
                                image: NetworkImage(masteryIcon[1]),
                                width: 25,
                                height: 25,
                              ),
                            if (cost810[i].time == '24h')
                              Image(
                                image: NetworkImage(masteryIcon[2]),
                                width: 25,
                                height: 25,
                              ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Lv1 ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.av_timer,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                Text(
                                  cost810[i].time!,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Image(
                              image: NetworkImage(elitImg[2]),
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          for (var k = 0; k < cost810[i].cost!.length; k++)
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        BASE + cost810[i].cost![k].icon!),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Positioned(
                                      bottom: 3,
                                      left: 3,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Text(
                                          cost810[i].cost![k].amount!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ],
                      ),
                    ])
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Table(
                border: TableBorder.all(width: 1, color: Colors.white),
                columnWidths: {
                  0: FlexColumnWidth(3),
                  1: FlexColumnWidth(6),
                },
                children: [
                  TableRow(children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Level',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Materials',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]),
                  for (var i = 0; i < eliteCost!.length; i++)
                    TableRow(children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (eliteCost[i].elite == 1)
                              Row(
                                children: [
                                  Image(
                                    image: NetworkImage(elitImg[0]),
                                    width: 25,
                                    height: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(
                                      Icons.arrow_right_alt_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                  Image(
                                    image: NetworkImage(elitImg[1]),
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              )
                            else
                              Row(
                                children: [
                                  Image(
                                    image: NetworkImage(elitImg[1]),
                                    width: 25,
                                    height: 25,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(Icons.arrow_right_alt_rounded,
                                        color: Colors.white, size: 25),
                                  ),
                                  Image(
                                    image: NetworkImage(elitImg[2]),
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          for (var k = 0; k < eliteCost[i].cost!.length; k++)
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        BASE + eliteCost[i].cost![k].icon!),
                                    width: 40,
                                    height: 40,
                                  ),
                                  Positioned(
                                      bottom: 3,
                                      left: 3,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        child: Text(
                                          eliteCost[i].cost![k].amount!,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ))
                                ],
                              ),
                            )
                        ],
                      ),
                    ])
                ],
              )
            ]),
          ),
        )
      ],
    );
  }
}
