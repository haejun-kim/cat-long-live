import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/pocketbase_service.dart';
import 'package:cat_long_live/utils/type_casting.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CatRepository {
  Future<List<Cat>> get cat async {
    final catList = await pb.collection("cats").getFullList(
          sort: "-created",
        );
    return catList.map<Cat>((cat) {
      return Cat(
        id: cat.id,
        userId: cat.data['userId'],
        name: cat.data['name'],
        birthday: DateTime.parse(cat.data['birthday']),
        gender: cat.data['gender'],
        breed: cat.data['breed'],
        weight: cat.data['weight'].toDouble(),
        catImage: cat.data['catImage'],
      );
    }).toList();
  }

  Future<void> createCat(Map<String, dynamic> body, String? imagePath) async {
    try {
      if (imagePath != null) {
        http.MultipartFile imageFile = await http.MultipartFile.fromPath(
          "catImage",
          imagePath,
        );

        await pb.collection('cats').create(
          body: body,
          files: [imageFile],
        );

        print('Cat record created successfully with image');

      } else {
        await pb.collection('cats').create(
              body: body,
            );

        print('Cat record created successfully without image');
      }
    } catch (e) {
      print('Error creating cat record: $e');
    }
  }

  Future<void> updateCat(String recordId, Map<String, dynamic> body) async {
    await pb.collection('cats').update(recordId, body: body);
  }

  Future<void> deleteCat(String recordId, Map<String, dynamic> body) async {
    await pb.collection('cats').delete(recordId);
  }
}
