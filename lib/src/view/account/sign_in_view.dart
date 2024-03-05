import 'package:flutter/material.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ThemeService().theme.color.surface,
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: TextButton(
          onPressed: () {
            print("Pressed Sign In Button");
          },
          child: Text(
            "Sign In",
            style: ThemeService().theme.typo.headline1,
          ),
        ),
      ),
    );
  }
}