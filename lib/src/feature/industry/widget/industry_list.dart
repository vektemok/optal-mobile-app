import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optal_mobile/src/core/widget/sliver_grid_delegate/sliver_grid_delegate.dart';
import 'package:optal_mobile/src/feature/industry/model/industry.dart';

class IndustryList extends ConsumerStatefulWidget {
  const IndustryList({required this.industryList, super.key});

  final List<Industry> industryList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IndustryListState();
}

class _IndustryListState extends ConsumerState<IndustryList> {
  int value = 100;

  void change() {
    setState(() {
      value = 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      gridDelegate: RowPatternWidthGridDelegate(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        rowPatterns: [
          [
            100, 100, 180, 100,

            //180
          ],
          [
            180, 100, 100, 100,

            //   180
          ],
        ],
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        final industry = widget.industryList[index];
        if (index == 9) {
          return Card(
            color: Color(0xff262624),
            margin: EdgeInsets.zero,
            child: Text(
              'Показать все\nкатегории',
              style: TextStyle(color: Colors.white),
            ),
          );
        }
        return Card(
          color: Color(0xff262624),
          margin: EdgeInsets.zero,
          child: Text(industry.name, style: TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
