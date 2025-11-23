import 'dart:async';

import 'package:optal_mobile/src/feature/ads/model/ad.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/model/pagination_params.dart';
import 'package:optal_mobile/src/feature/ads/data/ad_repository.dart';



class AdsState {
  final List<Ad> items;
  final bool isLoadingMore;
  final bool hasMore;
  final String? error;
  final int nextOffset;
  final int limit;

  const AdsState({
    required this.items,
    required this.isLoadingMore,
    required this.hasMore,
    required this.nextOffset,
    required this.limit,
    this.error,
  });

  factory AdsState.initial({int limit = 20}) => AdsState(
    items: const [],
    isLoadingMore: false,
    hasMore: true,
    nextOffset: 0,
    limit: limit,
    error: null,
  );

  AdsState copyWith({
    List<Ad>? items,
    bool? isLoadingMore,
    bool? hasMore,
    String? error,
    int? nextOffset,
    int? limit,
  }) {
    return AdsState(
      items: items ?? this.items,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      nextOffset: nextOffset ?? this.nextOffset,
      limit: limit ?? this.limit,
      error: error,
    );
  }
}

class AdsNotifier extends AsyncNotifier<AdsState> {
  AdRepository get _repository => ref.read(adRepositoryProvider);

  @override
  Future<AdsState> build() async {
    // первый прогруз здесь
    const limit = 20;
    final response = await _repository.listAds(
      const PaginationParams(limit: limit, offset: 0),
    );

    return AdsState(
      items: response.items,
      isLoadingMore: false,
      hasMore: response.items.length == limit,
      nextOffset: response.items.length,
      limit: limit,
      error: null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const limit = 20;
      final response = await _repository.listAds(
        const PaginationParams(limit: limit, offset: 0),
      );

      return AdsState(
        items: response.items,
        isLoadingMore: false,
        hasMore: response.items.length == limit,
        nextOffset: response.items.length,
        limit: limit,
        error: null,
      );
    });
  }

  Future<void> loadNextPage() async {
    final current = state.value;
    if (current == null) return;
    if (current.isLoadingMore || !current.hasMore) return;

    // ставим флаг загрузки «ещё»
    state = AsyncValue.data(current.copyWith(isLoadingMore: true, error: null));

    try {
      final response = await _repository.listAds(
        PaginationParams(limit: current.limit, offset: current.nextOffset),
      );

      final newItems = [...current.items, ...response.items];

      state = AsyncValue.data(
        current.copyWith(
          items: newItems,
          nextOffset: newItems.length,
          hasMore: response.items.length == current.limit,
          isLoadingMore: false,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final adsNotifierProvider = AsyncNotifierProvider<AdsNotifier, AdsState>(
  AdsNotifier.new,
);
