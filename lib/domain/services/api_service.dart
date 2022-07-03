import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '/domain/models/anime_preview.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ShikimoriService());

abstract class ApiService {
  Future<List<AnimePreview>> getAnimes();
}

class ShikimoriService extends ApiService {
  @override
  Future<List<AnimePreview>> getAnimes() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => [
        const AnimePreview(
          id: 1,
          title: AnimeTitle(en: 'Pisya', ru: 'Пися'),
          poster:
              'https://i.scdn.co/image/ab67616d00001e0230e501777f85b35f983ce6b7',
          score: .25,
        ),
        const AnimePreview(
          id: 2,
          title: AnimeTitle(en: 'Pisyun', ru: 'Писюн'),
          poster:
              'https://i.siteapi.org/LMPXz7wz2Qb3W7yRTCClkRbJ4lI=/fit-in/330x/center/top/filters:fill(transparent):format(png)/e973f7e7eb894c5.s.siteapi.org/img/fsme8joizs8ossccssc4sgw0soscw0',
          score: 10,
        ),
      ],
    );
  }
}
