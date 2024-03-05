import 'package:flutter/material.dart';
import 'package:cat_long_live/theme/foundation/app_theme.dart';
import 'package:cat_long_live/theme/theme.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {

  AppTheme theme = LightTheme();

  ThemeData get themeData {
    return ThemeData(
      // scaffold
      scaffoldBackgroundColor: theme.color.surface,

      // appbar
      appBarTheme: AppBarTheme(
        backgroundColor: theme.color.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.color.text,
        ),
        titleTextStyle: theme.typo.headline2.copyWith(
          color: theme.color.text,
        ),
      ),
    );
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();

  AppTheme get theme => themeService.theme;

  AppColor get color => theme.color;

  AppDeco get deco => theme.deco;

  AppTypo get typo => theme.typo;
}
