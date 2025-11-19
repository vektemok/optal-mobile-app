/// {@template industry_exception}
/// IndustryException.
/// {@endtemplate}
final class IndustryException implements Exception {
  /// {@macro industry_exception}
  const IndustryException(this.message);

  final String message;

  factory IndustryException.fromCode(int stastusCode) {
    return switch (stastusCode) {
      == 404 => IndustryException('Industry not found'),
      _ => IndustryException('default'),
    };
  }
}
