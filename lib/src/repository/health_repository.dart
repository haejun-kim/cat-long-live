import 'package:cat_long_live/src/model/health.dart';

class HealthRepository {
  final Health healthItems = const Health(
    healthCategoryItem: ["진료 기록", "심장사상충 투여"],
  );

  Health get healthList => healthItems;

  List<String> get healthCategoryList => healthItems.healthCategoryItem;
}
