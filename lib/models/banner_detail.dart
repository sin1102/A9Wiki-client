class BannerDetail {
  String? thumbnail;
  String? name;
  String? cnDate;
  String? globDate;
  String? rateUpType;
  List<RateUp>? rateUp;
  List<RateUp>? offRate;

  BannerDetail(
      {this.thumbnail,
      this.name,
      this.cnDate,
      this.globDate,
      this.rateUpType,
      this.rateUp,
      this.offRate});

  BannerDetail.fromJson(json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
    cnDate = json['cnDate'];
    globDate = json['globDate'];
    rateUpType = json['rateUpType'];
    if (json['rateUp'] != null) {
      rateUp = <RateUp>[];
      json['rateUp'].forEach((v) {
        rateUp!.add(RateUp.fromJson(v));
      });
    }
    if (json['offRate'] != null) {
      offRate = <RateUp>[];
      json['offRate'].forEach((v) {
        offRate!.add(RateUp.fromJson(v));
      });
    }
  }
}

class RateUp {
  String? sId;
  List<String>? classes;
  String? classIcon;
  int? rarity;
  String? icon;
  String? name;
  String? opId;

  RateUp(
      {this.sId,
      this.classes,
      this.classIcon,
      this.rarity,
      this.icon,
      this.name,
      this.opId});

  RateUp.fromJson(json) {
    classes = json['class'].cast<String>();
    classIcon = json['classIcon'];
    rarity = json['rarity'];
    icon = json['icon'];
    name = json['name'];
    opId = json['opId'];
  }
}
