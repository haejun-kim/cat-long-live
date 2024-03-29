import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class BaseDialog {
  const BaseDialog({
    this.title,
    this.content,
    this.actions,
    this.inputField,
  });

  final String? title;
  final String? content;
  final Widget? inputField;
  final List<Widget>? actions;

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.color.onPrimary,
          titlePadding: const EdgeInsets.all(24),
          contentPadding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 12,
          ),
          title: title != null
              ? Text(
                  title!,
                  style: context.typo.headline4.copyWith(
                    fontWeight: context.typo.bold,
                  ),
                )
              : null,
          content: inputField ?? (content != null ? Text(content!) : null),
          actions: actions,
        );
      },
    );
  }
}
