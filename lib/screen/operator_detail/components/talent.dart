import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';

class Talent extends StatelessWidget {
  const Talent({
    super.key,
    required this.size,
    required this.talent,
    required this.elit,
    required this.poten,
  });

  final Size size;
  final List<Talents>? talent;
  final List<String> elit;
  final List<String> poten;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "Talents",
            style: TextStyle(color: Colors.white),
          )),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Column(
            children: [
              for (var i = 0; i < talent!.length; i++)
                Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                talent![i].talentName!,
                                style: TextStyle(color: Colors.blue),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              if (talent![i].elite! == "E1")
                                Image(
                                  image: NetworkImage(elit[1]),
                                  width: 25,
                                  height: 25,
                                ),
                              if (talent![i].elite! == "E2")
                                Image(
                                  image: NetworkImage(elit[1]),
                                  width: 25,
                                  height: 25,
                                ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              if (talent![i].potential! == "1")
                                Image(
                                  image: NetworkImage(poten[0]),
                                  width: 25,
                                  height: 25,
                                ),
                              if (talent![i].potential! == "3")
                                Image(
                                  image: NetworkImage(poten[2]),
                                  width: 25,
                                  height: 25,
                                ),
                              if (talent![i].potential! == "5")
                                Image(
                                  image: NetworkImage(poten[4]),
                                  width: 25,
                                  height: 25,
                                )
                            ],
                          ),
                          Text(
                            talent![i].description!,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}
