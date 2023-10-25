import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/failure.dart';
import 'package:movies/movies/data/datasource/movies_datasource.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class MoviesReposatory implements BaseMovieReposatroy{
  final BaseMovieDataSource baseMovieDataSource ;

  MoviesReposatory({required this.baseMovieDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies()async{
    final result =  await baseMovieDataSource.getNowPlayingMoviesDataSource();
    try{
      return Right(result);
    } on ServerException catch (e){
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> popularMovies() async{
    final result = await baseMovieDataSource.popularMoviesDataSource();
    try{
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> topRatedMovies() async {
    final result = await baseMovieDataSource.topRatedMoviesDataSource();
    try{
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }

  }

}