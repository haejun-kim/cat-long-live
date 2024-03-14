import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.pages,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final List<Widget> pages;
  final void Function(int index) onDestinationSelected;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) =>
                states.contains(MaterialState.selected)
                    ? TextStyle(color: context.color.primary)
                    : TextStyle(color: context.color.subtext),
          ),
        ),
        child: NavigationBar(
          height: MediaQuery.of(context).size.height * 0.07,
          backgroundColor: context.color.surface,
          indicatorColor: Colors.transparent,
          selectedIndex: widget.currentIndex,
          onDestinationSelected: widget.onDestinationSelected,
          destinations: [
            NavigationDestination(
              selectedIcon:
                  AssetIcon("material-home", color: context.color.primary),
              icon: AssetIcon("material-home", color: context.color.subtext),
              label: "홈",
            ),
            NavigationDestination(
              selectedIcon: AssetIcon("material-healthiness-and-safety",
                  color: context.color.primary),
              icon: AssetIcon("material-healthiness-and-safety",
                  color: context.color.subtext),
              label: "건강",
            ),
            NavigationDestination(
              selectedIcon: AssetIcon("material-library-books",
                  color: context.color.primary),
              icon: AssetIcon("material-library-books",
                  color: context.color.subtext),
              label: "다이어리",
            ),
          ],
        ),
      ),
    );
  }
}
