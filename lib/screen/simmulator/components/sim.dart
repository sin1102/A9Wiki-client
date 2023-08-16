import 'dart:convert';

import 'package:a9wiki/models/banner_detail.dart';
import 'package:a9wiki/models/sim_result.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../../constaint.dart';

class Sim extends StatefulWidget {
  const Sim({super.key, required this.banner, required this.size});
  final Size size;
  final BannerDetail banner;

  @override
  State<Sim> createState() => _SimState();
}

class _SimState extends State<Sim> {
  int gemSpent = 0;
  int countPity = 0;
  int count = 0;
  int sixStarRate = 2;
  String have5Star = 'false';
  String have6Star = 'false';
  double money = 0.00;
  List<Ops> ops = [];
  SimulatorResult result = SimulatorResult();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            'Simmulator',
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        GestureDetector(
          onTap: () async {
            print(result.countPity);
            var temp = await fetchResult(widget.banner.name!, count, 10,
                countPity, sixStarRate, have5Star, have6Star);
            setState(() {
              result = temp;
              gemSpent += 6000;
              countPity = temp.countPity!;
              have5Star = temp.have5Star.toString();
              have6Star = temp.have6Star.toString();
              money += 11.41;
              count = temp.pullCount!;
              sixStarRate = temp.sixSrarRate!;
            });
          },
          child: Container(
            width: widget.size.width * 0.7,
            height: widget.size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              'Summon',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        Table(
          border:
              TableBorder.all(width: 1, color: Colors.black.withOpacity(0.5)),
          columnWidths: {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(3),
            3: FlexColumnWidth(2),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  child: Text('Gems Spent')),
              Container(
                  padding: EdgeInsets.all(5), child: Text(gemSpent.toString())),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  child: Text('Money spent')),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Text('${money.toStringAsFixed(2)}\$'))
            ]),
            TableRow(children: [
              Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  child: Text('Pulls w/o 6*')),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Text(countPity.toString())),
              Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.1)),
                  child: Text('Current 6* Rate')),
              Container(
                  padding: EdgeInsets.all(5), child: Text('$sixStarRate%'))
            ])
          ],
        ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        if (result.ops != null)
          Wrap(
            spacing: widget.size.width * 0.1,
            runSpacing: widget.size.height * 0.04,
            children: [
              for (var i = 0; i < result.ops!.length; i++)
                Container(
                  width: widget.size.height * 0.15,
                  height: widget.size.height * 0.15,
                  decoration: BoxDecoration(
                      color: result.ops![i].rarity == 6
                          ? Colors.red
                          : result.ops![i].rarity == 5
                              ? Colors.blue
                              : Colors.white),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: NetworkImage(BASE + result.ops![i].icon!),
                          width: widget.size.height * 0.12,
                          height: widget.size.height * 0.12,
                        ),
                        RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                                text: result.ops![i].name
                                    .toString()
                                    .replaceAll('&#039;', '\u2019'),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5))))
                      ]),
                ),
            ],
          ),
        SizedBox(
          height: widget.size.height * 0.01,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              result = SimulatorResult();
              gemSpent = 0;
              countPity = 0;
              have5Star = 'false';
              have6Star = 'false';
              money = 0;
              count = 0;
              sixStarRate = 2;
            });
          },
          child: Container(
            width: widget.size.width * 0.7,
            height: widget.size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }

  Future<SimulatorResult> fetchResult(
      String name,
      int count,
      int timesPull,
      int countPity,
      int sixStarRate,
      String have5Star,
      String have6Star) async {
    SimulatorResult result = SimulatorResult();
    var url =
        '$DOMAIN/banners/$name?timesPull=$timesPull&count=$count&countPity=$countPity&sixStarRate=$sixStarRate&have6Star=$have6Star&have5Star=$have5Star';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body);
      SimulatorResult res = SimulatorResult.fromJson(list);
      setState(() {
        result = res;
      });
    } else {
      print('unexpected res');
    }
    return result;
  }
}
