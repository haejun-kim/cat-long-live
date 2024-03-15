import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints.tight(
          const Size.fromHeight(73),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: context.color.subtext,
          ),
        ),
      ),

      /// TODO: 앞에서 선택한 items 값으로 initialSelection 변경 필요
      /// 여기서 변경후 저장하면 healthiness category에서도 변경된 카테고리 글로 이동되어야 함.
      initialSelection: widget.items.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          widget.items.first != value!;
        });
      },
      dropdownMenuEntries:
          widget.items.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: MenuItemButton.styleFrom(
            backgroundColor: context.color.onPrimary,
          ),
        );
      }).toList(),
    );
  }
}
