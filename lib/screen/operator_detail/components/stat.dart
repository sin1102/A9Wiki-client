import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  const Stats({super.key, required this.size, this.base});
  final Size size;
  final Statistics? base;

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  E0max currStat = E0max();
  var btnColors = [
    Colors.black.withOpacity(0.5),
    Colors.black.withOpacity(0.35)
  ];
  var currEColor = [0, 0, 0];
  int lvl = 1;
  int currE = 0;

  @override
  void initState() {
    super.initState();
    E0max base = E0max(
        hp: widget.base!.base!.hp,
        atk: widget.base!.base!.atk,
        def: widget.base!.base!.def,
        block: widget.base!.base!.block);
    stat(base, widget.base!.e0max!, int.parse(widget.base!.e0max!.lv!), 1);
  }

  @override
  Widget build(BuildContext context) {
    E0max base = E0max(
        hp: widget.base!.base!.hp,
        atk: widget.base!.base!.atk,
        def: widget.base!.base!.def,
        block: widget.base!.base!.block);
    return Column(
      children: [
        Container(
          height: widget.size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Stats",
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.only(
              left: widget.size.height * 0.01,
              right: widget.size.height * 0.01),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currEColor.fillRange(0, currEColor.length, 0);
                        currEColor[0] = 1;
                        currE = 0;
                        lvl = 1;
                        stat(base, widget.base!.e0max!,
                            int.parse(widget.base!.e0max!.lv!), lvl);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      decoration: BoxDecoration(
                          color: btnColors[currEColor[0]],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Non-Elite",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currEColor.fillRange(0, currEColor.length, 0);
                        currEColor[1] = 1;
                        currE = 1;
                        lvl = 1;
                        stat(widget.base!.e1min!, widget.base!.e1max!,
                            int.parse(widget.base!.e1max!.lv!), lvl);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: btnColors[currEColor[1]],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Elite 1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currEColor.fillRange(0, currEColor.length, 0);
                        currEColor[2] = 1;
                        currE = 2;
                        lvl = 1;
                        stat(widget.base!.e2min!, widget.base!.e2max!,
                            int.parse(widget.base!.e2max!.lv!), lvl);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: btnColors[currEColor[2]],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Elite 2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(5),
                    height: widget.size.height * 0.03,
                    width: widget.size.width * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Level: $lvl",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.6,
                    child: Slider(
                      value: lvl.toDouble(),
                      onChanged: (newVal) {
                        setState(() {
                          lvl = newVal.toInt();
                          switch (currE) {
                            case 0:
                              stat(base, widget.base!.e0max!,
                                  int.parse(widget.base!.e0max!.lv!), lvl);
                              break;
                            case 1:
                              stat(widget.base!.e1min!, widget.base!.e1max!,
                                  int.parse(widget.base!.e1max!.lv!), lvl);
                              break;
                            case 2:
                              stat(widget.base!.e2min!, widget.base!.e2max!,
                                  int.parse(widget.base!.e2max!.lv!), lvl);
                              break;
                            default:
                          }
                        });
                      },
                      min: 1,
                      max: double.parse(currStat.lv!),
                      thumbColor: Colors.black.withOpacity(0.5),
                      activeColor: Colors.black.withOpacity(0.4),
                      inactiveColor: Colors.black.withOpacity(0.15),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'HP',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              currStat.hp!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'ATK',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              currStat.atk!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'DEF',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              currStat.def!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: widget.size.width * 0.154,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'RES',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              widget.base!.base!.resist!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.154,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'Deploy',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              widget.base!.base!.deploy!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.154,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'Cost',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              currStat.cost!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.154,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'Block',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              currStat.block!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: widget.size.width * 0.154,
                      height: widget.size.height * 0.06,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text(
                            'Interval',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          Center(
                            child: Text(
                              widget.base!.base!.interval!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void stat(E0max statMin, E0max statMax, int maxLV, int currLv) {
    currStat.lv = maxLV.toString();
    currStat.atk = linear(
            currLv, 1, maxLV, int.parse(statMin.atk!), int.parse(statMax.atk!))
        .toString();
    currStat.def = linear(
            currLv, 1, maxLV, int.parse(statMin.def!), int.parse(statMax.def!))
        .toString();
    currStat.hp =
        linear(currLv, 1, maxLV, int.parse(statMin.hp!), int.parse(statMax.hp!))
            .toString();
    currStat.block = statMin.block;
    currStat.cost = statMax.cost;
  }

  int linear(num currLv, num minLV, num maxLV, num minStat, num maxStat) {
    var a = (maxStat - minStat) / (maxLV - minLV);
    var b = maxStat - a * maxLV;
    return (a * currLv + b).toInt();
  }
}
