import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.hint,
    this.icon,
    this.minLine,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.labelText,
    int? maxLength,
    int? maxLine,
    bool? isClear,
    double? horizontalPaddingSize,
  })  : maxLength = maxLength ?? 15,
        maxLine = maxLine ?? 1,
        isClear = isClear ?? false,
        horizontalPaddingSize = horizontalPaddingSize ?? 0;

  final String? hint; // 아무것도 입력하지 않았을 때
  final String? icon; // 아이콘을 함께 포함하고 싶을 때
  final int maxLength;
  final int maxLine;
  final int? minLine;
  final bool isClear;
  final String? labelText;
  final double? horizontalPaddingSize;
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPaddingSize!),
      child: TextFormField(
        maxLength: widget.maxLength,
        maxLines: widget.maxLine,
        minLines: widget.minLine ?? widget.minLine,

        controller: controller,

        // changed text
        onChanged: (value) {
          setState(() {});
          widget.onChanged?.call(value);
        },

        // text style
        style: context.typo.headline5,

        // cursor color
        cursorColor: context.color.subtext,

        decoration: InputDecoration(
          // border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),

          // focusBorder
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: context.color.subtext,
            ),
          ),

          // label
          labelText:
              widget.labelText?.isNotEmpty == true ? widget.labelText : null,

          // floating label
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelStyle: TextStyle(
            color: context.color.text,
            letterSpacing: 1.3,
            fontWeight: FontWeight.bold,
          ),

          // background color
          filled: true,
          fillColor: context.color.hintContainer,

          // hint style
          hintStyle: context.typo.subtitle1.copyWith(
            color: context.color.onHintContainer,
          ),
          hintText: widget.hint,

          // padding
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),

          // prefix icon
          prefixIcon: widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: AssetIcon(
                    widget.icon!,
                    color: context.color.onHintContainer,
                  ),
                )
              : null,

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
      ),
    );
  }
}
