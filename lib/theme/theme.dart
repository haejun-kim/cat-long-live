import 'package:flutter/material.dart';

import 'foundation/app_theme.dart';
import 'res/palette.dart';
import 'res/typo.dart';

class LightTheme implements AppTheme {
  @override
  AppColor color = AppColor(
    surface: Palette.grey100,
    background: Palette.black.withOpacity(0.55),
    text: Palette.black,
    subtext: Palette.grey700,
    hint: Palette.grey300,
    hintContainer: Palette.grey150,
    onHintContainer: Palette.grey500,
    inactive: Palette.blue.withOpacity(0.4),
    inactiveContainer: Palette.white,
    onInactiveContainer: Palette.blue.withOpacity(0.4),
    pressed: Palette.pressedBlue,
    pressedContainer: Palette.white,
    onPressedContainer: Palette.pressedBlue,
    danger: Palette.red,
    primary: Palette.blue,
    onPrimary: Palette.white,
    secondary: Palette.green,
    onSecondary: Palette.white,
  );

  @override
  late AppTypo typo = AppTypo(
    typo: const Catamaran(),
    fontColor: color.text,
  );

  @override
  AppDeco deco = AppDeco(
    shadow: [
      BoxShadow(
        color: Palette.black.withOpacity(0.1),
        blurRadius: 35,
      ),
    ],
  );
}