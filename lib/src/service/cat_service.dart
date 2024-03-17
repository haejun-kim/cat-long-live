import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/repository/cat_repository.dart';
import 'package:flutter/material.dart';

class CatService with ChangeNotifier {
  CatService({
    required this.catRepository,
  });

  final CatRepository catRepository;
  List<Cat>? catItems;

  Future<List<Cat>?> get cat async {
    return catItems = await catRepository.cat;
  }
}
