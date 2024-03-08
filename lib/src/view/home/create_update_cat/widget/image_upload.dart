import 'dart:io';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// TODO: 추후 Service, ViewModel로 분리할 것
/// 현재는 서비스로 분리하면 정상 동작을 확인하기 쉽지 않아서 일을 두번해야함.
class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage() async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? SizedBox(
            height: 120,
            width: 120,
            child: Image.file(
              File(_image!.path),
              fit: BoxFit.fill,
            ),
          )
        : SizedBox(
            height: 120,
            width: 120,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: AssetIcon(
                "material-add-circle-outline",
                color: context.color.primary,
              ),
            ),
          );
  }

  Widget _buildDeleteButton() {
    return Positioned(
      left: 92,
      child: _image != null
          ? Button(
              icon: "material-delete",
              size: ButtonSize.small,
              onPressed: () {
                setState(() {
                  _image = null;
                });
              },
            )
          : const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage();
      },
      child: Stack(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            padding: const EdgeInsets.all(6),
            dashPattern: const [8, 4],
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: _buildPhotoArea(),
            ),
          ),
          _buildDeleteButton(),
        ],
      ),
    );
  }
}
