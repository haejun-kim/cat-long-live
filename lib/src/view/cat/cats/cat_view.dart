import 'package:cat_long_live/src/model/cat.dart';
import 'package:cat_long_live/src/view/base_view.dart';
import 'package:cat_long_live/src/view/cat/cats/cat_view_model.dart';
import 'package:cat_long_live/src/view/cat/cats/widget/cat_list.dart';
import 'package:cat_long_live/src/view/cat/create_update_cat/create_update_cat_view.dart';
import 'package:cat_long_live/theme/component/appbar.dart';
import 'package:cat_long_live/theme/component/day_of_week.dart';
import 'package:cat_long_live/theme/component/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CatViewModel(catService: context.read()),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: const CustomAppBar(),
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DayOfWeek(),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: FutureBuilder<List<Cat>?>(
                    future: viewModel.catItems, // FutureBuilder에 사용할 Future 설정
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final cat = snapshot.data![index];
                            return CatListView(cat: cat);
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: CustomFloatingActionButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CreateAndUpdateCatView();
                },
              ));
            },
          ),
        );
      },
    );
  }
}
