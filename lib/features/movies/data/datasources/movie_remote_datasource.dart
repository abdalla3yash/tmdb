import 'dart:developer';

import 'package:tmdb/features/movies/data/model/movie_model.dart';
import 'package:tmdb/core/service/api_service.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies(String apiKey);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieModel>> getMovies(String apiKey) async {
    try {
      final response = await apiService.getMovie(apiKey);
      log(response.toString()); 
      return response.movies ?? []; 
    } catch (e) {
      log('Error fetching movies: $e');
      return []; 
    }
  }
}
