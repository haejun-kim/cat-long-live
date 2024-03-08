import 'package:flutter/material.dart';

class KakaoButton extends StatelessWidget {
  const KakaoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Image.asset(
        "assets/images/kakao_login_medium_narrow.png", // 이미지 파일 경로
        width: 183, // 이미지의 가로 크기
        height: 45, // 이미지의 세로 크기
      ),
    );
  }
}
