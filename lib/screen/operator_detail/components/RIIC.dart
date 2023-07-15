import 'package:flutter/material.dart';

import '../../../constaint.dart';
import '../../../models/operatordetail.dart';

class RIIC extends StatelessWidget {
  const RIIC({
    super.key,
    required this.size,
    required this.op,
    required this.elitImg,
  });

  final Size size;
  final OperatorDetail op;
  final List<String> elitImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            "RIIC Base Skills",
            style: TextStyle(color: Colors.white),
          )),
        ),
        Container(
          margin: EdgeInsets.all(size.height * 0.01),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
          child: Column(children: [
            for (var i = 0; i < op.baseskill!.length; i++)
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        op.baseskill![i].name!,
                        style: TextStyle(color: Colors.blue, fontSize: 11),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'Lvl: 1',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      if (op.baseskill![i].level! == 'Elite 0')
                        Image(
                          image: NetworkImage(elitImg[0]),
                          width: 25,
                          height: 25,
                        ),
                      if (op.baseskill![i].level! == 'Elite 1')
                        Image(
                          image: NetworkImage(elitImg[1]),
                          width: 25,
                          height: 25,
                        ),
                      if (op.baseskill![i].level! == 'Elite 2')
                        Image(
                          image: NetworkImage(elitImg[2]),
                          width: 25,
                          height: 25,
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      RichText(
                          text: TextSpan(
                              text: 'Room Type: ',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 11),
                              children: [
                            TextSpan(
                                text: op.baseskill![i].building,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11))
                          ])),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Image(
                        image: NetworkImage(BASE + op.baseskill![i].icon!),
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    op.baseskill![i].effects!,
                    style: TextStyle(color: Colors.white),
                  )
                ]),
              )
          ]),
        )
      ],
    );
  }
}
