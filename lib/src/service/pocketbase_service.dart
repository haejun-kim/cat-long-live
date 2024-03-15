import 'package:flutter/cupertino.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final PocketBase pb = PocketBase(dotenv.env["POCKETBASE_URL"]!);

class PocketBaseService extends ChangeNotifier {
  Future<void> getAdminAuthorization() async {
    await pb.admins.authWithPassword(
      dotenv.env["POCKETBASE_ADMIN_USER"]!,
      dotenv.env["POCKETBASE_ADMIN_PASSWORD"]!,
    );
  }
}
