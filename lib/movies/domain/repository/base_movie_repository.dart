import 'package:dartz/dartz.dart';
import 'package:movies/core/network/failure.dart';
import 'package:movies/movies/domain/entites/movie.dart';

abstract class BaseMovieReposatroy {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> popularMovies();
  Future<Either<Failure, List<Movie>>> topRatedMovies();
}