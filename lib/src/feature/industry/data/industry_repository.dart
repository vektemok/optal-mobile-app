import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/data/industry_data_sources.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

abstract interface class IndustryRepository {
  Future<List<Industry>> listIndustry();
}

final class IndustryRepositoryImpl implements IndustryRepository {
  IndustryRepositoryImpl(this._dataSource);

  final IndustryDataSource _dataSource;

  @override
  Future<List<Industry>> listIndustry() async =>
      await _dataSource.listIndustry();
}

final industryRepositoryProvider = Provider<IndustryRepository>((ref) {
  return IndustryRepositoryImpl(ref.watch(industryDataSourceProvider));
});
