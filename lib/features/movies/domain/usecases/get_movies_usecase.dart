import 'package:tmdb/features/movies/domain/repositories/movie_repository.dart';
import 'package:tmdb/features/movies/data/model/movie_model.dart';

class GetMoviesUseCase {
  final MovieRepository movieRepository;
  GetMoviesUseCase(this.movieRepository);

  Future<List<MovieModel>> execute(String apiKey) => movieRepository.getMovies(apiKey);
}
