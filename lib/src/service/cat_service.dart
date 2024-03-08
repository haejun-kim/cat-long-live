import 'package:cat_long_live/src/model/cat.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CatService with ChangeNotifier {
  List<Cat> catImages = const [];

  CatService() {
    getRandomCatImages();
  }

  // 랜덤 고양이 사진 API 호출
  void getRandomCatImages() async {
    var result = await Dio().get(
      "https://api.thecatapi.com/v1/images/search?limit=2&mime_types=jpg",
    );

    catImages = result.data.map<Cat>((map) {
      return Cat(imageUrl: map["url"]);
    }).toList();

    notifyListeners();
  }

}
