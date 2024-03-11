import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    bool? isInputField,
  }) : isInputField = isInputField ?? false;

  final String? title;
  final String? content;
  final bool isInputField;
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
          content: isInputField
              ? const InputField()
              : content != null
                  ? Text(content!)
                  : null,
          actions: actions,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await showMyDialog(context);
      },
      child: const Text('Show Dialog'),
    );
  }
}
