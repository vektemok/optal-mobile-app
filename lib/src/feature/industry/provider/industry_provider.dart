import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/data/industry_repository.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

final industryProvider = FutureProvider.autoDispose<List<Industry>>((
  ref,
) async {
  return await ref.watch(industryRepositoryProvider).listIndustry();
});
