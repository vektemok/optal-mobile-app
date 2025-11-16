class PaginationParamsDto {
  final int limit;
  final int offset;

  PaginationParamsDto({required this.limit, required this.offset});

  factory PaginationParamsDto.fromJson(Map<String, dynamic> json) {
    return PaginationParamsDto(
      limit: json['limit'] ?? 0,
      offset: json['offset'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {'limit': limit, 'offset': offset};
}
