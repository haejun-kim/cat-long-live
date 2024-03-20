import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({
    super.key,
    this.initialGender,
    required this.onGenderSelected,
  });

  final Function(String) onGenderSelected;
  final String? initialGender;

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  String selectedGender = "";

  @override
  void initState() {
    super.initState();
    if (widget.initialGender != null) {
      selectedGender = widget.initialGender!;
      if (selectedGender == "male") {
        selectedGender = "남";
      } else {
        selectedGender = "여";
      }
    }
  }

  void toggleGenderButton(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onGenderSelected(selectedGender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Button(
          text: "남",
          width: 100,
          type: selectedGender == "남" ? ButtonType.fill : ButtonType.outline,
          onPressed: () => toggleGenderButton("남"),
        ),
        Button(
          text: "여",
          width: 100,
          type: selectedGender == "여" ? ButtonType.fill : ButtonType.outline,
          onPressed: () => toggleGenderButton("여"),
        ),
      ],
    );
  }
}
