import 'package:anime_nya_school_uwu/domain/models/anime_preview.dart';
import 'package:anime_nya_school_uwu/domain/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = Provider.autoDispose<HomeViewModel>((ref) {
  final homeViewModel = HomeViewModelImpl(ref.read(apiServiceProvider));
  return homeViewModel;
});

abstract class HomeViewModel {
  String get title;

  ValueListenable<int> get animesCount;

  AnimePreview getAnimePreview(int index);
}

class HomeViewModelImpl implements HomeViewModel {
  HomeViewModelImpl(this._apiService){
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
}
