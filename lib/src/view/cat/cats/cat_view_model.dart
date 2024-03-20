import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/cat_service.dart';
import 'package:cat_long_live/src/view/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CatViewModel extends BaseViewModel {
  CatViewModel({required this.catService}) {
    catService.addListener(notifyListeners);
  }

  final CatService catService;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  String selectedGender = "";
  DateTime selectedBirthday = DateTime.now();
  XFile? selectedImage;

  @override
  void dispose() {
    catService.removeListener(notifyListeners);
    super.dispose();
  }

  Future<List<Cat>?> get catItems async {
    return await catService.cat;
  }

  Future<void> createCat() async {
    String name = nameController.text;
    String breed = breedController.text;
    double weight = double.parse(weightController.text);
    String gender = selectedGender;
    DateTime birthday = selectedBirthday;
    XFile? image = selectedImage;

    if (gender == "남") {
      gender = "male";
    } else {
      gender = "female";
    }

    // 서비스에 데이터 추가 요청
    await catService.createCat(
      name,
      breed,
      weight,
      gender,
      birthday,
      image,
    );
  }

  Future<void> updateCat(String recordId) async {
    String name = nameController.text;
    String breed = breedController.text;
    double weight = double.parse(weightController.text);
    String gender = selectedGender;
    DateTime birthday = selectedBirthday;
    XFile? image = selectedImage;

    if (gender == "남") {
      gender = "male";
    } else {
      gender = "female";
    }

    await catService.updateCat(
      recordId,
      name,
      breed,
      weight,
      gender,
      birthday,
      image,
    );
  }

  Future<void> deleteCat(String recordId) async {
    await catService.deleteCat(recordId);
  }
}
