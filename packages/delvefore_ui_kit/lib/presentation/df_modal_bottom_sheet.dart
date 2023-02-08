import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' hide ModalBottomSheetRoute;

class DfModalBottomSheetToolbar extends StatelessWidget {
  const DfModalBottomSheetToolbar({
    super.key,
    this.title,
    this.onSearch,
  });
  final String? title;
  final VoidCallback? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => {
                  Navigator.of(context).pop(),
                },
              ),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Text(
              title != null ? title! : '',
            ),
          ),
          if (onSearch != null)
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onSearch,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class DfModalBottomSheet extends StatelessWidget {
  const DfModalBottomSheet({
    Key? key,
    required this.child,
    this.title,
    this.closeable = true,
    this.minHeight = 200,
    this.onSearch,
  }) : super(key: key);
  final Widget child;
  final String? title;
  final bool closeable;
  final double minHeight;
  final VoidCallback? onSearch;

  static Future<T?> show<T>(BuildContext context, WidgetBuilder builder, {String? title}) =>
      showMaterialModalBottomSheet<T>(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) => DfModalBottomSheet(
          title: title,
          child: builder(context),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: SingleChildScrollView(
        padding: createScrollPadding(),
        child: Column(
          children: [
            createToolbar(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  EdgeInsetsGeometry createScrollPadding() {
    return const EdgeInsets.only(left: 3, top: 6, right: 3);
  }

  Widget createToolbar(BuildContext context) {
    return DfModalBottomSheetToolbar(
      title: title,
      onSearch: onSearch,
    );
  }
}
