import 'dart:convert';
import 'package:provider/provider.dart';
import '/domain/services/api/api_constants.dart';
import 'package:http/http.dart' as http;

import '/domain/models/anime_preview.dart';

final apiServiceProvider = Provider<ApiService>(
  create: (context) => ShikimoriService(),
);

abstract class ApiService {
  Future<List<AnimePreview>> getAnimes();
}

class ShikimoriService extends ApiService {
  List<AnimePreview> animes = <AnimePreview>[];
  @override
  Future<List<AnimePreview>> getAnimes() async {
    String url = (ApiConstants.baseUrl + ApiConstants.listAnimeEndPoint);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Iterable i = json.decode(response.body);
      animes = i.map((model) => AnimePreview.fromJson(model)).toList(growable: false);
      return animes;
    } else {
      throw Exception('Failed to load Animes');
    }
  }
}
