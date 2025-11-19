import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/provider/industry_provider.dart';
import 'package:optal_mobile/src/feature/industry/widget/industry_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final ScrollController _scrollController;
  late final ValueNotifier<bool> isBig;

  @override
  void initState() {
    super.initState();
    isBig = ValueNotifier(true);
    _scrollController = ScrollController()..addListener(_offsetListener);
  }

  @override
  Widget build(BuildContext context) {
    final industryList = ref.watch(industryListProvider);
    return ListenableBuilder(
      listenable: Listenable.merge([]),
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Color(0xff0A0A0A),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              ValueListenableBuilder(
                valueListenable: isBig,
                builder: (context, value, child) {
                  return SliverAppBar(
                    backgroundColor: Color(0xff0A0A0A),
                    floating: true,
                    pinned: true,
                    snap: true,
                    elevation: 0,
                    titleSpacing: 9,
                    toolbarHeight: kToolbarHeight + 20,
                    surfaceTintColor: Color(0xff0A0A0A),
                    expandedHeight: value ? 250 : 130,
                    title: TextField(
                      decoration: InputDecoration(
                        // constraints: BoxConstraints(
                        //   minHeight: 44,
                        //   maxHeight: 44,
                        // ),
                        // prefixIcon: Icon(Icons.search),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 18,
                          maxWidth: 18,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "Найти товары",
                        hintStyle: TextStyle(
                          color: Color(0xff8E8E93),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          letterSpacing: 0,
                        ),
                        fillColor: Color(0xff262624),
                        filled: true,
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      background: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(height: kToolbarHeight + 12),

                            industryList.map(
                              data: (asyncData) => Expanded(
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: isBig,
                                  builder: (context, value, _) =>
                                      AnimatedCrossFade(
                                        duration: Duration(milliseconds: 1200),
                                        firstChild: SizedBox(
                                          height: 250,
                                          child: IndustryList(
                                            industryList: asyncData.value,
                                          ),
                                        ),
                                        secondChild: SizedBox(
                                          height: 100,
                                          child: ListView.separated(
                                            padding: EdgeInsets.all(10),
                                            itemCount: asyncData.value.length,
                                            separatorBuilder:
                                                (context, index) =>
                                                    SizedBox(width: 10),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff262624),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  asyncData.value[index].name,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        crossFadeState: value
                                            ? CrossFadeState.showFirst
                                            : CrossFadeState.showSecond,
                                        firstCurve: const Cubic(
                                          0.4,
                                          0.0,
                                          0.2,
                                          1.0,
                                        ),
                                        secondCurve: const Cubic(
                                          0.4,
                                          0.0,
                                          0.2,
                                          1.0,
                                        ),
                                      ),
                                ),
                              ),
                              error: (error) => Text('$error'),
                              loading: (_) => Text(''),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: ValueListenableBuilder<bool>(
                  valueListenable: isBig,
                  builder: (context, value, _) =>
                      SizedBox(height: !value ? 120 : null),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 10,
                                  width: MediaQuery.sizeOf(context).width - 30,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xff262624),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text("hello"),
                                  ),
                                ),
                              ),
                              Text("hello"),
                            ],
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 9,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color(0xff262624),
                      margin: EdgeInsets.zero,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _offsetListener() {
    if (_scrollController.offset >= 400) {
      if (isBig.value) {
        isBig.value = false;
      }
    } else {
      isBig.value = true;
    }
  }

  @override
  void dispose() {
    isBig.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
