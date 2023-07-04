import 'dart:convert';

import 'package:a9wiki/models/operators.dart';
import 'package:flutter/material.dart';

import '../../constaint.dart';
import '../components/item_card.dart';
import 'package:http/http.dart' as http;

class OperatorsList extends StatefulWidget {
  const OperatorsList();

  @override
  State<OperatorsList> createState() => _OperatorsListState();
}

class _OperatorsListState extends State<OperatorsList> {
  List<Operators> ops = [];
  final scrollController = ScrollController();
  int page = 1;
  String opname = '';

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListioner);
    fetchOp();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                  itemCount: ops.length,
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin,
                    crossAxisSpacing: kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final ope = ops[index];
                    return ItemCard(
                      ope,
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color:
                          Color.fromARGB(255, 192, 192, 192).withOpacity(0.23),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            ops = [];
                            page = 1;
                            opname = value;
                            fetchOp();
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 78, 78, 78)
                                .withOpacity(0.5),
                            fontSize: 15,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchOp() async {
    print('fetop called');
    final url =
        'http://192.168.1.2:3000/operators?resPerPage=10&currPage=$page&opName=$opname';
    final uri = Uri.parse(url);
    print(uri);
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
        ops += res;
      });
      print('fetch completed');
    } else {
      print('unexpected res');
    }
  }

  void _scrollListioner() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page += 1;
      fetchOp();
    }
  }
}
