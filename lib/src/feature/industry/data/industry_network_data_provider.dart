import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/provider/rest_client_provider.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

/// {@template industry_network_data_provider}
/// IndustryNetworkDataProvider.
/// {@endtemplate}
abstract interface class IndustryNetworkDataProvider {
  /// {@macro industry_network_data_provider}

  Future<List<Industry>> listIndustry();
}

/// {@template industry_network_data_provider}
/// IndustryNetworkDataProviderImpl.
/// {@endtemplate}
final class IndustryNetworkDataProviderImpl
    implements IndustryNetworkDataProvider {
  /// {@macro industry_network_data_provider}
  const IndustryNetworkDataProviderImpl(this._restCLient);

  final Dio _restCLient;

  @override
  Future<List<Industry>> listIndustry() async {
    final response = await _restCLient.get('/v1/industries');

    return (response.data as List).map((e) => Industry.fromJson(e)).toList();
  }
}

final industryNetworkDataProvider = Provider<IndustryNetworkDataProvider>((
  ref,
) {
  return IndustryNetworkDataProviderImpl(ref.watch(restClientProvider));
});
