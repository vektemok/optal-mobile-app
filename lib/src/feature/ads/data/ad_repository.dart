import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/paginated_response.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/feature/ads/data/ad_network_data_provider.dart';
import 'package:optal_mobile/src/feature/ads/model/ad.dart';

/// {@template ad_repository}
/// Ad repository interface.
/// {@endtemplate}
abstract interface class AdRepository {
  Future<PaginatedResponse<Ad>> listAds(PaginationParams params);
}

/// {@template ad_repository_impl}
/// Repository implementation that works with AdNetworkDataProvider.
/// {@endtemplate}
final class AdRepositoryImpl implements AdRepository {
  const AdRepositoryImpl({required AdNetworkDataProvider adNetworkDataProvider})
    : _adNetworkDataProvider = adNetworkDataProvider;

  final AdNetworkDataProvider _adNetworkDataProvider;

  @override
  Future<PaginatedResponse<Ad>> listAds(PaginationParams params) {
    return _adNetworkDataProvider.listAds(params);
  }
}

final adRepositoryProvider = Provider<AdRepository>((ref) {
  return AdRepositoryImpl(adNetworkDataProvider: ref.watch(adDataProvider));
});
