class PaginatedResponse<T> {
  final List<T> items;
  final int totalCount;
  final int limit;
  final int offset;

  PaginatedResponse({
    required this.items,
    required this.totalCount,
    required this.limit,
    required this.offset,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse(
      items: (json["items"] as List)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      totalCount: json["total_count"] ?? 0,
      limit: json["limit"] ?? 0,
      offset: json["offset"] ?? 0,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      "items": items.map(toJsonT).toList(),
      "total_count": totalCount,
      "limit": limit,
      "offset": offset,
    };
  }
}
