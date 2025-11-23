import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/feature/organization/model/organization.dart';
import 'package:optal_mobile/src/feature/organization/data/organization_repository.dart';

class OrganizationListNotifier extends AsyncNotifier<List<Organization>> {
  late final OrganizationRepository _repository;

  // размер страницы
  static const int _limit = 20;

  // текущий offset (кол-во уже загруженных элементов)
  int _offset = 0;

  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool hasMore() => _hasMore;
  bool isLoadingMore() => _isLoadingMore;

  @override
  Future<List<Organization>> build() async {
    _repository = ref.read(organizationRepositoryProvider);
    return _loadFirstPage();
  }

  Future<List<Organization>> _loadFirstPage() async {
    _offset = 0;
    _hasMore = true;

    final res = await _repository.listOrganization(
      const PaginationParams(limit: _limit, offset: 0),
    );

    final items = res.items;
    _offset = items.length;
    _hasMore = items.length == _limit;

    return items;
  }

  /// Полный рефреш (pull-to-refresh, retry).
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return _loadFirstPage();
    });
  }

  /// Лениво догружает следующую пачку организаций.
  Future<void> loadMore() async {
    if (!_hasMore || _isLoadingMore) return;

    _isLoadingMore = true;

    final current = state.value ?? const <Organization>[];
    // оставляем текущие данные
    state = AsyncData(current);

    try {
      final res = await _repository.listOrganization(
        PaginationParams(limit: _limit, offset: _offset),
      );

      final newItems = res.items;

      _offset += newItems.length;
      _hasMore = newItems.length == _limit;

      final updated = [...current, ...newItems];
      state = AsyncData(updated);
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      _isLoadingMore = false;
    }
  }
}

final organizationListProvider =
    AsyncNotifierProvider<OrganizationListNotifier, List<Organization>>(
      OrganizationListNotifier.new,
    );
