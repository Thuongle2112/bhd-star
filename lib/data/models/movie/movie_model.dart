class Movie {
  final String id;
  final String title;
  final List<String> genre;
  final String duration;
  final String ageRating;
  final DateTime releaseDate;
  final String language;
  final List<String> format;
  final String description;
  final String posterUrl;
  final String bannerUrl;
  final String director;
  final List<String> cast;
  final String trailerUrl;
  final bool isNowShowing;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.duration,
    required this.ageRating,
    required this.releaseDate,
    required this.language,
    required this.format,
    required this.description,
    required this.posterUrl,
    this.bannerUrl = '',
    required this.director,
    required this.cast,
    this.trailerUrl = '',
    required this.isNowShowing,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as String,
      title: json['title'] as String,
      genre: List<String>.from(json['genre'] as List),
      duration: json['duration'] as String,
      ageRating: json['ageRating'] as String,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      language: json['language'] as String,
      format: List<String>.from(json['format'] as List),
      description: json['description'] as String,
      posterUrl: json['posterUrl'] as String,
      bannerUrl: json['bannerUrl'] as String? ?? '',
      director: json['director'] as String,
      cast: List<String>.from(json['cast'] as List),
      trailerUrl: json['trailerUrl'] as String? ?? '',
      isNowShowing: json['isNowShowing'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'genre': genre,
      'duration': duration,
      'ageRating': ageRating,
      'releaseDate': releaseDate.toIso8601String(),
      'language': language,
      'format': format,
      'description': description,
      'posterUrl': posterUrl,
      'bannerUrl': bannerUrl,
      'director': director,
      'cast': cast,
      'trailerUrl': trailerUrl,
      'isNowShowing': isNowShowing,
    };
  }

  String get genreString => genre.join(', ');

  String get formatString => format.join(', ');

  String get releaseYear => releaseDate.year.toString();

  bool get isNewRelease {
    final now = DateTime.now();
    final difference = now.difference(releaseDate).inDays;
    return difference <= 7;
  }

  List<Object?> get props => [id];
}
