import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: context.color.surface,
      selectedItemColor: context.color.primary,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: AssetIcon(
            "material-home",
            color: _currentIndex == 0
                ? context.color.primary // 선택된 아이템의 아이콘 색상
                : context.color.subtext,
          ),
          label: "홈",
        ),
        BottomNavigationBarItem(
          icon: AssetIcon(
            "material-health-and-safety",
            color: _currentIndex == 1
                ? context.color.primary // 선택된 아이템의 아이콘 색상
                : context.color.subtext,
          ),
          label: "건강",
        ),
        BottomNavigationBarItem(
          icon: AssetIcon(
            "material-library-books",
            color: _currentIndex == 2
                ? context.color.primary // 선택된 아이템의 아이콘 색상
                : context.color.subtext,
          ),
          label: "다이어리",
        ),
      ],
      selectedIconTheme: IconThemeData(
        color: context.color.primary, // 선택된 아이템의 아이콘 색상
      ),
      selectedLabelStyle: TextStyle(
        fontWeight: context.typo.bold,
        fontSize: 13,
      ),
    );
  }
}
