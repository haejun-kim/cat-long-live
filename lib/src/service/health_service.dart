import 'package:cat_long_live/src/model/health.dart';
import 'package:cat_long_live/src/repository/health_repository.dart';
import 'package:flutter/material.dart';

class HealthService with ChangeNotifier {
  HealthService({required this.healthRepository})
      : health = healthRepository.healthList;

  Health health;
  final HealthRepository healthRepository;
  List<String> healthCategoryItemList = const [];

  List<String> get healthCategoryList => health.healthCategoryItem;

  void addHealthCategory(String newHealthCategory) {
    healthCategoryItemList = healthCategoryList;
    healthCategoryItemList = List.unmodifiable(
      [...healthCategoryItemList, newHealthCategory],
    );
    health = health.copyWith(healthCategoryItem: healthCategoryItemList);
    notifyListeners();
  }
}
