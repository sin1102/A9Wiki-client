import 'dart:convert';

import 'package:a9wiki/models/banner_detail.dart';
import 'package:a9wiki/screen/simmulator/components/feature.dart';
import 'package:a9wiki/screen/simmulator/components/sim.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../constaint.dart';

import 'components/title.dart';

class SimulatorScreen extends StatefulWidget {
  const SimulatorScreen(this.name, {super.key});
  final String? name;

  @override
  State<SimulatorScreen> createState() => _SimulatorScreenState();
}

class _SimulatorScreenState extends State<SimulatorScreen> {
  BannerDetail banner = BannerDetail();

  @override
  void initState() {
    super.initState();
    fetchBanner(widget.name!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Titles(size: size, banner: banner),
          SizedBox(
            height: size.height * 0.01,
          ),
          Feature(size: size, banner: banner),
          Sim(size: size, banner: banner)
        ],
      ),
    );
  }

  Future<void> fetchBanner(String name) async {
    var url = '$DOMAIN/banners/name/$name';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body);
      BannerDetail res = BannerDetail.fromJson(list);
      setState(() {
        banner = res;
      });
    } else {
      print('unexpected res');
    }
  }
}
