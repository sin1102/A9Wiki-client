import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class Tags extends StatelessWidget {
  const Tags({
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
            "Tags",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < op.tags!.length - 2; i++)
                Container(
                  height: size.height * 0.04,
                  width: size.width * 0.3,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      op.tags![i],
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
