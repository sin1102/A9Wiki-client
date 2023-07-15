import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

import '../../../constaint.dart';

class Skill extends StatefulWidget {
  const Skill(
      {super.key, required this.size, this.skill, required this.masteryIcon});
  final Size size;
  final List<Skills>? skill;
  final List<String> masteryIcon;

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  int currSkill = 0;
  int currLv = 0;
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Skills",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(widget.size.height * 0.01),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currSkill = 0;
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
                          "Skill 1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currSkill = 1;
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
                          "Skill 2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currSkill = 2;
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
                          "Skill 3",
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
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 5,
                childAspectRatio: 1.5,
                children: [
                  for (var i = 0; i < 10; i++)
                    if (i < 7)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currLv = i;
                          });
                        },
                        child: Container(
                          width: widget.size.width * 0.17,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            (i + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currLv = i;
                          });
                        },
                        child: Container(
                          width: widget.size.width * 0.17,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '7',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23),
                              ),
                              Image(
                                  width: 25,
                                  height: 25,
                                  image:
                                      NetworkImage(widget.masteryIcon[i - 7]))
                            ],
                          ),
                        ),
                      )
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                height: widget.size.height * 0.05,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.pink.withOpacity(0.2)),
                child: Row(
                  children: [
                    Image(
                        image: NetworkImage(
                            BASE + widget.skill![currSkill].skillIcon!)),
                    SizedBox(
                      width: widget.size.width * 0.05,
                    ),
                    Text(
                      widget.skill![currSkill].name!,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Row(
                children: [
                  Container(
                    width: widget.size.width * 0.2,
                    height: widget.size.width * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'SP Cost: ${widget.skill![currSkill].variations![currLv].spCost!}',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.size.width * 0.03,
                  ),
                  Container(
                    width: widget.size.width * 0.2,
                    height: widget.size.width * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Initial SP: ${widget.skill![currSkill].variations![currLv].initialSp!}',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: widget.size.width * 0.3,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Text(
                          'SP Charge Type',
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        Text(
                          widget.skill![currSkill].skillCharge!,
                          style: TextStyle(color: Colors.blue, fontSize: 9),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.size.height * 0.005,
                  ),
                  Container(
                    width: widget.size.width * 0.3,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Text(
                          'Skill Activation',
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        Text(
                          widget.skill![0].skillActivation!,
                          style: TextStyle(color: Colors.blue, fontSize: 9),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.size.height * 0.005,
                  ),
                  Container(
                    width: widget.size.width * 0.3,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Text(
                          'Duration',
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                        Text(
                          widget
                              .skill![currSkill].variations![currLv].duration!,
                          style: TextStyle(color: Colors.blue, fontSize: 9),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.size.height * 0.01,
              ),
              Container(
                width: widget.size.width * 0.92,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      widget.skill![currSkill].variations![currLv].description!,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      height: widget.size.height * 0.01,
                    ),
                    if (widget.skill![currSkill].variations![currLv].range !=
                        "Skill does not modify range")
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width: widget.size.width * 0.2,
                              height: widget.size.height * 0.03,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                'Show Range',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: widget.size.height * 0.01,
                          ),
                          Visibility(
                            visible: show,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: widget.size.width * 0.35),
                              margin: EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Column(children: [
                                for (var i = 0;
                                    i <
                                        widget
                                            .skill![currSkill]
                                            .variations![currLv]
                                            .range![0]
                                            .length;
                                    i++)
                                  Row(
                                    children: [
                                      for (var j = 0;
                                          j <
                                              widget
                                                  .skill![currSkill]
                                                  .variations![currLv]
                                                  .range!
                                                  .length;
                                          j++)
                                        if (widget
                                                .skill![currSkill]
                                                .variations![currLv]
                                                .range![j][i] ==
                                            'unit')
                                          Container(
                                            margin: EdgeInsets.all(1),
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                          )
                                        else if (widget
                                                .skill![currSkill]
                                                .variations![currLv]
                                                .range![j][i] ==
                                            'attackable')
                                          Container(
                                            margin: EdgeInsets.all(1),
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.5,
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                          )
                                        else
                                          Container(
                                            margin: EdgeInsets.all(1),
                                            width: 10,
                                            height: 10,
                                          )
                                    ],
                                  ),
                              ]),
                            ),
                          ),
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
