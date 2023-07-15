import 'package:a9wiki/screen/operator_detail/components/cost.dart';
import 'package:flutter/material.dart';

import '../../../models/operatordetail.dart';
import 'RIIC.dart';
import 'alter.dart';
import 'atk_position.dart';
import 'description.dart';
import 'module.dart';
import 'obtain.dart';
import 'operator_info.dart';
import 'potential.dart';
import 'quote.dart';
import 'skills.dart';
import 'stat.dart';
import 'tags.dart';
import 'talent.dart';
import 'trait.dart';
import 'voice.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.op,
    required this.size,
    required this.elitImg,
    required this.poten,
    required this.masteryIcon,
  });

  final OperatorDetail op;
  final Size size;
  final List<String> elitImg;
  final List<String> poten;
  final List<String> masteryIcon;
  @override
  Widget build(BuildContext context) {
    var talent = op.talents;
    Statistics? stat = op.statistics;
    var skill = op.skills;
    var module = op.module;
    return ListView(children: [
      OperatorInfo(op.faction, op.classIcon, op.subClassIcon, op.classes,
          op.rarity, op.range, op.art),

      //Position and Attack type
      AtkPosition(size: size, op: op),
      SizedBox(
        height: size.height * 0.01,
      ),
      // Alter form
      if (op.alter != "operator do not have alter")
        Alter(size: size, alterName: op.alter),

      // Tags
      Tags(size: size, op: op),

      // Trait
      Trait(size: size, op: op),

      // Description
      Description(size: size, op: op),

      // Quote
      Quote(size: size, op: op),

      // Obtain
      Obtain(size: size, op: op),

      // Potential & trust
      PotentialTrust(size: size, op: op),

      // Talents
      Talent(size: size, talent: talent, elit: elitImg, poten: poten),

      // Stats
      Stats(size: size, base: stat),
      SizedBox(
        height: size.height * 0.01,
      ),

      // Skill
      Skill(size: size, skill: skill, masteryIcon: masteryIcon),

      // Modules
      if (module![0].name != null)
        Modules(size: size, module: module, elite: elitImg, poten: poten),

      // RIIC Base Skill
      RIIC(size: size, op: op, elitImg: elitImg),

      // Cost
      Costs(size: size, op: op, elitImg: elitImg, masteryIcon: masteryIcon),

      // Voice Lines
      Voice(size: size, op: op)
    ]);
  }
}
