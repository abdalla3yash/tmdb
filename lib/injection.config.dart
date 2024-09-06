// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tmdb/core/service/api_service.dart' as _i4;
import 'package:tmdb/features/movies/data/datasources/movie_remote_datasource.dart'
    as _i5;
import 'package:tmdb/features/movies/domain/repositories/movie_repository.dart'
    as _i6;
import 'package:tmdb/features/movies/domain/usecases/get_movies_usecase.dart'
    as _i7;
import 'package:tmdb/features/movies/presentation/bloc/movie_cubit.dart' as _i8;
import 'package:tmdb/injection.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.ApiService>(() => registerModule.apiService);
    gh.singleton<_i5.MovieRemoteDataSource>(
        () => registerModule.movieRemoteDataSource);
    gh.singleton<_i6.MovieRepository>(() => registerModule.movieRepository);
    gh.singleton<_i7.GetMoviesUseCase>(() => registerModule.getMoviesUseCase);
    gh.singleton<_i8.MovieCubit>(() => registerModule.movieBloc);
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
