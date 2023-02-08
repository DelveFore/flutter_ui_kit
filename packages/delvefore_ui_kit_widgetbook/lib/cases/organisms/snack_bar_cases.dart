import 'package:delvefore_ui_kit/presentation/df_button.dart';
import 'package:delvefore_ui_kit/presentation/df_flex.dart';
import 'package:delvefore_ui_kit/presentation/df_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class SnackBarCases extends WidgetbookComponent {
  SnackBarCases()
      : super(
          name: 'Snack Bar',
          useCases: [
            WidgetbookUseCase(
              name: 'Modes',
              builder: (BuildContext context) {
                return const DfColumn(
                  spacingFactor: 2,
                  children: [
                    DfSnackBarContent(
                      title: 'Error',
                    ),
                    DfSnackBarContent(
                      title: 'Success',
                      mode: DfSnackBarMode.success,
                    ),
                    DfSnackBarContent(
                      title: 'Warn',
                      mode: DfSnackBarMode.warn,
                    )
                  ],
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Open with Button',
              builder: (BuildContext context) {
                return DfButton(
                  label: 'Open SnackBar',
                  onPressed: () {
                    DfSnackBar.open(context, 'Yeah!', DfSnackBarMode.success);
                  },
                );
              },
            ),
          ],
        );
}
