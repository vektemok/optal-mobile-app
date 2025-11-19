import 'package:flutter/rendering.dart';

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
