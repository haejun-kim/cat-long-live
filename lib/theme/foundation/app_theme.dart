import 'package:cat_long_live/theme/res/typo.dart';
import 'package:flutter/material.dart';

part 'app_color.dart';
part 'app_deco.dart';
part 'app_typo.dart';

abstract class AppTheme {
  late final AppColor color;
  late final AppDeco deco;
  late final AppTypo typo;
}