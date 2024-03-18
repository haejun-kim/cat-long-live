import 'package:cat_long_live/src/repository/account_repository.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/account/sign_in/sign_in_view.dart';
import 'package:cat_long_live/src/view/account/sign_up/sign_up_view_model.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:cat_long_live/theme/component/toast.dart';
import 'package:cat_long_live/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late final SignUpViewModel signUpViewModel = SignUpViewModel(
    accountRepository: context.read<AccountRepository>(),
  );

  final double paddingSize = 27.0;

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: BaseView(
        viewModel: signUpViewModel,
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

                    // email
                    InputField(
                      controller: viewModel.emailController,
                      maxLength: 30,
                      hint: "email@example.com",
                      icon: "material-mail",
                      horizontalPaddingSize: paddingSize,
                      validator: (value) => Validator.validateEmail(
                        viewModel.emailController.text,
                      ),
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 24),

                    // password
                    InputField(
                      controller: viewModel.passwordController,
                      hint: "password",
                      icon: "material-lock",
                      isObscure: true,
                      horizontalPaddingSize: paddingSize,
                      validator: (value) => Validator.validatePassword(
                        viewModel.passwordController.text,
                      ),
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 24),

                    // confirm password
                    InputField(
                      controller: viewModel.passwordConfirmController,
                      hint: "password confirm",
                      icon: "material-lock",
                      isObscure: true,
                      horizontalPaddingSize: paddingSize,
                      validator: (value) => Validator.validatePassword(
                        viewModel.passwordConfirmController.text,
                      ),
                      onChanged: (value) => viewModel.updateBody(),
                    ),
                    const SizedBox(height: 70),
                    Button(
                      onPressed: () async {
                        try {
                          await viewModel.accountRepository.createAccount(
                            viewModel.body,
                          );

                          if (context.mounted) {
                            await Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInView(),
                              ),
                                  (route) => false,
                            );
                          }
                        } catch (e) {
                          ToastUtils.showToast("올바르지 않은 형식이거나 중복된 이메일입니다.");
                        } finally {
                          viewModel.emailController.clear();
                          viewModel.passwordController.clear();
                          viewModel.passwordConfirmController.clear();
                        }
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
