import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class Obtain extends StatelessWidget {
  const Obtain({
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
            "Obtain Approach",
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.45,
                child: Column(children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Headhunting: ',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            children: [
                              if (op.headhunting!)
                                TextSpan(
                                    text: 'Yes',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12))
                              else
                                TextSpan(
                                    text: 'No',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12)),
                              if (op.limited!)
                                TextSpan(
                                    text: '(Limited)',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12))
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                      child: Text(
                        'Release Date (CN)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        border: Border.all(width: 1, color: Colors.white)),
                    child: Center(
                        child: Text(
                      op.releaseDates!.cn!,
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ]),
              ),
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: 'Recruitment: ',
                              style: TextStyle(color: Colors.white),
                              children: [
                                if (op.recruitable!)
                                  TextSpan(
                                      text: 'Yes',
                                      style: TextStyle(color: Colors.green))
                                else
                                  TextSpan(
                                      text: 'No',
                                      style: TextStyle(color: Colors.red)),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          'Release Date (Global)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                          child: Text(
                        op.releaseDates!.global!,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
