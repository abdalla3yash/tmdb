import 'package:flutter/material.dart';
import 'package:tmdb/core/resources/app_assets.dart';
import 'package:tmdb/core/utils/tap_effect.dart';
import 'package:tmdb/features/movies/data/model/movie_model.dart';
import 'package:tmdb/features/movies/presentation/pages/movie_details_screen.dart';

class MovieWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieWidget({super.key,required this.movie});

  @override
  Widget build(BuildContext context) {
    return TapEffect(
      onClick: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: movie))),
      child: Card(
        elevation: 4.0,
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: 150,
                    child: FadeInImage.assetNetwork(
                      placeholder: AppImages.imgPlaceHolder,
                      image:"https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black.withOpacity(0.4),borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Row(
                        children: [
                          const Icon(Icons.star_border_purple500,color: Colors.amberAccent,size: 12,),
                          Text(movie.voteAverage!.toStringAsFixed(1), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.w700)),
                        ],
                      )),
                    ),
                  ),
                ],
              )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title ?? 'No Title',
                maxLines: 1,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                movie.overview ?? 'No Overview',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                movie.releaseDate ??"",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}