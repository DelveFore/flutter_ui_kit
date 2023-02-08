import 'package:flutter/material.dart';

class DfSpace extends StatelessWidget {
  const DfSpace(
    this.factor, {
    super.key,
    this.direction = Axis.vertical,
  });
  final double factor;
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return SizedBox(
        key: key,
        width: Theme.of(context).textTheme.bodyMedium!.fontSize! * factor,
      );
    }
    return SizedBox(
      key: key,
      height: Theme.of(context).textTheme.bodyMedium!.fontSize! * factor,
    );
  }
}
