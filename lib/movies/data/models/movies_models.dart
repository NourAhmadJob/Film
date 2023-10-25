import 'package:movies/movies/domain/entites/movie.dart';

class MoviesModels extends Movie {
  const MoviesModels({
    required super.backdropPath,
    required super.overview,
    required super.title,
    required super.releaseDate,
    required super.id,
    required super.voteAverage,
    required super.genderIds,
  });

  factory MoviesModels.fromJson(Map<String, dynamic> json) {
    return MoviesModels(
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      title: json['title'],
      releaseDate: json['release_date'],
      id: json['id'],
      voteAverage: json['vote_average'].toDouble(),
      genderIds: List<int>.from(json['genre_ids'].map((el) => el) ),
    );
  }

  @override
  List<Object?> get props => [backdropPath , overview, title , releaseDate , id ,voteAverage,genderIds];
}
