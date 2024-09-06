import 'package:tmdb/features/movies/data/model/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getMovies(String apiKey);
}
