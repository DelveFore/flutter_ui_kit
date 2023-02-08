import 'package:delvefore_ui_kit/presentation/df_flex.dart';
import 'package:delvefore_ui_kit/presentation/df_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class ModalBottomSheetCases extends WidgetbookComponent {
  ModalBottomSheetCases()
      : super(
          name: 'Modal Bottom Sheet',
          useCases: [
            WidgetbookUseCase(
              name: 'Content',
              builder: (BuildContext context) {
                return const DfModalBottomSheet(
                  child: Text('hi'),
                );
              },
            ),
            WidgetbookUseCase(
              name: 'Search',
              builder: (BuildContext context) {
                return const SearchExample();
              },
            ),
          ],
        );
}

class SearchExample extends StatefulWidget {
  const SearchExample({
    super.key,
  });

  @override
  State<SearchExample> createState() => _SearchExampleState();
}

class _SearchExampleState extends State<SearchExample> {
  List<String> list = ['John', 'Bailey', 'Micheal', 'Daniel', 'Bobby', 'Joy'];
  bool showSearch = false;

  final searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    searchController.addListener(
      () {
        filter(searchController.text);
      },
    );
  }

  void filter(String value) {
    if (value.isNotEmpty) {
      setState(() {
        list = list.where((element) => element.contains(value)).toList();
      });
    } else {
      setState(() {
        list = ['John', 'Bailey', 'Micheal', 'Daniel', 'Bobby', 'Joy'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DfModalBottomSheet(
      onSearch: () {
        setState(() {
          showSearch = !showSearch;
        });
      },
      child: DfColumn(
        children: [
          if (showSearch)
            TextField(
              controller: searchController,
            ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(list[index]);
            },
          ),
        ],
      ),
    );
  }
}
