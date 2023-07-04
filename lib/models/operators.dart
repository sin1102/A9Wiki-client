class Operators {
  String? opId;
  String? name;
  int? rarity;
  List<String>? classes;
  List<String>? tags;
  String? icon;
  String? classIcon;

  Operators(
      {this.opId,
      this.name,
      this.rarity,
      this.classes,
      this.tags,
      this.icon,
      this.classIcon});

  Operators.fromJson(dynamic json) {
    opId = json['opId'];
    name = json['name'];
    rarity = json['rarity'];
    classes = json['class'].cast<String>();
    tags = json['tags'].cast<String>();
    icon = json['icon'];
    classIcon = json['classIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['opId'] = this.opId;
    data['name'] = this.name;
    data['rarity'] = this.rarity;
    data['class'] = this.classes;
    data['tags'] = this.tags;
    data['icon'] = this.icon;
    data['classIcon'] = this.classIcon;
    return data;
  }
}
