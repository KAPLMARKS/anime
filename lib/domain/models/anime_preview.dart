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
}

class AnimeTitle {
  const AnimeTitle({
    required this.en,
    required this.ru,
  });

  final String en;
  final String ru;
}
