import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/provider/dio_provider.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

abstract interface class IndustryDataSource {
  Future<List<Industry>> listIndustry();
}

final class IndustryDataSourceImpl implements IndustryDataSource {
  IndustryDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Industry>> listIndustry() async {
    final response = await _dio.get('/v1/industries');

    return (response.data as List).map((e) => Industry.fromJson(e)).toList();
  }
}

final industryDataSourceProvider = Provider<IndustryDataSource>((ref) {
  return IndustryDataSourceImpl(dio: ref.watch(dioProvider));
});
