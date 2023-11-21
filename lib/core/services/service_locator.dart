import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasource/movies_datasource.dart';
import 'package:movies/movies/data/repository/movies_reposatory.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_Bloc/bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Todo: Bloc
    sl.registerFactory<MovieBloc>(() => MovieBloc(sl(), sl(), sl()));

    ///TODO : REPOSATORY


    ///Todo :  DATA_SOURCE
    sl.registerLazySingleton<BaseMovieDataSource>(() => MoviesDataSource());

    ///Todo :  USE_CASE
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMovieReposatroy: sl()));
    sl.registerLazySingleton(
        () => PopularMoviesUseCase(baseMovieReposatroy: sl()));
    sl.registerLazySingleton(
        () => TopRatedMoviesUseCase(baseMovieReposatroy: sl()));

    /// TODO :
  }
}
