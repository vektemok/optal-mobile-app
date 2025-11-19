import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/data/industry_network_data_provider.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

/// {@template industry_repository}
/// IndustryRepository.
/// {@endtemplate}
abstract interface class IndustryRepository {
  /// {@macro industry_repository}
  Future<List<Industry>> listIndustry();
}

/// {@template industry_repository}
/// IndustryRepositoryImpl.
/// {@endtemplate}
final class IndustryRepositoryImpl implements IndustryRepository {
  /// {@macro industry_repository}
  const IndustryRepositoryImpl(this._industryNetworkDataProvider);

  final IndustryNetworkDataProvider _industryNetworkDataProvider;

  @override
  Future<List<Industry>> listIndustry() async {
    return await _industryNetworkDataProvider.listIndustry();
  }
}

final industryReporovider = Provider<IndustryRepository>((ref) {
  return IndustryRepositoryImpl(ref.watch(industryNetworkDataProvider));
});
