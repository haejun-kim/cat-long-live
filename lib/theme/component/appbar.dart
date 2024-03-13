import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/home/home_view.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, String? title}) : title = title ?? "냥수무강";

  final String title;
  static const String accountIcon = "material-account-circle";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePageView(),
                  ),
                );
              },
              child: Text(
                title,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: AssetIcon(
                    accountIcon,
                    size: 35,
                    color: context.color.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// @override
// Size get preferredSize => Size.fromHeight(height);
}
