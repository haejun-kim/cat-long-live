import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:flutter/material.dart';

class HealthTitleCard extends StatelessWidget {
  const HealthTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.color.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: Text(
                      "Title",
                      style: context.typo.headline1.copyWith(
                        fontWeight: context.typo.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      "날짜",
                      style: context.typo.subtitle1.copyWith(
                        fontWeight: context.typo.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      text: "수정",
                      icon: "material-edit",
                      size: ButtonSize.small,
                      type: ButtonType.outline,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15),
                    Button(
                      text: "삭제",
                      icon: "material-delete",
                      size: ButtonSize.small,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
