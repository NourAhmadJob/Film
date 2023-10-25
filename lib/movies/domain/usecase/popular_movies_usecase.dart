import 'package:dartz/dartz.dart';
import 'package:movies/core/network/failure.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class PopularMoviesUseCase {
  final BaseMovieReposatroy baseMovieReposatroy;

  PopularMoviesUseCase({required this.baseMovieReposatroy});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieReposatroy.popularMovies();
  }
}