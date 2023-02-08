import 'package:delvefore_ui_kit_widgetbook/cases/organisms/modal_bottom_sheet_cases.dart';
import 'package:delvefore_ui_kit_widgetbook/cases/organisms/snack_bar_cases.dart';
import 'package:widgetbook/widgetbook.dart';

import 'organisms/user_chip_cases.dart';

class OrganismsCategory extends WidgetbookCategory {
  OrganismsCategory()
      : super(
          name: 'Organisms',
          widgets: [
            ModalBottomSheetCases(),
            UserChipCases(),
            SnackBarCases(),
          ],
        );
}
