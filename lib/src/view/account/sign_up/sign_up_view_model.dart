import 'package:cat_long_live/src/view/base_view_model.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController = TextEditingController();

  final Map<String, dynamic> body = {
    "email": "",
    "emailVisibility": true,
    "password": "",
    "passwordConfirm": "",
    "name": "test",
    "verified": true,
  };

  void updateBody() {
    body["email"] = emailController.text;
    body["password"] = passwordController.text;
    body["passwordConfirm"] = passwordConfirmController.text;
  }
}
