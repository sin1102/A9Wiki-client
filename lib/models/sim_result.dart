class SimulatorResult {
  int? pullCount;
  int? countPity;
  int? sixSrarRate;
  String? have5Star;
  String? have6Star;
  List<Ops>? ops;

  SimulatorResult(
      {this.pullCount,
      this.countPity,
      this.sixSrarRate,
      this.have5Star,
      this.have6Star,
      this.ops});

  SimulatorResult.fromJson(json) {
    pullCount = json['pullCount'];
    countPity = json['countPity'];
    sixSrarRate = int.parse(json['sixStarRate'].toString());
    have5Star = json['have5Star'].toString();
    have6Star = json['have6Star'].toString();
    if (json['ops'] != null) {
      ops = <Ops>[];
      json['ops'].forEach((v) {
        ops!.add(new Ops.fromJson(v));
      });
    }
  }
}

class Ops {
  String? sId;
  ReleaseDates? releaseDates;
  List<String>? classes;
  String? classIcon;
  int? rarity;
  String? icon;
  String? name;
  String? opId;

  Ops(
      {this.sId,
      this.releaseDates,
      this.classes,
      this.classIcon,
      this.rarity,
      this.icon,
      this.name,
      this.opId});

  Ops.fromJson(json) {
    sId = json['_id'];
    releaseDates = json['release_dates'] != null
        ? new ReleaseDates.fromJson(json['release_dates'])
        : null;
    classes = json['class'].cast<String>();
    classIcon = json['classIcon'];
    rarity = json['rarity'];
    icon = json['icon'];
    name = json['name'];
    opId = json['opId'];
  }
}

class ReleaseDates {
  String? cn;
  String? global;

  ReleaseDates({this.cn, this.global});

  ReleaseDates.fromJson(json) {
    cn = json['cn'];
    global = json['global'];
  }
}
