import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key, this.title, int? maxVal, int? step})
      : maxVal = maxVal ?? 10, step = step ?? 1;

  final String? title;
  final int maxVal;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: title != null ? Text(title!) : null,
        ),
        InputQty.int(
            decoration: const QtyDecorationProps(
              isBordered: false,
              borderShape: BorderShapeBtn.circle,
              width: 12,
            ),
            maxVal: maxVal,
            initVal: 0,
            minVal: 0,
            steps: step,
            onQtyChanged: (val) {})
      ],
    );
  }
}
