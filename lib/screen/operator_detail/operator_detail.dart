import 'dart:convert';

import 'package:a9wiki/models/operatordetail.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'components/screen.dart';

class OperatorDetailScreen extends StatefulWidget {
  final String? opId;
  const OperatorDetailScreen(this.opId, {super.key});

  @override
  State<OperatorDetailScreen> createState() => _OperatorDetailScreenState();
}

class _OperatorDetailScreenState extends State<OperatorDetailScreen> {
  List<String> poten = [
    'https://gamepress.gg/arknights/sites/arknights/files/2019-10/1_0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/2_1.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/3_1.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/4_0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/5_0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/6.png'
  ];
  List<String> elitImg = [
    'https://gamepress.gg/sites/arknights/files/2019-10/0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/1.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/2.png'
  ];
  List<String> masteryIcon = [
    'https://gamepress.gg/sites/arknights/files/2019-10/m-1_0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/m-2_0.png',
    'https://gamepress.gg/sites/arknights/files/2019-10/m-3_0.png'
  ];

  @override
  // void initState() {

  //   super.initState();
  //   fetchOp();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: fetchOp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            OperatorDetail op = snapshot.data!;
            return Screen(
              op: op,
              size: size,
              elitImg: elitImg,
              poten: poten,
              masteryIcon: masteryIcon,
            );
          }
        },
      ),
    );
  }

  Future<OperatorDetail> fetchOp() async {
    OperatorDetail op = OperatorDetail();
    final id = widget.opId;
    print('fetTags called');
    final url = 'http://192.168.1.2:3000/operators/id/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final res = jsonDecode(body);
      op = OperatorDetail.fromJson(res);
      print('fetch completed');
    } else {
      print('unexpected res');
    }
    return op;
  }
}
