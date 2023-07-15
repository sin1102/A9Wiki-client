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
  E0max currStat = E0max(hp: '0', atk: '0', block: '0', def: '0');
  @override
  Widget build(BuildContext context) {
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
                        currStat = widget.base!.e0max!;
                        print(currStat.atk);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
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
                        currStat = widget.base!.e1max!;
                        print(currStat.atk);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
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
                        currStat = widget.base!.e2max!;
                        print(currStat.atk);
                      });
                    },
                    child: Container(
                      width: widget.size.width * 0.275,
                      height: widget.size.height * 0.05,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
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
                              widget.base!.base!.cost!,
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
}
