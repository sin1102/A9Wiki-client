import 'package:flutter/material.dart';

class Ranges extends StatelessWidget {
  const Ranges({
    super.key,
    required this.range,
  });

  final List<List>? range;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: Column(children: [
        Text(
          'Range',
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Column(children: [
            for (var i = 0; i < range![0].length; i++)
              Row(
                children: [
                  for (var j = 0; j < range!.length; j++)
                    if (range![j][i] == 'unit')
                      Container(
                        margin: EdgeInsets.all(1),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1)),
                      )
                    else if (range![j][i] == 'attackable')
                      Container(
                        margin: EdgeInsets.all(1),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.white),
                            borderRadius: BorderRadius.circular(1)),
                      )
                    else
                      Container(
                        margin: EdgeInsets.all(1),
                        width: 10,
                        height: 10,
                      )
                ],
              ),
          ]),
        ),
      ]),
    );
  }
}
