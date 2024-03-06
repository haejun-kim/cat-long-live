import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  static const String title = "냥수무강";
  static const String accountIcon = "material-account-circle";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppBar(
            centerTitle: true,
            title: const Text(
              title,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const AssetIcon(
                    accountIcon,
                    size: 35,
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
