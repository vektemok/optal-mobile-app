import 'dart:convert';

List<Industry> industryFromJson(String str) =>
    List<Industry>.from(json.decode(str).map((x) => Industry.fromJson(x)));

String industryToJson(List<Industry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Industry {
  int id;
  String code;
  String name;
  String description;
  String iconUrl;
  int sortOrder;

  Industry({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.sortOrder,
  });

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    iconUrl: json["icon_url"],
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "icon_url": iconUrl,
    "sort_order": sortOrder,
  };
}
