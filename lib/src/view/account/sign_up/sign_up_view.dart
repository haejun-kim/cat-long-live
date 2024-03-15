import 'package:cat_long_live/src/repository/account_repository.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/account/sign_up/sign_up_view_model.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  final double paddingSize = 27.0;

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: BaseView(
        viewModel: SignUpViewModel(),
        builder: (context, viewModel) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        bottom: 15,
                      ),
                      child: AssetIcon(
                        "material-catching-pokemon",
                        size: 150,
                        color: context.color.primary,
                      ),
                    ),
                    Text(
                      "냥수무강",
                      style: context.typo.headline1.copyWith(
                        fontSize: 32,
                        fontWeight: context.typo.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "회원가입",
                      style: context.typo.subtitle2.copyWith(
                        color: context.color.subtext,
                      ),
                    ),
                    const SizedBox(height: 55),
                    InputField(
                      controller: viewModel.emailController,
                      maxLength: 30,
                      hint: "email@example.com",
                      icon: "material-mail",
                      horizontalPaddingSize: paddingSize,
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: viewModel.passwordController,
                      hint: "password",
                      icon: "material-lock",
                      horizontalPaddingSize: paddingSize,
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 24),
                    InputField(
                      controller: viewModel.passwordConfirmController,
                      hint: "password confirm",
                      icon: "material-lock",
                      horizontalPaddingSize: paddingSize,
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 70),
                    Button(
                      onPressed: () {
                        AccountRepository().createAccount(viewModel.body);
                        viewModel.emailController.clear();
                        viewModel.passwordController.clear();
                        viewModel.passwordConfirmController.clear();
                        Navigator.pop(context);
                      },
                      text: "회원가입",
                      size: ButtonSize.large,
                      width: 380,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
