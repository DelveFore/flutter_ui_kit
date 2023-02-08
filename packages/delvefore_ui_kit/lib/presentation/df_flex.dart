import 'package:flutter/material.dart';

import './df_space.dart';

class DfFlex extends StatelessWidget {
  const DfFlex({
    Key? key,
    required this.children,
    required this.direction,
    this.spacingFactor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);
  final List<Widget> children;
  final Axis direction;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? spacingFactor;
  final VerticalDirection verticalDirection;

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _children = [];
    if (spacingFactor != null) {
      for (int i = 0; i < children.length; i++) {
        _children.add(children[i]);
        if (i != children.length - 1) {
          _children.add(
            DfSpace(
              spacingFactor!,
              direction: direction,
            ),
          );
        }
      }
    } else {
      _children.addAll(children);
    }
    return Flex(
      key: key,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      clipBehavior: Clip.hardEdge,
      children: _children,
    );
  }
}

class DfColumn extends StatelessWidget {
  const DfColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.spacingFactor,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double? spacingFactor;

  @override
  Widget build(BuildContext context) {
    return DfFlex(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      direction: Axis.vertical,
      spacingFactor: spacingFactor,
      children: children,
    );
  }
}
