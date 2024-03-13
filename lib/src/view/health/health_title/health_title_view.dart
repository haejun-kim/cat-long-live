import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/health/health_detail/health_detail_view.dart';
import 'package:cat_long_live/src/view/health/health_title/widget/health_title_card.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';

class HealthTitleView extends StatelessWidget {
  const HealthTitleView({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: category,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "2024-03",
                  style: context.typo.headline3
                      .copyWith(fontWeight: context.typo.bold),
                ),
              ),

              /// TODO: ListView builder로 변경
              const HealthTitleCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HealthDetailView(),
          ),
        );
      }),
    );
  }
}
