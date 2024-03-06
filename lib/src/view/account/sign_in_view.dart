import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:flutter/material.dart';
import 'package:cat_long_live/src/service/theme_service.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Sign In",
            style: ThemeService().theme.typo.headline1,
          ),
        ),
      ),
    );
  }
}
