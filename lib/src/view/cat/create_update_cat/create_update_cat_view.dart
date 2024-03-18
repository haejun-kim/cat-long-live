import 'package:cat_long_live/src/service/cat_service.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/cat/cats/cat_view_model.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/create_update_cat_view_model.dart';
import 'package:cat_long_live/theme/component/image_upload.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/widget/select_gender.dart';
import 'package:cat_long_live/src/view/home/home_view.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:cat_long_live/theme/component/date_picker.dart';
import 'package:cat_long_live/theme/component/hide_keyboard.dart';
import 'package:cat_long_live/theme/component/input_field.dart';
import 'package:cat_long_live/theme/component/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAndUpdateCatView extends StatefulWidget {
  const CreateAndUpdateCatView({super.key});

  @override
  State<CreateAndUpdateCatView> createState() => _CreateAndUpdateCatViewState();
}

class _CreateAndUpdateCatViewState extends State<CreateAndUpdateCatView> {
  final double sizedBoxHeight = 35;

  late final CatViewModel catViewModel =
      CatViewModel(catService: context.read<CatService>());

  @override
  Widget build(BuildContext context) {
    return HideKeyboard(
      child: BaseView(
        viewModel: catViewModel,
        builder: (context, viewModel) => Scaffold(
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

                    InputField(
                      labelText: "냥이 이름",
                      hint: "이름을 입력해주세요.",
                      controller: viewModel.nameController,
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),

                    DatePicker(
                      onBirthdaySelected: (birthday) {
                        setState(() {
                          viewModel.selectedBirthday = birthday;
                        });
                      },
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),

                    Text("성별", style: context.typo.subtitle1),
                    SelectGender(
                      onGenderSelected: (gender) {
                        setState(() {
                          viewModel.selectedGender = gender;
                        });
                      },
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),

                    InputField(
                      labelText: "품종",
                      hint: "품종을 입력해주세요.",
                      controller: viewModel.breedController,
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),

                    InputField(
                      labelText: "몸무게",
                      hint: "몸무게(kg)를 입력해주세요.",
                      controller: viewModel.weightController,
                    ),
                    SizedBox(
                      height: sizedBoxHeight,
                    ),

                    // Image Upload
                    Text("이미지 등록", style: context.typo.subtitle1),
                    const SizedBox(height: 15),
                    ImageUpload(
                      onSelectedImage: (image) {
                        viewModel.selectedImage = image;
                      },
                      onDeleteImage: () {
                        viewModel.selectedImage = null;
                      },
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
                        const SizedBox(width: 30),
                        Button(
                          text: "확인",
                          onPressed: () async {
                            if (viewModel.nameController != "" &&
                                viewModel.selectedGender != "") {
                              await viewModel.createCat();

                              if (context.mounted) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePageView(),
                                  ),
                                  (route) => false,
                                );
                              }
                            } else {
                              ToastUtils.showToast("이름과 성별을 반드시 선택해주세요.");
                            }
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
      ),
    );
  }
}
