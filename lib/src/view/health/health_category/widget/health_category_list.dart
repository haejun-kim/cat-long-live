import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/health/health_category/health_category_view_model.dart';
import 'package:cat_long_live/theme/component/base_dialog.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class HealthCategoryList extends StatelessWidget {
  const HealthCategoryList({
    super.key,
    required this.index,
    required this.healthCategory,
    required this.viewModel,
  });

  final int index;
  final HealthCategoryViewModel viewModel;
  final String healthCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 10,
      ),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: context.color.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                healthCategory,
                style: context.typo.subtitle1.copyWith(
                  color: context.color.primary,
                ),
              ),
            ),
          ),
        ),

        /// update category
        onLongPress: () async {
          await _buildUpdateDialog(context).showMyDialog(context);
        },
        // ),
      ),
    );
  }

  BaseDialog _buildUpdateDialog(BuildContext context) {
    return BaseDialog(
      title: "카테고리 수정",
      inputField: InputField(
        controller: viewModel.textController,
      ),
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
            viewModel.onUpdateToHealthCategory(
              index,
              viewModel.textController.text,
            );
            viewModel.textController.clear();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
