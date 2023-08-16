import 'dart:convert';
import 'dart:io';

import 'package:a9wiki/screen/simmulator/simulator.dart';
import 'package:flutter/material.dart';

import '../../constaint.dart';

import 'package:http/http.dart' as http;

import '../../models/banner.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  List<Banners> banners = [];

  @override
  void initState() {
    super.initState();
    fetchBanner();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: banners.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SimulatorScreen(banners[index].name)));
          },
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height * 0.25,
              margin: EdgeInsets.only(top: size.height * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(banners[index].thumbnail!),
                      fit: BoxFit.fill)),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        banners[index].cnDate!,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        banners[index].globDate!,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ))
          ]),
        );
      },
    );
  }

  Future<void> fetchBanner() async {
    const url = '$DOMAIN/banners';
    final uri = Uri.parse(url);
    print(uri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final list = jsonDecode(body) as List;
      List<Banners> res = [];
      for (var i = 0; i < list.length; i++) {
        Banners banners = Banners.fromJson(list[i]);
        res.add(banners);
      }
      setState(() {
        banners = res;
      });
    } else {
      print('unexpected res');
    }
  }
}
