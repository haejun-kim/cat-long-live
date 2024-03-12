import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/cat/cats/cat_view_model.dart';
import 'package:cat_long_live/src/view/cat/cats/widget/cat_list.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/create_update_cat_view.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/day_of_week.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CatViewModel(catService: context.read()),
      builder: (context, viewModel) => Scaffold(
        appBar: const CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DayOfWeek(),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
                  key: const PageStorageKey<String>("catViewTab"),
                  itemCount: viewModel.catImageList.length,
                  itemBuilder: (context, index) {
                    final cat = viewModel.catImageList[index];
                    return CatListView(cat: cat);
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CreateAndUpdateCatView();
              },
            ));
          },
        ),
        // bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
