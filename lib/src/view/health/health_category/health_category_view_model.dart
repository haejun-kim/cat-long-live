import 'package:cat_long_live/src/service/health_service.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class HealthCategoryViewModel extends BaseViewModel {
  HealthCategoryViewModel({
    required this.healthService,
  }) {
    healthService.addListener(notifyListeners);
  }

  final HealthService healthService;
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    healthService.removeListener(notifyListeners);
    super.dispose();
  }

  List<String> get healthCategoryItem => healthService.healthCategoryList;

  void onAddToHealthCategory(String newHealthCategory) {
    healthService.addHealthCategory(newHealthCategory);
  }

  void onUpdateToHealthCategory(int index, String updateHealthCategory) {
    healthService.updateHealthCategory(index, updateHealthCategory);
  }

  void onDeleteToHealthCategory(String deleteHealthCategory) {
    healthService.deleteHealthCategory(deleteHealthCategory);
  }
}
