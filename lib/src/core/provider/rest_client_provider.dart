import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: const String.fromEnvironment('BASE_URL')));
});
