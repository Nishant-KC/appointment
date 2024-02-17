// ignore_for_file: must_be_immutable

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/constants.dart';

class DropDownSearchWidget extends StatefulWidget {
  DropDownSearchWidget(
      {super.key,
      required this.label,
      this.selectedValue,
      required this.items});
  final String label;
  DropDownValues? selectedValue;
  final List<DropDownValues> items;

  @override
  State<DropDownSearchWidget> createState() => _DropDownSearchWidgetState();
}

class _DropDownSearchWidgetState extends State<DropDownSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<DropDownValues?>(
      items: widget.items,
      popupProps: PopupProps.menu(
        constraints: const BoxConstraints(maxHeight: 150, maxWidth: 200),
        itemBuilder: (context, DropDownValues? item, isSelected) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            item!.name,
            style: widget.selectedValue == item
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: ThemeConstants.primaryColor)
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        menuProps: const MenuProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
      ),
      onChanged: (DropDownValues? value) {
        widget.selectedValue = value;
      },
      selectedItem: widget.selectedValue,
      itemAsString: (DropDownValues? item) => item!.name,
      dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
        labelText: widget.label,
        isDense: true,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        focusColor: ThemeConstants.black,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        border: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      )),
    );
  }
}
