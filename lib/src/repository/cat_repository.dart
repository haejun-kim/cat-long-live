import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/pocketbase_service.dart';

class CatRepository {
  Future<List<Cat>> get cat async {
    final catList = await pb.collection("cats").getFullList(
          sort: "-created",
        );
    return catList.map<Cat>((cat) {
      return Cat(
        // id: data['id'] as String,
        id: cat.id,
        userId: cat.data['userId'],
        name: cat.data['name'],
        birthday: DateTime.parse(cat.data['birthday']),
        gender: cat.data['gender'],
        breed: cat.data['breed'],
        weight: double.tryParse(cat.data['weight'] ?? ''),
        catImage: cat.data['catImage'],
      );
    }).toList();
  }

  Future<void> createCat(Map<String, dynamic> body) async {
    await pb.collection('cats').create(body: body);
  }

  Future<void> updateCat(String recordId, Map<String, dynamic> body) async {
    await pb.collection('cats').update(recordId, body: body);
  }

  Future<void> deleteCat(String recordId, Map<String, dynamic> body) async {
    await pb.collection('cats').delete(recordId);
  }
}
