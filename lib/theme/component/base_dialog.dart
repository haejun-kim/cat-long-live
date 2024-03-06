import 'package:flutter/material.dart';
import 'package:cat_long_live/src/service/theme_service.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
  });

  final String? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.color.onPrimary,
      titlePadding: const EdgeInsets.all(24),
      contentPadding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 12,
      ),
      // actionsPadding: const EdgeInsets.only(
      //   top: 12,
      //   right: 24,
      //   bottom: 24,
      // ),
      title: title != null
          ? Text(
              title!,
              style: context.typo.headline4.copyWith(
                fontWeight: context.typo.bold,
              ),
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
