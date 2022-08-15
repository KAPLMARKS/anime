import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/domain/models/anime_preview.dart';
import '/presentation/home/home_view_model.dart';

extension _HomeViewContext on BuildContext {
  HomeViewModel get viewModel => read();
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [homeViewModelProvider,],
      child: Builder(
        builder: (context) {
          return Scaffold(
              appBar: _AppBar(),
              body: FutureBuilder<List<AnimePreview>>(
                  future: context.viewModel.getAnimes(),
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
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.viewModel.title),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, kToolbarHeight);
}
