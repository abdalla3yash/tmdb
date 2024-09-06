import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/features/movies/presentation/bloc/movie_cubit.dart';
import 'package:tmdb/injection.dart';
import 'package:tmdb/features/movies/presentation/pages/movies_screen.dart';

void main() {
  configureDependencies(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<MovieCubit>(),
        child: const MoviesScreen(),
      ),
    );
  }
}
