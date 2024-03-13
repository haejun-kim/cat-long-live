import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/counter_button.dart';
import 'package:cat_long_live/theme/component/date_picker.dart';
import 'package:cat_long_live/theme/component/drop_down.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/image_upload.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class DiaryCreateView extends StatelessWidget {
  const DiaryCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
        appBar: const CustomAppBar(title: "다이어리"),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DatePicker(
                    type: ButtonType.outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDropDown(items: ["냥1", "냥2"]),
                      CustomDropDown(items: ["맑음", "흐림", "비"]),
                    ],
                  ),
                  Text(
                    "제목",
                    style: context.typo.headline1
                        .copyWith(fontWeight: context.typo.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const InputField(
                    hint: "제목을 입력해주세요.",
                  ),
                  const DiaryCustomCounter(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "내용",
                    style: context.typo.headline1
                        .copyWith(fontWeight: context.typo.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: InputField(
                      hint: "소중한 추억을 기록해요.",
                      maxLine: 10,
                      maxLength: 300,
                    ),
                  ),
                  Text(
                    "이미지",
                    style: context.typo.headline1
                        .copyWith(fontWeight: context.typo.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: ImageUpload(),
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
                  const SizedBox(
                    height: 40,
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

class DiaryCustomCounter extends StatelessWidget {
  const DiaryCustomCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterButton(
              title: "밥 횟수",
            ),
            CounterButton(
              title: "간식 횟수",
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterButton(
              title: "놀이 횟수",
            ),
            CounterButton(
              title: "놀이 시간(분)",
              maxVal: 300,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CounterButton(
              title: "소변 횟수",
            ),
            CounterButton(
              title: "대변 횟수",
            ),
          ],
        ),
      ],
    );
  }
}
