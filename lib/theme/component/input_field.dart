import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.icon,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    bool? isClear,
  }) : isClear = isClear ?? false;

  final String? hint; // 아무것도 입력하지 않았을 때
  final String? icon; // 아이콘을 함께 포함하고 싶을 때
  final bool isClear;
  final TextEditingController? controller; // 입력
  final void Function(String text)? onChanged; // 입력을 할 때마다 호출
  final void Function(String text)? onSubmitted; // 입력 완료 후 제출 버튼 호출
  final void Function()? onClear; // 내용을 모두 지울 때 호출

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController controller =
      widget.controller ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      // changed text
      onChanged: (value) {
        setState(() {});
        widget.onChanged?.call(value);
      },

      // text style
      style: context.typo.headline5,

      // cursor color
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        // background color
        filled: true,
        fillColor: context.color.hintContainer,

        // hint style
        hintStyle: context.typo.headline5.copyWith(
          color: context.color.onHintContainer,
        ),
        hintText: widget.hint,

        // padding
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),

        // prefix icon
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: widget.icon != null
              ? AssetIcon(widget.icon!, color: context.color.onHintContainer)
              : null,
        ),

        // delete button
        suffixIcon: controller.text.isNotEmpty && widget.isClear == true
            ? Button(
                icon: "material-clear",
                type: ButtonType.flat,
                color: context.color.text,
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onClear?.call();
                  });
                },
              )
            : null,
      ),
    );
  }
}
