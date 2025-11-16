import 'dart:convert';

Fabric fabricFromJson(String str) => Fabric.fromJson(json.decode(str));

String fabricToJson(Fabric data) => json.encode(data.toJson());

class Fabric {
  int availableMeters;
  String color;
  String composition;
  String country;
  String createdAt;
  String deliveryOptions;
  int densityGM2;
  String description;
  String id;
  List<String> images;
  bool isActive;
  String locationCity;
  String material;
  int minOrderMeters;
  String pattern;
  int pricePerMeter;
  bool readyToShip;
  String shortDescription;
  String stretchType;
  String supplierId;
  String surfaceType;
  String texture;
  String title;
  String unit;
  String updatedAt;
  String usage;
  String weightCategory;
  int widthCm;

  Fabric({
    required this.availableMeters,
    required this.color,
    required this.composition,
    required this.country,
    required this.createdAt,
    required this.deliveryOptions,
    required this.densityGM2,
    required this.description,
    required this.id,
    required this.images,
    required this.isActive,
    required this.locationCity,
    required this.material,
    required this.minOrderMeters,
    required this.pattern,
    required this.pricePerMeter,
    required this.readyToShip,
    required this.shortDescription,
    required this.stretchType,
    required this.supplierId,
    required this.surfaceType,
    required this.texture,
    required this.title,
    required this.unit,
    required this.updatedAt,
    required this.usage,
    required this.weightCategory,
    required this.widthCm,
  });

  factory Fabric.fromJson(Map<String, dynamic> json) => Fabric(
    availableMeters: json["available_meters"],
    color: json["color"],
    composition: json["composition"],
    country: json["country"],
    createdAt: json["created_at"],
    deliveryOptions: json["delivery_options"],
    densityGM2: json["density_g_m2"],
    description: json["description"],
    id: json["id"],
    images: List<String>.from(json["images"].map((x) => x)),
    isActive: json["is_active"],
    locationCity: json["location_city"],
    material: json["material"],
    minOrderMeters: json["min_order_meters"],
    pattern: json["pattern"],
    pricePerMeter: json["price_per_meter"],
    readyToShip: json["ready_to_ship"],
    shortDescription: json["short_description"],
    stretchType: json["stretch_type"],
    supplierId: json["supplier_id"],
    surfaceType: json["surface_type"],
    texture: json["texture"],
    title: json["title"],
    unit: json["unit"],
    updatedAt: json["updated_at"],
    usage: json["usage"],
    weightCategory: json["weight_category"],
    widthCm: json["width_cm"],
  );

  Map<String, dynamic> toJson() => {
    "available_meters": availableMeters,
    "color": color,
    "composition": composition,
    "country": country,
    "created_at": createdAt,
    "delivery_options": deliveryOptions,
    "density_g_m2": densityGM2,
    "description": description,
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x)),
    "is_active": isActive,
    "location_city": locationCity,
    "material": material,
    "min_order_meters": minOrderMeters,
    "pattern": pattern,
    "price_per_meter": pricePerMeter,
    "ready_to_ship": readyToShip,
    "short_description": shortDescription,
    "stretch_type": stretchType,
    "supplier_id": supplierId,
    "surface_type": surfaceType,
    "texture": texture,
    "title": title,
    "unit": unit,
    "updated_at": updatedAt,
    "usage": usage,
    "weight_category": weightCategory,
    "width_cm": widthCm,
  };
}
