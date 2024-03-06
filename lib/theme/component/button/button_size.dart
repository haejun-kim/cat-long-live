part of "button.dart";

enum ButtonSize {
  small,
  medium,
  large;

  double get padding {
    switch (this) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
    }
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (this) {
      case ButtonSize.small:
        return context.typo.body2;
      case ButtonSize.medium:
        return context.typo.body1;
      case ButtonSize.large:
        return context.typo.subtitle1;
    }
  }
}