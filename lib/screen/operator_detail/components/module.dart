import 'package:a9wiki/constaint.dart';
import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

class Modules extends StatefulWidget {
  const Modules(
      {super.key,
      required this.size,
      required this.module,
      required this.elite,
      required this.poten});
  final List<Module> module;
  final Size size;
  final List<String> elite;
  final List<String> poten;
  @override
  State<Modules> createState() => _ModuleState();
}

class _ModuleState extends State<Modules> {
  List<String> lvIcon = [
    'https://gamepress.gg/sites/arknights/files/2022-06/img_stg1%5B1%5D.png',
    'https://gamepress.gg/sites/arknights/files/2022-06/img_stg2%5B1%5D.png',
    'https://gamepress.gg/sites/arknights/files/2022-06/img_stg3%5B1%5D.png'
  ];
  var currLv = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Modules",
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.all(widget.size.height * 0.01),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Column(
            children: [
              for (var i = 0; i < widget.module.length; i++)
                Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          if (widget.module[i].icon != null)
                            Image(
                                image:
                                    NetworkImage(BASE + widget.module[i].icon!))
                          else
                            Image(
                                image: NetworkImage(
                                    'https://gamepress.gg/arknights/sites/arknights/files/styles/thumbnail/public/2021-08/original_7.png?itok=7xjSHWpW')),
                          SizedBox(
                            width: widget.size.width * 0.02,
                          ),
                          Column(
                            children: [
                              Text(
                                widget.module[i].name!
                                    .toString()
                                    .replaceAll('&#039;', '\u2019')
                                    .replaceAll('&amp;', '&'),
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Lvl. ${widget.module[i].levels![0].level}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              SizedBox(
                                height: widget.size.height * 0.03,
                              ),
                              Text(
                                widget.module[i].trust!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              SizedBox(
                                width: widget.size.width * 0.02,
                              ),
                              Text(
                                widget.module[i].availability!,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              )
                            ],
                          )
                        ],
                      ),
                      if (widget.module[i].levels!.length > 1)
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currLv[i] = 0;
                                    });
                                  },
                                  child: Container(
                                    width: widget.size.width * 0.270,
                                    height: widget.size.height * 0.05,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: NetworkImage(lvIcon[0]),
                                          width: 30,
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: widget.size.width * 0.02,
                                        ),
                                        Text(
                                          "Level 1",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currLv[i] = 1;
                                    });
                                  },
                                  child: Container(
                                    width: widget.size.width * 0.270,
                                    height: widget.size.height * 0.05,
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: NetworkImage(lvIcon[1]),
                                          width: 30,
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: widget.size.width * 0.02,
                                        ),
                                        Text(
                                          "Level 2",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currLv[i] = 2;
                                    });
                                  },
                                  child: Container(
                                    width: widget.size.width * 0.270,
                                    height: widget.size.height * 0.05,
                                    margin: EdgeInsets.only(left: 10),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Image(
                                          image: NetworkImage(lvIcon[2]),
                                          width: 30,
                                          height: 30,
                                        ),
                                        SizedBox(
                                          width: widget.size.width * 0.02,
                                        ),
                                        Text(
                                          "Level 3",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            Text(
                              'Equip Trait',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            Text(
                              widget.module[i].levels![1].trait!,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            if (widget.module[i].levels![currLv[i]]
                                .talentChanges!.isNotEmpty)
                              Column(
                                children: [
                                  Text(
                                    'Talent Information',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  SizedBox(
                                    height: widget.size.height * 0.01,
                                  ),
                                  Column(
                                    children: [
                                      for (var j = 0;
                                          j <
                                              widget
                                                  .module[i]
                                                  .levels![currLv[i]]
                                                  .talentChanges!
                                                  .length;
                                          j++)
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          width: widget.size.width,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    widget
                                                        .module[i]
                                                        .levels![currLv[i]]
                                                        .talentChanges![j]
                                                        .name!,
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 11),
                                                  ),
                                                  SizedBox(
                                                    width: widget.size.width *
                                                        0.01,
                                                  ),
                                                  Image(
                                                    image: NetworkImage(
                                                        widget.elite[2]),
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: widget.size.width *
                                                        0.01,
                                                  ),
                                                  Image(
                                                    image: NetworkImage(widget
                                                        .poten[int.parse(widget
                                                            .module[i]
                                                            .levels![currLv[i]]
                                                            .talentChanges![j]
                                                            .potential!) -
                                                        1]),
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  SizedBox(
                                                    width: widget.size.width *
                                                        0.01,
                                                  ),
                                                  Text(
                                                    widget.module[i].name!
                                                        .toString()
                                                        .replaceAll(
                                                            '&#039;', '\u2019')
                                                        .replaceAll(
                                                            '&amp;', '&'),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                  SizedBox(
                                                    width: widget.size.width *
                                                        0.01,
                                                  ),
                                                  Text(
                                                    'Lvl. ${widget.module[i].levels![currLv[i]].talentChanges![j].moduleLevel}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height:
                                                    widget.size.height * 0.01,
                                              ),
                                              Text(
                                                widget
                                                    .module[i]
                                                    .levels![currLv[i]]
                                                    .talentChanges![j]
                                                    .value!,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        )
                                    ],
                                  )
                                ],
                              ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            Text(
                              'Unlock Information',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6)),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.01,
                            ),
                            Table(
                              border: TableBorder.all(
                                  width: 1, color: Colors.white),
                              children: [
                                TableRow(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3)),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text(
                                          'Materials',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                                TableRow(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (var k = 0;
                                          k <
                                              widget
                                                  .module[i]
                                                  .levels![currLv[i]]
                                                  .cost!
                                                  .length;
                                          k++)
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Stack(
                                            children: [
                                              Image(
                                                image: NetworkImage(BASE +
                                                    widget
                                                        .module[i]
                                                        .levels![currLv[i]]
                                                        .cost![k]
                                                        .icon!),
                                                width: 50,
                                                height: 50,
                                              ),
                                              Positioned(
                                                  bottom: 3,
                                                  left: 3,
                                                  child: Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                    child: Text(
                                                      widget
                                                          .module[i]
                                                          .levels![currLv[i]]
                                                          .cost![k]
                                                          .amount!,
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
                                ]),
                                TableRow(children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3)),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text(
                                          'Missions',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        widget.module[i].levels![0].unlock![0],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ]),
                                TableRow(children: [
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        widget.module[i].levels![0].unlock![1],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  )
                                ])
                              ],
                            )
                          ],
                        )
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
