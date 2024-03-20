import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/repository/cat_repository.dart';
import 'package:cat_long_live/src/service/pocketbase_service.dart';
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
      "userId": pb.authStore.model.id,
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


  Future<void> updateCat(
      String recordId,
      String name,
      String breed,
      double weight,
      String gender,
      DateTime birthday,
      XFile? image,
      ) async {
    String? imagePath = image?.path;

    Map<String, dynamic> catData = {
      "id": recordId,
      "userId": pb.authStore.model.id,
      "name": name,
      "birthday": birthday.toString(),
      "gender": gender,
      "breed": breed,
      "weight": weight,
      "image": imagePath,
    };

    await catRepository.updateCat(recordId, catData, imagePath);

    notifyListeners();
  }

  Future<void> deleteCat(String recordId) async {
    await catRepository.deleteCat(recordId);
    notifyListeners();
  }
}
