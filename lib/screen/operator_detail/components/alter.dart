import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../../models/operators.dart';
import '../../components/item_card.dart';

class Alter extends StatefulWidget {
  const Alter({
    super.key,
    required this.size,
    required this.alterName,
  });

  final Size size;
  final String? alterName;

  @override
  State<Alter> createState() => _AlterState();
}

class _AlterState extends State<Alter> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: widget.size.height * 0.05,
        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
        child: Center(
            child: Text(
          "Alternative Forms",
          style: TextStyle(color: Colors.white),
        )),
      ),
      Container(
          margin: EdgeInsets.all(widget.size.height * 0.01),
          padding: EdgeInsets.only(left: widget.size.width * 0.26),
          height: widget.size.height * 0.3,
          child: FutureBuilder(
              future: fetchAlter(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.grey,
                  ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  Operators alter = snapshot.data!;
                  return ItemCard(alter);
                }
              })),
    ]);
  }

  Future<Operators> fetchAlter() async {
    Operators alter = Operators();
    final alterName = widget.alterName;
    final url = 'http://192.168.1.2:3000/operators/name/$alterName';
    print(url);
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final res = jsonDecode(body);

      alter = Operators.fromJson(res);

      print(alter);
    } else {
      print('unexpected res');
    }
    return alter;
  }
}
