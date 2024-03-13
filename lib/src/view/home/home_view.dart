import 'package:cat_long_live/src/view/cat/cats/cat_view.dart';
import 'package:cat_long_live/src/view/diary/diary/diary_view.dart';
import 'package:cat_long_live/src/view/health/health/health_view.dart';
import 'package:cat_long_live/theme/component/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageView> {
  int _currentIndex = 0;

  final _pages = const [
    CatView(),
    HealthView(),
    DiaryView(),
  ];

  // 페이지 선택 시 호출되는 콜백 메서드
  void _onDestinationSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavBar(currentIndex: _currentIndex,
      pages: _pages,
      onDestinationSelected: _onDestinationSelected,);
  }
}