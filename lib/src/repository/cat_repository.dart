import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/pocketbase_service.dart';
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
      } else {
        await pb.collection('cats').create(
              body: body,
            );
      }
    } catch (e) {
      print('Error creating cat record: $e');
    }
  }

  Future<void> updateCat(
      String recordId, Map<String, dynamic> body, String? imagePath) async {
    try {
      /// 변경하고자 하는 이미지가 있을 경우
      if (imagePath != null) {
        http.MultipartFile imageFile = await http.MultipartFile.fromPath(
          "catImage",
          imagePath,
        );

        await pb.collection('cats').update(
          recordId,
          body: body,
          files: [imageFile],
        );
        /// 이미지 변경 없이 다른 데이터만 변경할 경우
      } else {
        await pb.collection('cats').update(
              recordId,
              body: body,
            );
      }
    } catch (e) {
      print('Error creating cat record: $e');
    }
  }

  Future<void> deleteCat(String recordId) async {
    await pb.collection('cats').delete(recordId);
  }
}

