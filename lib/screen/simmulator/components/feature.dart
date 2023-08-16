import 'package:a9wiki/constaint.dart';
import 'package:a9wiki/models/banner_detail.dart';
import 'package:flutter/material.dart';

class Feature extends StatelessWidget {
  const Feature({super.key, required this.banner, required this.size});
  final BannerDetail banner;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            'Feature Operators',
            style: TextStyle(color: Colors.white),
          )),
        ),
        Column(
          children: [
            for (var i = 0; i < banner.rateUp!.length; i++)
              Container(
                margin: EdgeInsets.all(size.height * 0.01),
                padding: EdgeInsets.all(size.height * 0.005),
                child: Row(children: [
                  Image(
                    image: NetworkImage(BASE + banner.rateUp![i].icon!),
                    width: size.height * 0.1,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(banner.rateUp![i].name!),
                      SizedBox(
                        width: size.width * 0.17,
                        height: 15,
                        child: Stack(
                          children: [
                            for (var k = 0, n = 0.0;
                                k < banner.rateUp![i].rarity!;
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
                  )
                ]),
              ),
            if (banner.offRate!.isNotEmpty)
              for (var i = 0; i < banner.offRate!.length; i++)
                Container(
                  margin: EdgeInsets.all(size.height * 0.01),
                  padding: EdgeInsets.all(size.height * 0.005),
                  child: Row(children: [
                    Image(
                      image: NetworkImage(BASE + banner.offRate![i].icon!),
                      width: size.height * 0.1,
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(banner.offRate![i].name!),
                        SizedBox(
                          width: size.width * 0.17,
                          height: 15,
                          child: Stack(
                            children: [
                              for (var k = 0, n = 0.0;
                                  k < banner.offRate![i].rarity!;
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
                    )
                  ]),
                ),
          ],
        )
      ],
    );
  }
}
