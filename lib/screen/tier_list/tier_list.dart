import 'dart:convert';

import 'package:a9wiki/models/tier.dart';
import 'package:a9wiki/screen/tier_list/components/op_card.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constaint.dart';
import 'package:http/http.dart' as http;

import '../../models/classes.dart';

class TierListScreen extends StatefulWidget {
  const TierListScreen({super.key});

  @override
  State<TierListScreen> createState() => _TierListState();
}

class _TierListState extends State<TierListScreen> {
  List<Classes> listClass = [];
  List<Tier> listTiers = [];
  List<Tier> currListTier = [];
  List<String> tag = [];
  var classState = List.generate(8, (index) => 0);
  var classColor = [Colors.white, Colors.blue];
  var subClassState = List.generate(8, (index) => List.generate(11, (i) => 0));
  var subClassColor = [
    Colors.black.withOpacity(0.5),
    Colors.black.withOpacity(0.3)
  ];

  @override
  void initState() {
    super.initState();
    fetchClass();
    fetchTier();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SlidingUpPanel(
      minHeight: size.height * 0.03,
      maxHeight: size.height * 0.7,
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      body: Container(
        margin: EdgeInsets.only(bottom: size.height * 0.12),
        child: ListView.builder(
          itemCount: listTiers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: size.height * 0.05,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.9)),
                  child: Row(children: [
                    Image(
                        image: NetworkImage(BASE +
                            listTiers[index].tiers![0].ops![0].op!.classIcon!)),
                    SizedBox(width: size.width * 0.03),
                    Text(
                      listTiers[index].classes![0],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      width: size.height * 0.03,
                      height: size.height * 0.03,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Image(
                          image: NetworkImage(BASE +
                              listTiers[index]
                                  .tiers![0]
                                  .ops![0]
                                  .op!
                                  .subClassIcon!)),
                    ),
                    SizedBox(width: size.width * 0.03),
                    Text(
                      listTiers[index].classes![1],
                      style: TextStyle(color: Colors.white),
                    )
                  ]),
                ),
                Table(
                  border: TableBorder.all(
                      width: 1, color: Colors.black.withOpacity(0.5)),
                  columnWidths: {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(8),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    for (var i = 0; i < listTiers[index].tiers!.length; i++)
                      TableRow(children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              listTiers[index].tiers![i].tier!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Wrap(
                          spacing: size.height * 0.01,
                          runSpacing: size.height * 0.01,
                          children: [
                            for (var j = 0;
                                j < listTiers[index].tiers![i].ops!.length;
                                j++)
                              OpCard(
                                  ops: listTiers[index].tiers![i].ops![j],
                                  size: size)
                          ],
                        )
                      ])
                  ],
                )
              ],
            );
          },
        ),
      ),
      panelBuilder: (controller) {
        return Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 30,
                height: 5,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  for (var i = 0; i < listClass.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.01, bottom: size.height * 0.01),
                      child: Stack(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.3,
                            margin: EdgeInsets.only(
                                top: size.height * 0.01,
                                bottom: size.height * 0.01),
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                          Container(
                            width: size.width * 0.8,
                            margin: EdgeInsets.only(left: 50),
                            padding:
                                EdgeInsets.only(left: 50, bottom: 10, top: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Colors.black.withOpacity(0.25)),
                                borderRadius: BorderRadius.circular(5)),
                            child: Wrap(
                              spacing: size.width * 0.1,
                              runSpacing: size.height * 0.04,
                              children: [
                                for (var j = 0;
                                    j < listClass[i].subClass!.length;
                                    j++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (subClassState[i][j] == 0) {
                                          subClassState[i][j] = 1;
                                          tag.add(
                                              listClass[i].subClass![j].name!);
                                        } else {
                                          subClassState[i][j] = 0;
                                          tag.remove(
                                              listClass[i].subClass![j].name!);
                                        }
                                        listTiers = currListTier
                                            .where((element) => element.classes!
                                                .any((element) =>
                                                    tag.contains(element)))
                                            .toList();
                                      });
                                    },
                                    child: Container(
                                      width: size.width * 0.25,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: subClassColor[subClassState[i]
                                              [j]],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        children: [
                                          Image(
                                            image: NetworkImage(BASE +
                                                listClass[i]
                                                    .subClass![j]
                                                    .icon!),
                                            height: 30,
                                          ),
                                          Text(
                                            listClass[i].subClass![j].name!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Positioned.fill(
                              left: size.width * 0.075,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (classState[i] == 0) {
                                        classState[i] = 1;
                                        tag.add(listClass[i].name!);
                                      } else {
                                        classState[i] = 0;
                                        tag.remove(listClass[i].name);
                                      }
                                      listTiers = currListTier
                                          .where((element) => element.classes!
                                              .any((element) =>
                                                  tag.contains(element)))
                                          .toList();
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            classColor[classState[i]],
                                            BlendMode.color),
                                        child: Image.network(
                                            BASE + listClass[i].icon!)),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchClass() async {
    const url = '$DOMAIN/classes';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body) as List;
      List<Classes> res = [];
      for (var i = 0; i < list.length; i++) {
        Classes classes = Classes.fromJson(list[i]);
        res.add(classes);
      }
      setState(() {
        listClass = res;
      });
    } else {
      print('unexpected res');
    }
  }

  Future<void> fetchTier() async {
    const url = '$DOMAIN/tier';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body) as List;
      List<Tier> res = [];
      for (var i = 0; i < list.length; i++) {
        Tier tiers = Tier.fromJson(list[i]);
        res.add(tiers);
      }
      setState(() {
        currListTier = res;
      });
    } else {
      print('unexpected res');
    }
  }
}
