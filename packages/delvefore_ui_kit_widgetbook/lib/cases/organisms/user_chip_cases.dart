import 'package:delvefore_ui_kit/presentation/df_user_chips.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class UserChipCases extends WidgetbookComponent {
  UserChipCases()
      : super(
          name: 'User Input Chip',
          useCases: [
            WidgetbookUseCase(
              name: 'Enabled',
              builder: (BuildContext context) {
                return UserInputChip(
                  name: 'John Bailey',
                  avatarUrl: 'https://i.pravatar.cc/150?img=3',
                  onPressed: () {},
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Disabled',
              builder: (BuildContext context) {
                return const UserInputChip(
                  name: 'John Bailey',
                  avatarUrl: 'https://i.pravatar.cc/150?img=4',
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Removable',
              builder: (BuildContext context) {
                return UserInputChip(
                  name: 'John Bailey',
                  avatarUrl: 'https://i.pravatar.cc/150?img=5',
                  onPressed: () {},
                  onDeleted: () {},
                );
              },
            ),
          ],
        );
}
