import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/provider/industry_provider.dart';
import 'package:optal_mobile/src/feature/industry/widget/industry_list.dart';
import 'package:optal_mobile/src/feature/ads/provider/ads_provider.dart'; // где лежит adsNotifierProvider
import 'package:optal_mobile/src/feature/ads/model/ad.dart';
import 'package:optal_mobile/src/feature/organization/widget/organization_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final ScrollController _scrollController;
  late final ValueNotifier<bool> isBig;

  @override
  void initState() {
    super.initState();
    isBig = ValueNotifier(true);
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    isBig.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;

    // Логика изменения размера хедера
    if (offset >= 400) {
      if (isBig.value) {
        isBig.value = false;
      }
    } else {
      if (!isBig.value) {
        isBig.value = true;
      }
    }

    // Логика пагинации по скроллу
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    const threshold = 300.0; // за 300px до конца начинаем грузить

    if (position.pixels >= position.maxScrollExtent - threshold) {
      ref.read(adsNotifierProvider.notifier).loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final industryList = ref.watch(industryListProvider);
    final adsAsync = ref.watch(adsNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xff0A0A0A),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // ----------------- APP BAR -----------------
          ValueListenableBuilder<bool>(
            valueListenable: isBig,
            builder: (context, value, child) {
              return SliverAppBar(
                backgroundColor: const Color(0xff0A0A0A),
                floating: true,
                pinned: true,
                snap: true,
                elevation: 0,
                titleSpacing: 9,
                toolbarHeight: kToolbarHeight + 20,
                surfaceTintColor: const Color(0xff0A0A0A),
                expandedHeight: value ? 250 : 130,
                title: TextField(
                  decoration: InputDecoration(
                    prefixIconConstraints: const BoxConstraints(
                      maxHeight: 18,
                      maxWidth: 18,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Найти товары",
                    hintStyle: const TextStyle(
                      color: Color(0xff8E8E93),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0,
                    ),
                    fillColor: const Color(0xff262624),
                    filled: true,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  background: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: kToolbarHeight + 12),
                        industryList.map(
                          data: (asyncData) => Expanded(
                            child: ValueListenableBuilder<bool>(
                              valueListenable: isBig,
                              builder: (context, big, _) => AnimatedCrossFade(
                                duration: const Duration(milliseconds: 1000),
                                firstChild: SizedBox(
                                  height: 250,
                                  child: IndustryList(
                                    industryList: asyncData.value,
                                  ),
                                ),
                                secondChild: SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(10),
                                    itemCount: asyncData.value.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 10),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: const Color(0xff262624),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 6,
                                          ),
                                          child: Text(
                                            asyncData.value[index].name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                crossFadeState: big
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                firstCurve: const Cubic(0.4, 0.0, 0.2, 1.0),
                                secondCurve: const Cubic(0.4, 0.0, 0.2, 1.0),
                              ),
                            ),
                          ),
                          error: (error) => Text('$error'),
                          loading: (_) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Отступ под сжатый header, чтобы контент не прилипал
          SliverToBoxAdapter(
            child: ValueListenableBuilder<bool>(
              valueListenable: isBig,
              builder: (context, value, _) =>
                  SizedBox(height: !value ? 120 : 0),
            ),
          ),

          // ----------------- HORIZONTAL LIST (баннеры/подборки) -----------------
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                width: MediaQuery.sizeOf(context).width,
                child: OrganizationListView(),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 10)),

          // ----------------- ADS GRID С ПАГИНАЦИЕЙ -----------------
          adsAsync.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, _) => SliverFillRemaining(
              child: Center(
                child: Text(
                  'Ошибка загрузки объявлений: $err',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            data: (adsState) {
              if (adsState.items.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'Объявлений пока нет',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }

              final itemCount =
                  adsState.items.length +
                  (adsState.isLoadingMore ? 1 : 0); // доп. ячейка под лоадер

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 9,
                  ),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    // нижний лоадер
                    if (index >= adsState.items.length) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    final Ad ad = adsState.items[index];

                    return Card(
                      color: const Color(0xff262624),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(ad.images.first),
                            ),
                            Text(
                              ad.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (ad.priceMin != null && ad.priceMax != null) ...[
                              Text(
                                '${ad.priceMin} - ${ad.priceMax} ${ad.currency}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                            if (ad.city != null && ad.country != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                '${ad.city}, ${ad.country}',
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
