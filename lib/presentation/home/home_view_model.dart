import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '/domain/models/anime_preview.dart';
import '/domain/services/api/api_service.dart';

final homeViewModelProvider = Provider<HomeViewModel>(
  create: (context) {
    final homeViewModel = HomeViewModelImpl(context.read());
    return homeViewModel;
  },
);

abstract class HomeViewModel {
  String get title;

  ValueListenable<int> get animesCount;

  AnimePreview getAnimePreview(int index);

  Future<List<AnimePreview>> getAnimes();
}

class HomeViewModelImpl implements HomeViewModel {
  HomeViewModelImpl(this._apiService) {
    _loadAnimes();
  }

  @override
  final String title = 'Главная';

  @override
  final ValueNotifier<int> animesCount = ValueNotifier(0);
  final List<AnimePreview> _animes = [];
  final ApiService _apiService;

  @override
  AnimePreview getAnimePreview(int index) {
    return _animes[index];
  }

  Future<void> _loadAnimes() async {
    final newData = await _apiService.getAnimes();
    _animes.addAll(newData);
    animesCount.value = _animes.length;
  }

  @override
  Future<List<AnimePreview>> getAnimes() {
    return _apiService.getAnimes();
  }
}
