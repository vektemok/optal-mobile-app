import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/feature/industry/provider/industry_provider.dart';

class IndustryList extends ConsumerWidget {
  const IndustryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final industryList = ref.watch(industryProvider);
    return industryList.when(
      data: (industryList) {
        return SizedBox(
          height: 200,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: RowPatternWidthGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 12,
              rowPatterns: [
                [100, 100, 160],
                [160, 100, 100],
              ],
            ),
            itemCount: industryList.length,

            itemBuilder: (context, index) {
              final industryItem = industryList[index];
              return Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Color(0xff262624),
                child: Column(
                  children: [
                    Text(
                      '${industryItem.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Text("$error");
      },
      loading: () =>
          SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
    );
  }

  List<List<double>> generateRowPatternsFixed({
    required int itemCount,
    required List<List<double>> basePatterns,
  }) {
    return basePatterns.map((pattern) {
      final row = <double>[];

      // Повторяем паттерн до нужной длины
      for (int i = 0; i < itemCount; i++) {
        row.add(pattern[i % pattern.length]);
      }

      return row;
    }).toList();
  }
}

/// Delegate для горизонтальной сетки,
/// где ширина задаётся отдельно для каждой строки.
///
/// rowPatterns:
/// [
///   [80, 80, 120],  // верхний ряд
///   [120, 80, 80],  // нижний ряд
/// ]
class RowPatternWidthGridDelegate extends SliverGridDelegate {
  RowPatternWidthGridDelegate({
    required this.rowPatterns,
    required this.crossAxisCount,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
  }) : assert(rowPatterns.length == crossAxisCount) {
    assert(rowPatterns.isNotEmpty);
    final firstLen = rowPatterns.first.length;
    for (final row in rowPatterns) {
      assert(
        row.length == firstLen,
        'Все строки в rowPatterns должны иметь одинаковую длину',
      );
    }
  }

  /// Сколько рядов по cross-axis.
  final int crossAxisCount;

  /// Ширины по строкам (main-axis).
  final List<List<double>> rowPatterns;

  final double mainAxisSpacing;
  final double crossAxisSpacing;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final totalCrossAxisExtent = constraints.crossAxisExtent;
    final crossAxisExtent =
        (totalCrossAxisExtent - crossAxisSpacing * (crossAxisCount - 1)) /
        crossAxisCount;

    return _RowPatternWidthGridLayout(
      crossAxisCount: crossAxisCount,
      crossAxisExtent: crossAxisExtent,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      rowPatterns: rowPatterns,
    );
  }

  @override
  bool shouldRelayout(covariant RowPatternWidthGridDelegate oldDelegate) {
    if (crossAxisCount != oldDelegate.crossAxisCount ||
        mainAxisSpacing != oldDelegate.mainAxisSpacing ||
        crossAxisSpacing != oldDelegate.crossAxisSpacing ||
        rowPatterns.length != oldDelegate.rowPatterns.length) {
      return true;
    }

    for (int i = 0; i < rowPatterns.length; i++) {
      final a = rowPatterns[i];
      final b = oldDelegate.rowPatterns[i];
      if (a.length != b.length) return true;
      for (int j = 0; j < a.length; j++) {
        if (a[j] != b[j]) return true;
      }
    }

    return false;
  }
}

class _RowPatternWidthGridLayout extends SliverGridLayout {
  const _RowPatternWidthGridLayout({
    required this.crossAxisCount,
    required this.crossAxisExtent,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.rowPatterns,
  });

  final int crossAxisCount;
  final double crossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final List<List<double>> rowPatterns;

  int get _columnsPerRow => rowPatterns.first.length;

  double _rowItemExtent(int row, int col) {
    return rowPatterns[row][col];
  }

  double _rowOffset(int row, int col) {
    double offset = 0;
    for (int c = 0; c < col; c++) {
      offset += _rowItemExtent(row, c) + mainAxisSpacing;
    }
    return offset;
  }

  double get _maxRowWidth {
    double maxWidth = 0;
    for (int row = 0; row < crossAxisCount; row++) {
      double width = 0;
      for (int col = 0; col < _columnsPerRow; col++) {
        width += _rowItemExtent(row, col);
        if (col < _columnsPerRow - 1) {
          width += mainAxisSpacing;
        }
      }
      if (width > maxWidth) maxWidth = width;
    }
    return maxWidth;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    // Раскладываем по строкам row-major:
    // 0,1,2 -> верхний ряд
    // 3,4,5 -> нижний ряд
    final row = index ~/ _columnsPerRow;
    final col = index % _columnsPerRow;

    final mainAxisOffset = _rowOffset(row, col);
    final crossAxisOffset = row * (crossAxisExtent + crossAxisSpacing);
    final mainAxisExtent = _rowItemExtent(row, col);

    return SliverGridGeometry(
      scrollOffset: mainAxisOffset,
      crossAxisOffset: crossAxisOffset,
      mainAxisExtent: mainAxisExtent,
      crossAxisExtent: crossAxisExtent,
    );
  }

  // Для небольших сеток можно не заморачиваться и просто
  // говорить, что потенциально видим весь диапазон.
  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) => 0;

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) =>
      crossAxisCount * _columnsPerRow - 1;

  @override
  double computeMaxScrollOffset(int childCount) {
    // Максимальная ширина среди всех строк.
    return _maxRowWidth;
  }
}
