import 'package:flutter/material.dart';

import './df_space.dart';

enum DfSnackBarMode { error, success, warn }

class DfSnackBarContent extends StatelessWidget {
  const DfSnackBarContent({
    Key? key,
    required this.title,
    this.mode = DfSnackBarMode.error,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);
  final String title;
  final DfSnackBarMode mode;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    Icon icon = const Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 20,
    );
    if (mode == DfSnackBarMode.warn) {
      icon = const Icon(
        Icons.warning,
        color: Colors.yellow,
        size: 20,
      );
    } else if (mode == DfSnackBarMode.error) {
      icon = const Icon(
        Icons.warning,
        color: Colors.red,
        size: 20,
      );
    }
    // TODO: Consider moving to an option or a context provider of some kind
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color(0xff262626),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        direction: Axis.horizontal,
        children: [
          icon,
          const DfSpace(
            0.5,
            direction: Axis.horizontal,
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class DfSnackBar {
  static void open(BuildContext context, String title, DfSnackBarMode mode) {
    final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: DfSnackBarContent(
          title: title,
          mode: mode,
        ),
      ),
    );
  }

  static void dismiss(BuildContext context) {
    final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.clearSnackBars();
  }
}
