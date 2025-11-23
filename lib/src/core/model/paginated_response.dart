class PaginatedResponse<T> {
  final String? error;
  final List<T> items;
  final int limit;
  final int offset;
  final String status;

  PaginatedResponse({
    this.error,
    required this.items,
    required this.limit,
    required this.offset,
    required this.status,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    final itemsJson = (json['items'] as List<dynamic>? ?? []);
    return PaginatedResponse<T>(
      error: json['error'],
      items: itemsJson
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
      limit: json['limit'] ?? 0,
      offset: json['offset'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) {
    return {
      'error': error,
      'items': items.map(toJsonT).toList(),
      'limit': limit,
      'offset': offset,
      'status': status,
    };
  }
}
