class ApiConstance{
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String apiKey = "b9d127cbc92964a434d3d0b19017bfa1";

  // static String geteNowPlayingUrl = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static String getNowPlayingUrl = '$baseUrl/movie/now_playing?api_key=$apiKey';

  static String getPopularMovieUrl = '$baseUrl/movie/popular?api_key=$apiKey';

  static String getTopRatedMovieUrl = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path' ;
}