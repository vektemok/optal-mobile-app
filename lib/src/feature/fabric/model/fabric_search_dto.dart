class SearchFabricDto {
  final String? supplierId; // UUID
  final String? material; // substring search
  final String? color; // substring search
  final String? locationCity; // substring search
  final num? priceMin; // number
  final num? priceMax; // number
  final int? limit; // default 10
  final int? offset; // default 0

  SearchFabricDto({
    this.supplierId,
    this.material,
    this.color,
    this.locationCity,
    this.priceMin,
    this.priceMax,
    this.limit,
    this.offset,
  });

  factory SearchFabricDto.fromJson(Map<String, dynamic> json) {
    return SearchFabricDto(
      supplierId: json['supplier_id'],
      material: json['material'],
      color: json['color'],
      locationCity: json['location_city'],
      priceMin: json['price_min'],
      priceMax: json['price_max'],
      limit: json['limit'],
      offset: json['offset'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (supplierId != null) data['supplier_id'] = supplierId;
    if (material != null) data['material'] = material;
    if (color != null) data['color'] = color;
    if (locationCity != null) data['location_city'] = locationCity;
    if (priceMin != null) data['price_min'] = priceMin;
    if (priceMax != null) data['price_max'] = priceMax;
    if (limit != null) data['limit'] = limit;
    if (offset != null) data['offset'] = offset;

    return data;
  }
}
