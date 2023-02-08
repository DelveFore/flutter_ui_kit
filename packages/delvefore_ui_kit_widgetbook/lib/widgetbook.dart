import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'cases/core.dart';
import 'cases/organisms.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        CoreCategory(),
        OrganismsCategory(),
      ],
      devices: [
        Apple.iPhone13,
        Apple.iPadPro12inch,
        Samsung.s21ultra,
        Apple.iPhone7,
      ],
      useCaseBuilder: (BuildContext context, Widget child) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(child: child),
        );
      },
      textScaleFactors: [
        1.00,
        0.9,
        0.8,
        0.7,
      ],
      frames: [
        WidgetbookFrame.defaultFrame(),
        WidgetbookFrame.deviceFrame(),
        WidgetbookFrame.noFrame(),
      ],
      appInfo: AppInfo(name: 'DelveFore UI Kit'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
    );
  }
}
