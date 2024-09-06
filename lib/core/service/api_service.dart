import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tmdb/core/wrapper/movie_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('movie/popular')
  Future<MovieResponse> getMovie(@Query('api_key') String apiKey);
}
