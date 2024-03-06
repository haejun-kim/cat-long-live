part of "button.dart";

enum ButtonType {
  fill,
  outline,
  flat;

  // text & icon color
  Color getColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.onInactiveContainer
            : color ?? context.color.onPrimary;
      case ButtonType.outline:
      case ButtonType.flat:
        return isInactive
            ? context.color.inactive
            : color ?? context.color.primary;
    }
  }

  // background color
  Color getBackgroundColor(
      BuildContext context,
      bool isInactive, [
        Color? color,
      ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.onInactiveContainer
            : color ?? context.color.primary;
      case ButtonType.outline:
      case ButtonType.flat:
        return color ?? Colors.transparent;
    }
  }

  // border
  Border? getBorder(
      BuildContext context,
      bool isInactive, [
        Color? color,
      ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(context, isInactive, color),
        );
    }
  }
}
