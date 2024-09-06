import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb/features/movies/data/model/movie_model.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'results')
  List<MovieModel>? movies;

  MovieResponse({this.movies});

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}
