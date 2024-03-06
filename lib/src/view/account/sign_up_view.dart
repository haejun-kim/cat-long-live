import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/bottom_nav_bar.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ID
              const InputField(
                hint: "example@email.com",
                icon: "material-mail",
              ),
              const SizedBox(height: 24),

              /// PW
              const InputField(hint: "password", icon: "material-lock"),
              const SizedBox(height: 24),

              /// confirm PW
              const InputField(hint: "password", icon: "material-lock"),
              const SizedBox(height: 70),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: context.color.primary,
                  fixedSize: const Size(335, 44),
                ),
                onPressed: () {  },
                child: Text(
                  "가입하기",
                  style: TextStyle(
                    color: context.color.onPrimary,
                    fontSize: context.typo.headline4.fontSize,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
