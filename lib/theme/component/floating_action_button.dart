import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.color.primary,
      child: Icon(
        Icons.add,
        color: context.color.onPrimary,
        size: 30,
      ),
    );
  }
}
