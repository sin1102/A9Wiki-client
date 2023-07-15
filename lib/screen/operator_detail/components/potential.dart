import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class PotentialTrust extends StatelessWidget {
  const PotentialTrust({
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
            "Potential & Trust",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text(
                          'Potential',
                          style: TextStyle(color: Colors.white),
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
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://gamepress.gg/sites/arknights/files/2019-10/2_1.png'),
                            width: 20,
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: op.potential![0].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  children: [
                                TextSpan(
                                    text: op.potential![0].value,
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5)))
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://gamepress.gg/sites/arknights/files/2019-10/3_1.png'),
                            width: 20,
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: op.potential![1].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  children: [
                                TextSpan(
                                    text: op.potential![1].value,
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5)))
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://gamepress.gg/sites/arknights/files/2019-10/4_0.png'),
                            width: 20,
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: op.potential![2].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  children: [
                                TextSpan(
                                    text: op.potential![2].value,
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5)))
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://gamepress.gg/sites/arknights/files/2019-10/5_0.png'),
                            width: 20,
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: op.potential![3].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  children: [
                                TextSpan(
                                    text: op.potential![3].value,
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5)))
                              ]))
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://gamepress.gg/sites/arknights/files/2019-10/6.png'),
                            width: 20,
                            height: 20,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: op.potential![4].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                  children: [
                                TextSpan(
                                    text: op.potential![4].value,
                                    style: TextStyle(
                                        color: Colors.blue.withOpacity(0.5)))
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: Text('Trust Status',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(width: 1, color: Colors.white)),
                      child: Center(
                        child: RichText(
                            text: TextSpan(
                                text: op.trust!.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                                children: [
                              TextSpan(
                                  text: op.trust!.value,
                                  style: TextStyle(
                                      color: Colors.blue.withOpacity(0.5)))
                            ])),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
