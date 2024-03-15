import 'package:cat_long_live/src/repository/account_repository.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends BaseViewModel {
  SignInViewModel({required this.accountRepository});

  final AccountRepository accountRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Map<String, dynamic> body = {
    "email": "",
    "password": "",
  };


  void updateBody() {
    body["email"] = emailController.text;
    body["password"] = passwordController.text;
  }
}
