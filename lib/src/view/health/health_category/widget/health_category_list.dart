import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/base_dialog.dart';
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
      child: GestureDetector(
        /// on long press -> delete category
        onLongPress: () async {
          // BuildContext를 가져와 BaseDialog 호출
          await BaseDialog(
            title: "카테고리 삭제",
            actions: [
              Button(
                text: "취소",
                type: ButtonType.outline,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 1,
              ),
              Button(
                text: "삭제",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ).showMyDialog(context);
        },

        /// TODO: 버튼을 지우고 이렇게 생긴 Box를 직접 생성
        /// health category view에서 ListView를 Gesture Detector로 감싸고
        /// Longpress, press를 List View에서 관리하는 걸로 수정
        /// base dialog 세부분이 생기니 extract widget으로 관리해볼것.
        child: Button(
          text: healthCategory,
          color: context.color.primary,
          type: ButtonType.flat,
          size: ButtonSize.large,
          backgroundColor: context.color.primary.withOpacity(0.1),

          /// on pressed -> edit category
          onPressed: () async {
            // BuildContext를 가져와 BaseDialog 호출
            await BaseDialog(
              title: "카테고리 수정",
              actions: [
                Button(
                  text: "취소",
                  type: ButtonType.outline,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  width: 1,
                ),
                Button(
                  text: "수정",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ).showMyDialog(context);
          },
        ),
      ),
    );
  }
}
