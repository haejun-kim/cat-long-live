import 'package:cat_long_live/src/model/health.dart';
import 'package:cat_long_live/src/repository/health_repository.dart';
import 'package:flutter/material.dart';

class HealthinessService with ChangeNotifier {
  HealthinessService({required this.healthRepository})
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

  void updateHealthCategory(int index, String updateHealthCategory) {
    healthCategoryItemList = healthCategoryItemList;
    healthCategoryItemList = List.unmodifiable(
      List.from(
        healthCategoryList
            .asMap()
            .entries
            .map((e) => e.key == index ? updateHealthCategory : e.value),
      ),
    );
    health = health.copyWith(healthCategoryItem: healthCategoryItemList);
    notifyListeners();
  }

  void deleteHealthCategory(String deleteHealthCategory) {
    healthCategoryItemList = healthCategoryItemList;
    healthCategoryItemList = List.unmodifiable(
      List.from(
        healthCategoryItemList.where(
          (healthCategoryItem) => deleteHealthCategory != healthCategoryItem,
        ),
      ),
    );
    health = health.copyWith(healthCategoryItem: healthCategoryItemList);
    notifyListeners();
  }
}
