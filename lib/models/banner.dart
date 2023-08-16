class Banners {
  String? thumbnail;
  String? name;
  String? cnDate;
  String? globDate;
  String? bannerType;
  String? rateUpType;
  List<String>? rateUp;
  List<String>? offRate;

  Banners(
      {this.thumbnail,
      this.name,
      this.cnDate,
      this.globDate,
      this.bannerType,
      this.rateUpType,
      this.rateUp,
      this.offRate});

  Banners.fromJson(json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
    cnDate = json['cnDate'];
    globDate = json['globDate'];
    bannerType = json['bannerType'];
    rateUpType = json['rateUpType'];
    rateUp = json['rateUp'].cast<String>();
    rateUp = json['offRate'].cast<String>();
  }
}
