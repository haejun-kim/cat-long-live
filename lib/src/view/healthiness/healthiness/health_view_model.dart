import 'package:cat_long_live/src/service/cat_service.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';

class HealthViewModel extends BaseViewModel {
  HealthViewModel({required this.catService}) {
    catService.addListener(notifyListeners);
  }

  final CatService catService;

  @override
  void dispose() {
    catService.removeListener(notifyListeners);
    super.dispose();
  }

  get catItems => catService.catItems;
}
