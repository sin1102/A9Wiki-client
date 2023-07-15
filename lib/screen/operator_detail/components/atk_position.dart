import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class AtkPosition extends StatelessWidget {
  const AtkPosition({
    super.key,
    required this.size,
    required this.op,
  });

  final Size size;
  final OperatorDetail op;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.13,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(children: [
        Column(children: [
          Container(
            width: size.width * 0.5,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                border: Border.all(width: 1, color: Colors.white)),
            child: Center(
              child: Text(
                "Position",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.08,
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(width: 1, color: Colors.white))),
            child: Center(
              child: Text(
                op.tags![op.tags!.length - 2],
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
        Column(children: [
          Container(
            width: size.width * 0.5,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                border: Border.all(width: 1, color: Colors.white)),
            child: Center(
              child: Text(
                "Attack type",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: size.width * 0.5,
            height: size.height * 0.08,
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(width: 1, color: Colors.white))),
            child: Center(
              child: Text(
                op.attackType!,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
