import 'package:cat_long_live/src/service/pocketbase_service.dart';
import 'package:pocketbase/pocketbase.dart';

class AccountRepository {
  Future<void> getUserList() async {
    try {
      final resultList = await pb.collection('users').getList();

      print('Result List: $resultList');

    } catch (e) {
      print('Error fetching user list: $e');
    }
  }

  Future<void> createAccount(Map<String, dynamic> body) async {
    try {
      final record = await pb.collection('users').create(body: body);
      print(record);
    } catch (e) {
      print("sign up error: $e");
    }
  }

  Future<RecordAuth> signIn(Map<String, dynamic> body) async {
    final authData = await pb.collection('users').authWithPassword(
          body["email"],
          body["password"],
        );
    print(authData);
    return authData;
  }
}
