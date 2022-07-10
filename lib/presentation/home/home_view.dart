import '/domain/models/anime_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_view_model.dart';

extension _HomeViewRef on WidgetRef {
  HomeViewModel get viewModel => read(homeViewModelProvider);
}

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: _AppBar(),
        body: FutureBuilder<List<AnimePreview>>(
            future: ref.viewModel.getAnimes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) =>
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          children: [
                            Text(snapshot.data![index].id.toString()),
                            Text(snapshot.data![index].title.en),
                            Text(snapshot.data![index].title.ru),
                            Text(snapshot.data![index].poster),
                            Text(snapshot.data![index].score.toString()),
                          ],
                        ),
                      ),
                );
              } else {
                return Container();
              }
            }
        )
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(ref.viewModel.title),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
