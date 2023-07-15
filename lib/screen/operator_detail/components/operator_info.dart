import 'package:a9wiki/models/operatordetail.dart';
import 'package:flutter/material.dart';

import '../../../constaint.dart';
import 'range.dart';

class OperatorInfo extends StatefulWidget {
  final String? faction;
  final String? classIcon;
  final String? subClassIcon;
  final List<String>? classes;
  final int? rarity;
  final List<Range>? range;
  final List<Art>? art;
  const OperatorInfo(this.faction, this.classIcon, this.subClassIcon,
      this.classes, this.rarity, this.range, this.art,
      {super.key});

  @override
  State<OperatorInfo> createState() => _OperatorInfoState();
}

class _OperatorInfoState extends State<OperatorInfo> {
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Image> rare = [];
    final r = widget.rarity;
    var range = widget.range![curr].range;
    for (int i = 0; i < r!; i++) {
      rare.add(Image(
        image: NetworkImage(
            'https://gamepress.gg/sites/arknights/files/2019-10/star.png'),
        width: 15,
        height: 15,
      ));
    }
    return Stack(children: [
      //Operator Image
      Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        height: size.height * 0.6,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 22,
                  color: Colors.grey.withOpacity(0.22))
            ]),
        child: Image.network(widget.art![curr].link!),
      ),

      //Faction icon
      Positioned(
          top: size.height * 0.005,
          left: size.width * 0.05,
          child: SizedBox(
            height: size.height * 0.2,
            width: size.width * 0.2,
            child: Image.network(BASE + widget.faction!),
          )),

      //Rarity
      Positioned(
          top: size.height * 0.04,
          left: size.width * 0.37,
          child: Row(
            children: rare,
          )),

      //Class & Subclass
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
                child: Image.network(BASE + widget.classIcon!),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.only(right: size.height * 0.02),
                width: size.width * 0.15,
                child: Text(
                  widget.classes![0],
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                width: size.width * 0.15,
                margin: EdgeInsets.only(right: size.height * 0.02),
                child: Image.network(BASE + widget.subClassIcon!),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.only(right: size.height * 0.02),
                width: size.width * 0.15,
                child: Text(
                  widget.classes![1],
                  style: TextStyle(fontSize: 12, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),

      //Elite Button
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

      //Range
      Positioned(
        right: size.width * 0.05,
        top: size.height * 0.45,
        child: Ranges(range: range),
      ),
    ]);
  }
}
