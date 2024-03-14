import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase(dotenv.env["POCKETBASE_URL"]!);

class AccountRepository {
  Future<void> getAdminAuthorization() async {
    await pb.admins.authWithPassword(
      dotenv.env["POCKETBASE_ADMIN_USER"]!,
      dotenv.env["POCKETBASE_ADMIN_PASSWORD"]!,
    );
  }

  Future<void> getUserList() async {
    getAdminAuthorization();
    try {
      final resultList = await pb.collection('users').getList(
            page: 1,
            perPage: 50,
          );

      print('Result List: $resultList');

      // 여기에 resultList를 분석하고 데이터를 처리하는 로직을 추가하세요.
    } catch (e) {
      print('Error fetching user list: $e');
    }
  }
}
