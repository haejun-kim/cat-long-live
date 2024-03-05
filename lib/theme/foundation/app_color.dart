part of 'app_theme.dart';

class AppColor {
  const AppColor({
    required this.surface,
    required this.background,
    required this.text,
    required this.subtext,
    required this.hint,
    required this.hintContainer,
    required this.onHintContainer,
    required this.inactive,
    required this.inactiveContainer,
    required this.onInactiveContainer,
    required this.pressed,
    required this.pressedContainer,
    required this.onPressedContainer,
    required this.danger,
    required this.primary,
    required this.secondary,
    required this.onPrimary,
    required this.onSecondary,
  });

  // surface
  final Color surface;
  final Color background;

  // text
  final Color text;
  final Color subtext;

  /// container naming rule
  /// on(onHintContainer): text and icon color
  /// x(hintContainer): background color

  // hint
  final Color hint;
  final Color hintContainer;
  final Color onHintContainer;

  // inactive
  final Color inactive;
  final Color inactiveContainer;
  final Color onInactiveContainer;

  // pressed
  final Color pressed;
  final Color pressedContainer;
  final Color onPressedContainer;

  // accent
  final Color primary;
  final Color secondary;
  final Color onPrimary;
  final Color onSecondary;

  // danger, error
  final Color danger;
}
