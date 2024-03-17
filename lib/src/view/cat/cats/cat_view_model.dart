import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/cat_service.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';

class CatViewModel extends BaseViewModel {
  CatViewModel({required this.catService}) {
    catService.addListener(notifyListeners);
  }

  final CatService catService;

  @override
  void dispose() {
    catService.removeListener(notifyListeners);
    super.dispose();
  }

  Future<List<Cat>?> get catItems async {
    return await catService.cat;
  }
}
