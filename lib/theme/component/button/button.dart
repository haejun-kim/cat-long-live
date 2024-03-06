import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

part "button_size.dart";

part "button_type.dart";

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor,
    ButtonSize? size,
    ButtonType? type,
    bool? isInactive,
  })  : size = size ?? ButtonSize.medium,
        type = type ?? ButtonType.fill,
        isInactive = isInactive ?? false;

  // click event
  final void Function() onPressed;

  // button type & size
  final ButtonSize size;
  final ButtonType type;

  // is inactivate
  final bool isInactive;

  // text & icon
  final String? text;
  final String? icon;

  // width
  final double? width;

  // custom color
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  bool get isInactive => isPressed || widget.isInactive;

  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );

  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );

  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) {
      setState(() {
        isPressed = newIsPressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Icon
        if (widget.icon != null)
          AssetIcon(
            widget.icon!,
            color: color,
          ),

        /// Gap
        if (widget.icon != null && widget.text != null)
          const SizedBox(width: 6),

        /// Text
        if (widget.text != null)
          Text(
            widget.text!,
            style: widget.size.getTextStyle(context).copyWith(
              color: color,
              fontWeight: context.typo.bold
            ),
          ),
      ],
    );
  }
}
