import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CatService with ChangeNotifier {
  CatService({
    required this.catRepository,
  });

  final CatRepository catRepository;
  List<Cat>? catItems;

  Future<List<Cat>?> get cat async {
    return catItems = await catRepository.cat;
  }

  Future<void> createCat(
    String name,
    String breed,
    double weight,
    String gender,
    DateTime birthday,
    XFile? image,
  ) async {
    String? imagePath = image?.path;

    Map<String, dynamic> catData = {
      "userId": "0xz89rl6sa5xauv",
      "name": name,
      "birthday": birthday.toString(),
      "gender": gender,
      "breed": breed,
      "weight": weight,
      "image": imagePath,
    };

    await catRepository.createCat(catData, imagePath);

    notifyListeners();
  }
}
