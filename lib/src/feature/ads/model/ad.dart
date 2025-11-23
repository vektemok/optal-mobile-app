import 'dart:convert';

class Ad {
  final int id;
  final String ownerUserId;
  final String industryCode;
  final String categoryCode;
  final String title;
  final String? description;
  final List<String> images;
  final Map<String, dynamic>? details;
  final int minOrderQty;
  final String unitName;
  final double? priceMin;
  final double? priceMax;
  final String currency;

  final String? country;
  final String? city;
  final AdStatus status;

  final DateTime createdAt;
  final DateTime updatedAt;

  Ad({
    required this.id,
    required this.ownerUserId,
    required this.industryCode,
    required this.categoryCode,
    required this.title,
    this.description,
    required this.images,
    this.details,
    required this.minOrderQty,
    required this.unitName,
    this.priceMin,
    this.priceMax,
    required this.currency,
    this.country,
    this.city,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ad.fromJson(Map<String, dynamic> json) {
    return Ad(
      id: json['id'],
      ownerUserId: json['owner_user_id'],
      industryCode: json['industry_code'],
      categoryCode: json['category_code'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images'] ?? []),
      details:
          json['details'] != null && json['details'] is Map<String, dynamic>
          ? json['details']
          : (json['details'] != null ? jsonDecode(json['details']) : null),
      minOrderQty: json['min_order_qty'],
      unitName: json['unit_name'],
      priceMin: (json['price_min'] != null)
          ? json['price_min'].toDouble()
          : null,
      priceMax: (json['price_max'] != null)
          ? json['price_max'].toDouble()
          : null,
      currency: json['currency'],
      country: json['country'],
      city: json['city'],
      status: AdStatus.fromString(json['status']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_user_id": ownerUserId,
    "industry_code": industryCode,
    "category_code": categoryCode,
    "title": title,
    "description": description,
    "images": images,
    "details": details,
    "min_order_qty": minOrderQty,
    "unit_name": unitName,
    "price_min": priceMin,
    "price_max": priceMax,
    "currency": currency,
    "country": country,
    "city": city,
    "status": status.name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum AdStatus {
  active,
  draft,
  hidden;

  String get name {
    switch (this) {
      case AdStatus.active:
        return "ACTIVE";
      case AdStatus.draft:
        return "DRAFT";
      case AdStatus.hidden:
        return "HIDDEN";
    }
  }

  static AdStatus fromString(String status) {
    switch (status) {
      case "ACTIVE":
        return AdStatus.active;
      case "DRAFT":
        return AdStatus.draft;
      case "HIDDEN":
        return AdStatus.hidden;
      default:
        throw Exception("Unknown AdStatus: $status");
    }
  }
}
