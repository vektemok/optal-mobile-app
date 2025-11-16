// To parse this JSON data, do
//
//     final industry = industryFromJson(jsonString);

import 'dart:convert';

Industry industryFromJson(String str) => Industry.fromJson(json.decode(str));

String industryToJson(Industry data) => json.encode(data.toJson());

class Industry {
  String code;
  String description;
  String iconUrl;
  int id;
  String name;
  int sortOrder;

  Industry({
    required this.code,
    required this.description,
    required this.iconUrl,
    required this.id,
    required this.name,
    required this.sortOrder,
  });

  factory Industry.fromJson(Map<String, dynamic> json) => Industry(
    code: json["code"],
    description: json["description"],
    iconUrl: json["icon_url"],
    id: json["id"],
    name: json["name"],
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
    "icon_url": iconUrl,
    "id": id,
    "name": name,
    "sort_order": sortOrder,
  };
}
