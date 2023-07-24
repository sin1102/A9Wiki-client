class Classes {
  String? name;
  String? icon;
  List<SubClass>? subClass;

  Classes({this.name, this.icon, this.subClass});

  Classes.fromJson(json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subClass'] != null) {
      subClass = <SubClass>[];
      json['subClass'].forEach((v) {
        subClass!.add(new SubClass.fromJson(v));
      });
    }
  }

}

class SubClass {
  String? name;
  String? icon;

  SubClass({this.name, this.icon});

  SubClass.fromJson(json) {
    name = json['name'];
    icon = json['icon'];
  }
}