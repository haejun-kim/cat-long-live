import 'package:cat_long_live/src/service/pocketbase_service.dart';
import 'package:cat_long_live/theme/component/toast.dart';
import 'package:flutter/material.dart';

class KakaoButton extends StatelessWidget {
  const KakaoButton({super.key, required this.onSuccess});

  final Function onSuccess;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.transparent; // 클릭 했을 때의 overlay color를 투명으로 설정
        }),
        shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          return Colors.transparent; // 그림자 색상을 투명으로 설정
        }),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          return 0; // 그림자의 높이를 0으로 설정하여 그림자를 제거
        }),
      ),
      onPressed: () async {
        try {
          final authData = await pb.collection('users').authWithOAuth2(
            "kakao",
            (url) async {
              print("redirect url: $url");
            },
          );
          onSuccess(); // Kakao 로그인 성공 후 실행할 코드를 호출합니다
        } catch (e) {
          ToastUtils.showToast(
            "로그인에 실패했습니다. 다시 시도해주세요.",
          );
        }

        /// TODO: authData를 Account 객체로 전달
      },
      child: Image.asset(
        "assets/images/kakao_login_medium_narrow.png", // 이미지 파일 경로
        width: 183, // 이미지의 가로 크기
        height: 45, // 이미지의 세로 크기
      ),
    );
  }
}
