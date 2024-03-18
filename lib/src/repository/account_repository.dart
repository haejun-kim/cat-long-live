import 'package:cat_long_live/src/service/pocketbase_service.dart';
import 'package:pocketbase/pocketbase.dart';

class AccountRepository {
  final String userId = "";

  Future<RecordModel> createAccount(Map<String, dynamic> body) async {
    final record = await pb.collection('users').create(body: body);
    return record;
  }

  Future<void> duplicatedEmailCheck(String email) async {
    await pb.collection('users').requestVerification(email);
  }

  Future<RecordAuth> signIn(Map<String, dynamic> body) async {
    final authData = await pb.collection('users').authWithPassword(
          body["email"],
          body["password"],
        );
    return authData;
  }
}
