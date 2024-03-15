import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class HealthListTile extends StatelessWidget {
  const HealthListTile({
    super.key,
    required this.cat,
    required this.onPressed,
    String? catName,
  }) : catName = catName ?? "냥1";

  final String catName;
  final Cat cat;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.color.surface,
              border: Border.all(
                color: context.color.hint, // 테두리 선 색상
                width: 1.0, // 테두리 선 두께
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      cat.imageUrl,
                      height: 100.0,
                      width: 100.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    catName,
                    style: context.typo.headline4.copyWith(
                      fontWeight: context.typo.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
