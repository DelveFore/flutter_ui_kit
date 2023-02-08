import 'package:delvefore_ui_kit/presentation/df_button.dart';
import 'package:delvefore_ui_kit/presentation/df_flex.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ButtonCases extends WidgetbookComponent {
  ButtonCases()
      : super(
          name: 'Buttons',
          useCases: [
            WidgetbookUseCase(
              name: 'Primary',
              builder: (BuildContext context) {
                return DfColumn(
                  spacingFactor: 2,
                  children: [
                    DfButton(label: 'Button', onPressed: () {}),
                    DfButton.primary(label: 'Button', onPressed: () {}),
                  ],
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Secondary',
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DfButton.secondary(label: 'Button', onPressed: () {}),
                    ],
                  ),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Text',
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      DfButton.text(label: 'Button', onPressed: () {}),
                    ],
                  ),
                );
              },
            ),
          ],
        );
}
