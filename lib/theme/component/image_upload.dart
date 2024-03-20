import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:cat_long_live/theme/component/asset_icon.dart';
import 'package:cat_long_live/theme/component/button/button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';

/// TODO: 추후 Service, ViewModel로 분리할 것
/// 현재는 서비스로 분리하면 정상 동작을 확인하기 쉽지 않아서 일을 두번해야함.
class ImageUpload extends StatefulWidget {
  const ImageUpload({
    super.key,
    this.cat,
    this.onSelectedImage,
    required this.onDeleteImage,
  });

  final Cat? cat;
  final Function(XFile)? onSelectedImage;
  final Function() onDeleteImage;

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  bool initStateRunning = false;
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  @override
  void initState() {
    super.initState();
    if (widget.cat?.catImage != null && widget.cat?.catImage != "") {
      _image = XFile(widget.cat!.catImage!);
      initStateRunning = true;
    }
  }

  //이미지를 가져오는 함수
  Future getImage() async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
        widget.onSelectedImage!(_image!);
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

  SizedBox _buildCachedNetworkImage() {
    initStateRunning = false;
    return SizedBox(
      height: 120,
      width: 120,
      child: CachedNetworkImage(
        imageUrl: "${dotenv.env["POCKETBASE_URL"]}"
            "${dotenv.env["IMAGE_DOWNLOAD_URL"]}${widget.cat!.id}/"
            "${_image!.path}?thumb="
            "${dotenv.env["IMAGE_THUMBNAIL"]}",
        fit: BoxFit.fill,
      ),
    );
  }

  void deleteImage() {
    setState(() {
      _image = null;
      widget.onDeleteImage();
    });
  }

  Widget _buildDeleteButton() {
    return Positioned(
      left: 92,
      child: _image != null
          ? Button(
              icon: "material-delete",
              size: ButtonSize.small,
              onPressed: deleteImage,
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
              child: initStateRunning == false
                  ? _buildPhotoArea()
                  : _buildCachedNetworkImage(),
            ),
          ),
          _buildDeleteButton(),
        ],
      ),
    );
  }
}
