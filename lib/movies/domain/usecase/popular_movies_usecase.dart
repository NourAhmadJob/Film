import 'package:dartz/dartz.dart';
import 'package:movies/core/network/failure.dart';
import 'package:movies/core/parameter/no_data_parameter.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class PopularMoviesUseCase extends BaseUseCase<List<Movie> , NoParameter>{
  final BaseMovieReposatroy baseMovieReposatroy;

  PopularMoviesUseCase({required this.baseMovieReposatroy});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMovieReposatroy.popularMovies();
  }
}