import 'dart:convert';

import 'package:a9wiki/constaint.dart';
import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class OperatorDetailScreen extends StatefulWidget {
  final String? opId;
  const OperatorDetailScreen(this.opId, {super.key});

  @override
  State<OperatorDetailScreen> createState() => _OperatorDetailScreenState();
}

class _OperatorDetailScreenState extends State<OperatorDetailScreen> {
  OperatorDetail op = OperatorDetail();
  int curr = 0;
  @override
  void initState() {
    super.initState();
    fetchOp();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Image> rare = [];
    final r = op.rarity;
    var range = op.range![curr].range;

    for (int i = 0; i < r!; i++) {
      rare.add(Image(
        image: NetworkImage(
            'https://gamepress.gg/sites/arknights/files/2019-10/star.png'),
        width: 15,
        height: 15,
      ));
    }
    print(BASE + op.subClassIcon!);
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: EdgeInsets.only(top: size.height * 0.05),
          alignment: Alignment.topCenter,
          height: size.height * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 22,
                    color: Colors.grey.withOpacity(0.22))
              ]),
          child: Image.network(op.art![curr].link!),
        ),
        Positioned(
            top: size.height * 0.005,
            left: size.width * 0.05,
            child: SizedBox(
              height: size.height * 0.2,
              width: size.width * 0.2,
              child: Image.network(BASE + op.faction!),
            )),
        Positioned(
            top: size.height * 0.04,
            left: size.width * 0.37,
            child: Row(
              children: rare,
            )),
        Positioned(
            top: size.height * 0.015,
            right: size.width * 0.01,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  width: size.width * 0.15,
                  margin: EdgeInsets.only(
                      top: size.height * 0.05, right: size.height * 0.02),
                  child: Image.network(BASE + op.classIcon!),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  margin: EdgeInsets.only(right: size.height * 0.02),
                  width: size.width * 0.15,
                  child: Text(
                    op.classes![0],
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  width: size.width * 0.15,
                  margin: EdgeInsets.only(right: size.height * 0.02),
                  child: Image.network(BASE + op.subClassIcon!),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black),
                  margin: EdgeInsets.only(right: size.height * 0.02),
                  width: size.width * 0.15,
                  child: Text(
                    op.classes![1],
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
        Positioned(
            left: size.width * 0.05,
            top: size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      curr = 0;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 22,
                              color: Colors.grey.withOpacity(0.22)),
                          BoxShadow(
                              offset: Offset(-15, -15),
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.10))
                        ]),
                    child: Image.network(
                        'https://gamepress.gg/sites/arknights/files/2019-10/0.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      curr = 1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 22,
                              color: Colors.grey.withOpacity(0.22)),
                          BoxShadow(
                              offset: Offset(-15, -15),
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.10))
                        ]),
                    child: Image.network(
                        'https://gamepress.gg/sites/arknights/files/2019-10/1.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      curr = 2;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 22,
                              color: Colors.grey.withOpacity(0.22)),
                          BoxShadow(
                              offset: Offset(-15, -15),
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.10))
                        ]),
                    child: Image.network(
                        'https://gamepress.gg/sites/arknights/files/2019-10/2.png'),
                  ),
                )
              ],
            )),
        Positioned(
          right: size.width * 0.05,
          top: size.height * 0.45,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(children: [
              Text(
                'Range',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 15),
                child: Column(children: [
                  for (var i = 0; i < range![0].length; i++)
                    Row(
                      children: [
                        for (var j = 0; j < range.length; j++)
                          if (range[j][i] == 'unit')
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(color: Colors.white),
                            )
                          else if (range[j][i] == 'attackable')
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.white)),
                            )
                          else
                            SizedBox(
                              width: 10,
                              height: 10,
                            )
                      ],
                    ),
                ]),
              ),
            ]),
          ),
        )
      ]),
    );
  }

  Future<void> fetchOp() async {
    final id = widget.opId;
    print('fetTags called');
    final url = 'http://192.168.1.2:3000/operators/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final res = jsonDecode(body);
      setState(() {
        op = OperatorDetail.fromJson(res);
      });
      print('fetch completed');
    } else {
      print('unexpected res');
    }
  }
}
