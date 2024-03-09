import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/health/health_view_model.dart';
import 'package:cat_long_live/src/view/health/widget/health_list_tile.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/day_of_week.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HealthView extends StatelessWidget {
  const HealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HealthViewModel(catService: context.read()),
      builder: (context, viewModel) => Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DayOfWeek(),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.catImageList.length,
                  itemBuilder: (context, index) {
                    final cat = viewModel.catImageList[index];
                    return HealthListTile(cat: cat);
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {},
        ),
        // bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
