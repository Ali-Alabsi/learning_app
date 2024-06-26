
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class Search_Drop extends StatelessWidget {
  const Search_Drop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body:  Center(
        child: DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I'),
          ),
          items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: print,
          selectedItem: "Brazil",
        )

      ),
    );
  }
}
