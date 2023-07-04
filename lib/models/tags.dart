class Tags {
  List<String>? tagname;
  String? category;

  Tags({this.tagname, this.category});

  Tags.fromJson(dynamic json) {
    tagname = json['tagname'].cast<String>();
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagname'] = this.tagname;
    data['category'] = this.category;
    return data;
  }
}
