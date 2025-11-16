final class FabricException implements Exception {
  FabricException({required this.message});

  final String message;

  factory FabricException.fromCode(int? statusCode) {
    return switch (statusCode) {
      == null => FabricException(message: ""),
      == 404 => FabricException(message: 'Not found'),
      _ => FabricException(message: "default"),
    };
  }
}
