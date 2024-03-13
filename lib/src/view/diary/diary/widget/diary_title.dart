import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/diary/diary_create/diary_create_view.dart';
import 'package:flutter/material.dart';

class DiaryTitleView extends StatelessWidget {
  const DiaryTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: item List 불러온 후 Dismissible로 Delete 동작하도록 수정
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DiaryCreateView(),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              color: context.color.primary.withOpacity(0.3),
              child: const Icon(Icons.accessibility_outlined),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title",
                        style: context.typo.headline2
                            .copyWith(fontWeight: context.typo.bold),
                      ),
                      // const Spacer(),
                      Text(
                        "날짜",
                        style: context.typo.headline6
                            .copyWith(fontWeight: context.typo.bold),
                      ),
                    ],
                  ),
                  Text("content", style: context.typo.subtitle1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
