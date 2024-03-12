import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayOfWeek extends StatelessWidget {
  DayOfWeek({super.key});

  final String nowString = DateFormat("yy-MM-dd").format(DateTime.now());
  final String dayOfWeek = DateFormat('E', 'ko_KR').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "$nowString $dayOfWeek요일",
        style: context.typo.headline4.copyWith(
          fontWeight: context.typo.bold,
        ),
      ),
    );
  }
}
