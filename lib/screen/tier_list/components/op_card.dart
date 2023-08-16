import 'package:a9wiki/constaint.dart';
import 'package:a9wiki/models/tier.dart';
import 'package:flutter/material.dart';

import '../../operator_detail/operator_detail.dart';

class OpCard extends StatelessWidget {
  const OpCard({super.key, required this.ops, required this.size});
  final Ops ops;
  final Size size;

  @override
  Widget build(BuildContext context) {
    var icon = ops.op!.icon;
    var classIcon = ops.op!.classIcon;
    var r = ops.op!.rarity?.toInt() ?? 0;
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OperatorDetailScreen(ops.op!.opId)));
            },
            child: Container(
              width: size.height * 0.175,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://gamepress.gg/arknights/sites/arknights/files/2020-01/bg%5B1%5D.png'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.color))),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image(
                      image: NetworkImage(BASE + icon!),
                      width: size.height * 0.07,
                      height: size.height * 0.07,
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2)),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(BASE + classIcon!),
                                  width: size.height * 0.02,
                                  height: size.height * 0.02,
                                ),
                                SizedBox(
                                  width: size.width * 0.17,
                                  height: 15,
                                  child: Stack(
                                    children: [
                                      for (var k = 0, n = 0.0;
                                          k < r;
                                          k++, n += 9)
                                        Positioned(
                                            left: n,
                                            child: Image(
                                              image: NetworkImage(
                                                  'https://gamepress.gg/sites/arknights/files/2019-10/star.png'),
                                              width: 15,
                                              height: 15,
                                            ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Center(
                              child: Stack(children: [
                            SizedBox(
                              width: size.width * 0.19,
                              child: Text(
                                ops.op!.name!
                                    .toString()
                                    .replaceAll('&#039;', '\u2019')
                                    .replaceAll('&amp;', '&'),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 1
                                    ..color = Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.19,
                              child: Text(
                                ops.op!.name!
                                    .toString()
                                    .replaceAll('&#039;', '\u2019')
                                    .replaceAll('&amp;', '&'),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]))
                        ],
                      ))
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDataAlert(context);
            },
            child: Container(
              width: size.height * 0.175,
              height: size.height * 0.03,
              decoration: BoxDecoration(color: Colors.grey),
              child: Center(
                child: Text(
                  "Explanation",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDataAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(10),
              title: Center(child: Text("Explanation")),
              content: SizedBox(
                height: size.height * 0.4,
                child: ListView.builder(
                    itemCount: ops.explain!.length,
                    itemBuilder: ((context, index) {
                      var exp = ops.explain![index];
                      if (exp.startsWith('-')) {
                        return Text(
                          exp,
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        );
                      } else if (exp.startsWith('=')) {
                        return Text(
                          exp,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        );
                      } else {
                        return Text(
                          exp,
                          style: TextStyle(fontSize: 12, color: Colors.green),
                        );
                      }
                    })),
              ));
        }));
  }
}
