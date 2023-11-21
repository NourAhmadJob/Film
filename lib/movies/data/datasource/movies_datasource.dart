import 'package:dio/dio.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/error_model.dart';
import 'package:movies/core/utils/app_constance.dart';
import 'package:movies/movies/data/models/movies_models.dart';

abstract class BaseMovieDataSource{
  Future<List<MoviesModels>> getNowPlayingMoviesDataSource();
  Future<List<MoviesModels>> popularMoviesDataSource();
  Future<List<MoviesModels>> topRatedMoviesDataSource();
}

class MoviesDataSource extends BaseMovieDataSource {
  @override
  Future<List<MoviesModels>> getNowPlayingMoviesDataSource() async{
    final response = await Dio().get(ApiConstance.getNowPlayingUrl);

    if(response.statusCode == 200) {
      return List<MoviesModels>.from( (response.data['results'] as List).map( (el) => MoviesModels.fromJson(el))    );
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModels>> popularMoviesDataSource() async{
    final response = await Dio().get(ApiConstance.getPopularMovieUrl);
    if(response.statusCode == 200){
      return List<MoviesModels>.from( (response.data['results'] as List).map((el) => MoviesModels.fromJson(el))   );
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModels>> topRatedMoviesDataSource() async{
    final response = await Dio().get(ApiConstance.getTopRatedMovieUrl);
    if(response.statusCode == 200){
      return List<MoviesModels>.from((response.data['results'] as List).map((el) => MoviesModels.fromJson(el)));
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }
}