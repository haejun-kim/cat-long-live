import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CatListView extends StatelessWidget {
  const CatListView({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.color.hint,
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.all(16), // 원하는 패딩값 설정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cat.catImage != ""
              ? CachedNetworkImage(
                  imageUrl: "${dotenv.env["POCKETBASE_URL"]}"
                      "${dotenv.env["IMAGE_DOWNLOAD_URL"]}${cat.id}/"
                      "${cat.catImage}?thumb="
                      "${dotenv.env["IMAGE_THUMBNAIL"]}",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                )

              /// 등록한 이미지가 없을 때
              : Image.asset(
                  "assets/images/null_cat.jpeg",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
          const SizedBox(height: 8),
          Text(cat.name, style: context.typo.headline2),
          Text(_calculateDaysSinceBirthday(cat.birthday),
              style: context.typo.headline6),
        ],
      ),
    );
  }

  String _calculateDaysSinceBirthday(DateTime birthday) {
    return "D + ${DateTime.now().difference(birthday).inDays + 1}";
  }
}
