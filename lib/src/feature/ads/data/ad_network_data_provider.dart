import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/core/provider/dio_provider.dart';
import 'package:optal_mobile/src/feature/ads/model/ad.dart';

/// {@template ad_network_data_provider}
/// AdNetworkDataProvider.
/// {@endtemplate}
abstract interface class AdNetworkDataProvider {
  /// {@macro ad_network_data_provider}

  Future<PaginatedResponse<Ad>> listAds(PaginationParams paginationParams);
}

/// {@template ad_network_data_provider}
/// AdNetworkDataProviderImpl.
/// {@endtemplate}
final class AdNetworkDataProviderImpl implements AdNetworkDataProvider {
  /// {@macro ad_network_data_provider}
  const AdNetworkDataProviderImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;
  @override
  Future<PaginatedResponse<Ad>> listAds(
    PaginationParams paginationParams,
  ) async {
    final response = await _dio.get(
      '/v1/ads',
      queryParameters: paginationParams.toQuery(),
    );

    return PaginatedResponse.fromJson(response.data, Ad.fromJson);
  }
}

final adDataProvider = Provider<AdNetworkDataProvider>((ref) {
  return AdNetworkDataProviderImpl(dio: ref.watch(dioProvider));
});
