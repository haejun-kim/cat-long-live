import 'package:cat_long_live/src/service/health_service.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';

class HealthCategoryViewModel extends BaseViewModel {
  HealthCategoryViewModel({
    required this.healthService,
  }) {
    healthService.addListener(notifyListeners);
  }

  final HealthService healthService;

  @override
  void dispose() {
    healthService.removeListener(notifyListeners);
    super.dispose();
  }

  List<String> get healthCategoryItem => healthService.healthCategoryList;
}