import 'package:cat_long_live/src/view/account/view/sign_up_view.dart';
import 'package:cat_long_live/src/view/home/cat/cat_view.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/kakao_button.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';
import 'package:cat_long_live/src/service/theme_service.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.16),
                    child: Text(
                      "Sign In",
                      style: context.theme.typo.headline1.copyWith(
                          fontWeight: context.typo.bold, fontSize: 32),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back",
                    style: context.typo.headline4.copyWith(
                      color: context.color.subtext,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const InputField(
                    hint: "이메일을 입력해주세요.",
                    icon: "material-mail",
                    labelText: "Email",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const InputField(
                    hint: "비밀번호를 입력해주세요.",
                    icon: "material-lock",
                    labelText: "Password",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: const Alignment(0.87, 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: context.typo.subtitle2
                            .copyWith(color: context.color.primary),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Button(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CatView();
                        },
                      ));
                    },
                    text: "로그인",
                    width: 183,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OR",
                    style: context.typo.body1.copyWith(
                      color: context.color.subtext,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const KakaoButton(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("아직 회원이 아니신가요?", style: context.typo.body1),
                      const SizedBox(
                        width: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignUpView();
                            },
                          ));
                        },
                        child: Text(
                          "회원가입",
                          style: context.typo.body1.copyWith(
                              color: context.color.primary,
                              fontWeight: context.typo.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
