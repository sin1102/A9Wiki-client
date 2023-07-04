import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constaint.dart';
import '../../models/operators.dart';
import '../../models/tags.dart';
import '../components/item_card.dart';

class RecruitScreen extends StatefulWidget {
  const RecruitScreen({super.key});

  @override
  State<RecruitScreen> createState() => _RecruitScreenState();
}

class _RecruitScreenState extends State<RecruitScreen> {
  List<Operators> ops = [];
  List<Tags> tags = [];
  final colorText = [Colors.grey, Colors.white];
  final colorBack = [Colors.white, Colors.grey];
  var stat = List.generate(4, (index) => List.generate(16, ((index) => 0)));
  var count = 0;
  List<String> recruit = [];
  //final panelController = PanelController();

  @override
  void initState() {
    super.initState();
    fetchTags();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: MediaQuery.of(context).size.height * 0.05,
      maxHeight: MediaQuery.of(context).size.height * 0.5,
      body: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.15),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
              itemCount: ops.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin,
                crossAxisSpacing: kDefaultPaddin,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final ope = ops[index];
                return ItemCard(ope);
              }),
        ),
      ),
      panelBuilder: (controller) {
        return SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Stack(
              children: <Widget>[
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tags.length,
                    itemBuilder: (context, index) {
                      final tag = tags[index];
                      final i = index;
                      return Column(children: <Widget>[
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: Text(tags[index].category.toString(),
                                style: TextStyle(
                                    color: Color(0xFF7C7E80),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: tag.tagname!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2.5,
                            ),
                            itemBuilder: (context, index) {
                              final j = index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (count < 3 && (stat[i][j] == 0)) {
                                      stat[i][j] = 1;
                                      count++;
                                      recruit.add(
                                          tag.tagname![index].toLowerCase());
                                      fetchOp(recruit);
                                    } else if (stat[i][j] == 1) {
                                      stat[i][j] = 0;
                                      count--;
                                      recruit.remove(
                                          tag.tagname![index].toLowerCase());
                                      fetchOp(recruit);
                                      if (recruit.isEmpty) {
                                        ops = [];
                                      }
                                    }
                                  });
                                  print(recruit);
                                },
                                child: Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: colorBack[stat[i][j]],
                                      border: Border.all(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 126, 122, 122)),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    tag.tagname![index],
                                    style: TextStyle(
                                        color: colorText[stat[i][j]],
                                        fontSize: 13),
                                  )),
                                ),
                              );
                            })
                      ]);
                    }),
                Positioned(
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    );
  }

  Future<void> fetchOp(List<String> recruit) async {
    print('fetop called');
    String url = '';
    if (recruit.isNotEmpty) {
      switch (recruit.length) {
        case 1:
          url =
              'http://192.168.1.2:3000/operators/recruit/%7Btag%7D?tag1=${recruit[0]}';
          break;
        case 2:
          url =
              'http://192.168.1.2:3000/operators/recruit/%7Btag%7D?tag1=${recruit[0]}&tag2=${recruit[1]}';
          break;
        case 3:
          url =
              'http://192.168.1.2:3000/operators/recruit/%7Btag%7D?tag1=${recruit[0]}&tag2=${recruit[1]}&tag3=${recruit[2]}';
          break;
        default:
      }
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final list = jsonDecode(body) as List;
        List<Operators> res = [];
        for (var i = 0; i < list.length; i++) {
          Operators op = Operators.fromJson(list[i]);
          res.add(op);
        }
        setState(() {
          ops = res;
        });
        print('fetch completed');
      } else {
        print('unexpected res');
      }
    }
  }

  Future<void> fetchTags() async {
    print('fetTags called');
    const url = 'http://192.168.1.2:3000/tags';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body) as List;
      List<Tags> res = [];
      for (var i = 0; i < list.length; i++) {
        Tags tag = Tags.fromJson(list[i]);
        res.add(tag);
      }
      setState(() {
        tags = res;
      });

      print('fetch completed');
    } else {
      print('unexpected res');
    }
  }
}
