class Tier {
  String? sId;
  List<String>? classes;
  List<Tiers>? tiers;

  Tier({this.sId, this.classes, this.tiers});

  Tier.fromJson(json) {
    sId = json['_id'];
    classes = json['classes'].cast<String>();
    if (json['tiers'] != null) {
      tiers = <Tiers>[];
      json['tiers'].forEach((v) {
        tiers!.add(new Tiers.fromJson(v));
      });
    }
  }
}

class Tiers {
  String? tier;
  List<Ops>? ops;

  Tiers({this.tier, this.ops});

  Tiers.fromJson(json) {
    tier = json['tier'];
    if (json['ops'] != null) {
      ops = <Ops>[];
      json['ops'].forEach((v) {
        ops!.add(new Ops.fromJson(v));
      });
    }
  }
}

class Ops {
  Op? op;
  List<String>? explain;

  Ops({this.op, this.explain});

  Ops.fromJson(json) {
    op = json['op'] != null ? new Op.fromJson(json['op']) : null;
    explain = json['explain'].cast<String>();
  }
}

class Op {
  String? subClassIcon;
  String? classIcon;
  int? rarity;
  String? icon;
  String? name;
  String? opId;

  Op(
      {this.subClassIcon,
      this.classIcon,
      this.rarity,
      this.icon,
      this.name,
      this.opId});

  Op.fromJson(json) {
    subClassIcon = json['subClassIcon'];
    classIcon = json['classIcon'];
    rarity = json['rarity'];
    icon = json['icon'];
    name = json['name'];
    opId = json['opId'];
  }
}
