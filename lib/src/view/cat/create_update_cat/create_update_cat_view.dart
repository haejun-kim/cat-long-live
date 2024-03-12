import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/widget/image_upload.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/widget/select_gender.dart';
import 'package:cat_long_live/src/view/home/home_view.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/date_picker.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:flutter/material.dart';

class CreateAndUpdateCatView extends StatefulWidget {
  const CreateAndUpdateCatView({super.key});

  @override
  State<CreateAndUpdateCatView> createState() => _CreateAndUpdateCatViewState();
}

class _CreateAndUpdateCatViewState extends State<CreateAndUpdateCatView> {
  final double sizedBoxHeight = 35;

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "냥이 등록",
                    style: context.typo.headline2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  const InputField(
                    labelText: "냥이 이름",
                    hint: "이름을 입력해주세요.",
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  const DatePicker(),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  Text("성별", style: context.typo.subtitle1),
                  const SelectGender(),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  const InputField(labelText: "품종", hint: "품종을 입력해주세요."),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  const InputField(
                    labelText: "몸무게",
                    hint: "몸무게(kg)를 입력해주세요.",
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  // Image Upload
                  Text("이미지 등록", style: context.typo.subtitle1),
                  const SizedBox(height: 15),
                  const ImageUpload(),

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
                      const SizedBox(width: 30),
                      Button(
                        text: "확인",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePageView(),
                            ),
                            (route) => false,
                          );
                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   '/cats', // 이동하고자 하는 라우트 이름
                          //   (route) => false, // 모든 이전 라우트를 제거하여 초기화
                          // );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
