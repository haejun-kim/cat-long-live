import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/home/cat/cat_view_model.dart';
import 'package:cat_long_live/src/view/home/widget/cat_list.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/bottom_nav_bar.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CatView extends StatelessWidget {
  CatView({super.key});

  final String nowString = DateFormat("yy-MM-dd").format(DateTime.now());
  final String dayOfWeek = DateFormat('E', 'ko_KR').format(DateTime.now());

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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "$nowString $dayOfWeek요일",
                  style: context.typo.headline4.copyWith(
                    fontWeight: context.typo.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.builder(
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
        floatingActionButton: const CustomFloatingActionButton(),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
