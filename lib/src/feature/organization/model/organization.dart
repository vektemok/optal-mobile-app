// To parse this JSON data, do
//
//     final organization = organizationFromJson(jsonString);

import 'dart:convert';

Organization organizationFromJson(String str) =>
    Organization.fromJson(json.decode(str));

String organizationToJson(Organization data) => json.encode(data.toJson());

class Organization {
  final String id;
  final String ownerUserId;
  final String name;
  final String type;
  final String email;
  final String phone;
  final String website;
  final String countryCode;
  final String city;
  final String addressLine;
  final String taxId;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String banner;

  Organization({
    required this.id,
    required this.ownerUserId,
    required this.name,
    required this.type,
    required this.email,
    required this.phone,
    required this.website,
    required this.countryCode,
    required this.city,
    required this.addressLine,
    required this.taxId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.banner,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    id: json["id"],
    ownerUserId: json["owner_user_id"],
    name: json["name"],
    type: json["type"],
    email: json["email"],
    phone: json["phone"],
    website: json["website"],
    countryCode: json["country_code"],
    city: json["city"],
    addressLine: json["address_line"],
    taxId: json["tax_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    banner: json['banner']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_user_id": ownerUserId,
    "name": name,
    "type": type,
    "email": email,
    "phone": phone,
    "website": website,
    "country_code": countryCode,
    "city": city,
    "address_line": addressLine,
    "tax_id": taxId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
