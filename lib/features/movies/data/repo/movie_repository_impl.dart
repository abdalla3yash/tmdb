import 'package:tmdb/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:tmdb/features/movies/domain/repositories/movie_repository.dart';
import 'package:tmdb/features/movies/data/model/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<List<MovieModel>> getMovies(String apiKey) async {
    final response = await movieRemoteDataSource.getMovies(apiKey);
    return response ?? []; 
  }
}
