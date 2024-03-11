import 'package:cat_long_live/src/service/health_service.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/health/health_category/health_category_view_model.dart';
import 'package:cat_long_live/src/view/health/health_category/widget/health_category_list.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/base_dialog.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/day_of_week.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HealthCategoryView extends StatefulWidget {
  const HealthCategoryView({super.key});

  @override
  State<HealthCategoryView> createState() => _HealthCategoryViewState();
}

class _HealthCategoryViewState extends State<HealthCategoryView> {
  late final HealthCategoryViewModel healthCategoryViewModel =
      HealthCategoryViewModel(
    healthService: context.read<HealthService>(),
  );

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: healthCategoryViewModel,
      builder: (context, viewModel) => Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DayOfWeek(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Button(
                      text: "신규 등록",
                      onPressed: () async {
                        // BuildContext를 가져와 BaseDialog 호출
                        await BaseDialog(
                          title: "카테고리 등록",
                          isInputField: true,
                          actions: [
                            Button(
                              text: "취소",
                              type: ButtonType.outline,
                              onPressed: () {
                                /// TODO: HealthCategory Item List에 추가되고
                                /// 화면 rebuild 되도록 구현 필요
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(width: 1,),
                            Button(
                              text: "생성",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ).showMyDialog(context);
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.healthCategoryItem.length,
                  itemBuilder: (context, index) {
                    final healthCategory = viewModel.healthCategoryItem[index];
                    return HealthCategoryList(
                      healthCategory: healthCategory,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
