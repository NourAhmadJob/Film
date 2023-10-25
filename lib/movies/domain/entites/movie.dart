import 'package:equatable/equatable.dart';

class Movie  extends Equatable{
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String title;
  final int id;
  final double voteAverage;
  final List<int> genderIds;

  const Movie({
    required this.backdropPath,
    required this.overview,
    required this.title,
    required this.releaseDate,
    required this.id,
    required this.voteAverage,
    required this.genderIds
  });

  @override
  // TODO: implement props
  List<Object?> get props => [backdropPath , overview, title , releaseDate , id ,voteAverage,genderIds];

  /// Do the equatable data
}
