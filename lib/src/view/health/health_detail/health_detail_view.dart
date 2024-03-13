import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/date_picker.dart';
import 'package:cat_long_live/theme/component/drop_down.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class HealthDetailView extends StatelessWidget {
  const HealthDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "진료 결과",
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: DatePicker(
                      type: ButtonType.outline,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// TODO: HealthCategory list값으로 변경 필요
                      Expanded(
                        child: CustomDropDown(
                          healthCategory: ["진료 기록", "심장사상충 투여", "정기 건강 검진"],
                        ),
                      ),
                      Expanded(
                        child: InputField(
                          hint: "병원 이름",
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "제목",
                    style: context.typo.headline1
                        .copyWith(fontWeight: context.typo.bold),
                  ),
                  InputField(),
                  Text(
                    "내용",
                    style: context.typo.headline1
                        .copyWith(fontWeight: context.typo.bold),
                  ),
                  InputField(
                    maxLength: 300,
                    maxLine: 7,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        text: "취소",
                        type: ButtonType.outline,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Button(
                        text: "확인",
                        /// TODO: 데이터 업데이트 후 정상적으로 저장되면
                        /// 화면 렌더링으로 수정 필요
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
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
