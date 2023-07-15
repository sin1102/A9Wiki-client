import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class Trait extends StatelessWidget {
  const Trait({
    super.key,
    required this.size,
    required this.op,
  });

  final Size size;
  final OperatorDetail op;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Trait",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(5),
          width: size.width * 0.98,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              op.trait!,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
