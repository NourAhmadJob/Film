import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_Bloc/event.dart';
import 'package:movies/movies/presentation/controller/movie_Bloc/state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesStates> {
  MovieBloc(this.getNowPlayingMoviesUseCase, this.popularMoviesUseCase,
      this.topRatedMoviesUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingEvent);
    on<PopularMoviesEvent>(_getPopularMoviesEvent);
    on<TopRatedMoviesEvent>(_getTopRatedEvent);
  }

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final PopularMoviesUseCase popularMoviesUseCase;
  final TopRatedMoviesUseCase topRatedMoviesUseCase;

  FutureOr<void> _getNowPlayingEvent(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute();
    result.fold(
      (l) => emit(state.copyWith(
          nowPlayingMessage: l.message, nowPlayingState: RequestState.error)),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMoviesEvent(
      PopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await popularMoviesUseCase.execute();

    result.fold(
      (l) => emit(state.copyWith(
        popularMessage: l.message,
        popularState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          popularState: RequestState.loaded,
          popularMovies: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedEvent(
      TopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await topRatedMoviesUseCase.execute();

    result.fold(
      (l) => emit(state.copyWith(
          topRatedMessage: l.message, topRatedState: RequestState.error)),
      (r) => emit(state.copyWith(
          topRatedMovies: r, topRatedState: RequestState.loaded)),
    );
  }
}
