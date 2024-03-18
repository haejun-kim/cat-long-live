import 'package:cat_long_live/src/repository/account_repository.dart';
import 'package:cat_long_live/src/repository/cat_repository.dart';
import 'package:cat_long_live/src/repository/health_repository.dart';
import 'package:cat_long_live/src/service/cat_service.dart';
import 'package:cat_long_live/src/service/health_service.dart';
import 'package:cat_long_live/src/service/pocketbase_service.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/account/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeDateFormatting();
  await dotenv.load(fileName: 'assets/config/.env');
  await PocketBaseService().getAdminAuthorization();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => HealthRepository()),
        Provider(create: (context) => AccountRepository()),
        Provider(create: (context) => CatRepository()),
        ChangeNotifierProvider(
          create: (context) => ThemeService(),
        ),
        ChangeNotifierProvider(
          create: (context) => PocketBaseService(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CatService(catRepository: context.read<CatRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HealthinessService(
            healthRepository: context.read<HealthRepository>(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInView(),
      theme: context.themeService.themeData,
    );
  }
}
