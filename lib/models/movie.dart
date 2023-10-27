class Movie {
  final String backdropPath;
  //final List<String> genres;
  final String id;
  final String uuid;
  final String imdbID;
  final String originalLanguage;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;
  final String runtime;
  //final List<String> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final String voteAverage;

  const Movie({
    required this.backdropPath,
    //required this.genres,
    required this.id,
    required this.uuid,
    required this.imdbID,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    //required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'] ?? '',
      //genres: json['genres'] ?? [''],
      id: json['id']?.toString() ?? '',
      uuid: json['uuid']?.toString() ?? '',
      imdbID: json['imdb_id'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      overview: json['overview'] ?? '',
      popularity: json['popularity']?.toString() ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      runtime: json['runtime']?.toString() ?? '',
      //spokenLanguages: json['spoken_languages'] ?? [''],
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      voteAverage: json['vote_average']?.toString() ?? '',
    );
  }
}
