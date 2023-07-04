import 'package:a9wiki/models/operators.dart';
import 'package:flutter/material.dart';

import '../../constaint.dart';
import '../operator_detail/operator_detail.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(this.op);
  final Operators op;

  @override
  Widget build(BuildContext context) {
    final icon = op.icon;
    final classIcon = op.classIcon;
    var r = op.rarity?.toInt() ?? 0;
    List<Image> rare = [];
    for (int i = 0; i < r; i++) {
      rare.add(Image(
        image: NetworkImage(
            'https://gamepress.gg/sites/arknights/files/2019-10/star.png'),
        width: 15,
        height: 15,
      ));
    }
    return GestureDetector(
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OperatorDetailScreen(op.opId)))
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: op.opId.toString(),
                  child: icon != ''
                      ? Image.network('https://gamepress.gg/$icon')
                      : Image.network('https://gamepress.gg/$classIcon'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: op.name.toString().replaceAll('&#039;', '\u2019'),
                    style: TextStyle(color: kTextLightColor),
                  )),
            ),
            Row(
              children: rare,
            )
          ],
        ),
      ),
    );
  }
}
