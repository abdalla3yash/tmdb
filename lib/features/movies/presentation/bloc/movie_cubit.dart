import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:tmdb/features/movies/presentation/bloc/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUseCase getMoviesUseCase;
  final String apiKey; 

  MovieCubit(this.getMoviesUseCase, this.apiKey) : super(MovieInitial());

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    try {
      final movies = await getMoviesUseCase.execute(apiKey); 
      log(movies.toList().toString()); 
      log(movies[0].toJson().toString()); 
      emit(MovieLoaded(movies));
    } catch (e) {
      log(e.toString());
      emit(MovieError('Failed to fetch movies $e'));
    }
  }
}
