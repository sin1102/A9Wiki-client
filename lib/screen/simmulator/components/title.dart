import 'package:flutter/material.dart';

import '../../../models/banner_detail.dart';

class Titles extends StatelessWidget {
  const Titles({
    super.key,
    required this.size,
    required this.banner,
  });

  final Size size;
  final BannerDetail banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.05,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.9)),
          child: Center(
              child: Text(
            banner.name!,
            style: TextStyle(color: Colors.white),
          )),
        ),
        Image(image: NetworkImage(banner.thumbnail!)),
        Container(
            margin: EdgeInsets.only(left: size.width * 0.02),
            child: Text(banner.cnDate!)),
        Container(
            margin: EdgeInsets.only(left: size.width * 0.02),
            child: Text(banner.globDate!))
      ],
    );
  }
}
