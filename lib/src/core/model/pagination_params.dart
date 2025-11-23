class PaginationParams {
  final int limit;
  final int offset;

  const PaginationParams({required this.limit, required this.offset});

  factory PaginationParams.defaultPage() =>
      const PaginationParams(limit: 20, offset: 0);

  Map<String, dynamic> toQuery() => {'limit': limit, 'offset': offset};
}
