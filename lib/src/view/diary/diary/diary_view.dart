import 'package:cat_long_live/src/view/diary/diary/widget/diary_title.dart';
import 'package:cat_long_live/src/view/diary/diary_create/diary_create_view.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/day_of_week.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DayOfWeek(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: DiaryTitleView(),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DiaryCreateView(),
            ),
          );
        },
      ),
    );
  }
}
