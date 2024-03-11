import 'package:cat_long_live/src/model/health.dart';
import 'package:cat_long_live/src/repository/health_repository.dart';
import 'package:flutter/material.dart';

class HealthService with ChangeNotifier {
  HealthService({required this.healthRepository})
      : health = healthRepository.healthList;

  final Health health;
  final HealthRepository healthRepository;
  List<String> healthCategoryItemList = const [];

  List<String> get healthCategoryList {
    return health.healthCategoryItem;
  }
}