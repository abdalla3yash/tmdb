import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:tmdb/features/movies/data/datasources/movie_remote_datasource.dart';
import 'package:tmdb/features/movies/data/repo/movie_repository_impl.dart';
import 'package:tmdb/features/movies/domain/repositories/movie_repository.dart';
import 'package:tmdb/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:tmdb/features/movies/presentation/bloc/movie_cubit.dart';
import 'package:tmdb/injection.config.dart';
import 'package:tmdb/core/service/api_service.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(); 

  @singleton
  ApiService get apiService => ApiService(dio);

  @singleton
  MovieRemoteDataSource get movieRemoteDataSource => MovieRemoteDataSourceImpl(apiService);

  @singleton
  MovieRepository get movieRepository => MovieRepositoryImpl(movieRemoteDataSource);
 
  @singleton
  GetMoviesUseCase get getMoviesUseCase => GetMoviesUseCase(movieRepository);
  
  @singleton
  MovieCubit get movieBloc => MovieCubit(getMoviesUseCase,'8b08a62719e420b121165fd940464c50');
}


final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
