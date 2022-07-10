class AnimePreview {
  const AnimePreview({
    required this.id,
    required this.title,
    required this.poster,
    required this.score,
  });

  final int id;
  final AnimeTitle title;
  final String poster;
  final double score;

  factory AnimePreview.fromJson(Map<String, dynamic> json) => AnimePreview(
        id: json['id'],
        title: AnimeTitle.fromJson(json),
        poster: json['image']['original'],
        score: double.parse(json['score']),
      );
}

class AnimeTitle {
  const AnimeTitle({
    required this.en,
    required this.ru,
  });

  final String en;
  final String ru;

  factory AnimeTitle.fromJson(Map<String, dynamic> json) => AnimeTitle(
        en: json['name'],
        ru: json['russian'],
      );
}
