import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class HealthCategoryList extends StatelessWidget {
  const HealthCategoryList({
    super.key,
    required this.healthCategory,
  });

  final String healthCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 10,
      ),
      child: Button(
        text: healthCategory,
        color: context.color.primary,
        type: ButtonType.flat,
        size: ButtonSize.large,
        backgroundColor: context.color.primary.withOpacity(0.1),
        onPressed: () {},
      ),
    );
  }
}
