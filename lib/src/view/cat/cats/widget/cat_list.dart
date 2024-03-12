import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class CatListView extends StatelessWidget {
  const CatListView({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.network(
            cat.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text("냥이1", style: context.typo.headline2),
          Text("D + 2000", style: context.typo.headline6),
        ],
      ),
    );
  }
}
