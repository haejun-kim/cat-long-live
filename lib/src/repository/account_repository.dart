import 'package:cat_long_live/src/service/pocketbase_service.dart';

class AccountRepository {
  Future<void> getUserList() async {
    try {
      final resultList = await pb.collection('users').getList();

      print('Result List: $resultList');

      // 여기에 resultList를 분석하고 데이터를 처리하는 로직을 추가하세요.
    } catch (e) {
      print('Error fetching user list: $e');
    }
  }

  Future<void> createAccount(Map<String, dynamic> body) async {
    final record = await pb.collection('users').create(body: body);
    print(record);
  }
}
