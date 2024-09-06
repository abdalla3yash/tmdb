import 'package:flutter/material.dart';
import 'package:tmdb/core/resources/app_assets.dart';
import 'package:tmdb/features/movies/data/model/movie_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieModel movie;
  MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    _controller.addListener(_onChanged);
    super.initState();
  }

void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _anchor() => _animateSheet(sheet.snapSizes!.last);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) => _controller.animateTo(size, duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

    DraggableScrollableSheet get sheet => (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double sharedValue = constraints.maxHeight * 0.2;

        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height *0.85,
                child: FadeInImage.assetNetwork(
                  placeholder: AppImages.imgPlaceHolder,
                  image:"https://image.tmdb.org/t/p/w500${widget.movie.posterPath}",
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                ),
              ),
            
            DraggableScrollableSheet(
              key: _sheet,
              initialChildSize: sharedValue / constraints.maxHeight,
              maxChildSize: 1,
              minChildSize: 0,
              expand: true,
              snap: true,
              snapSizes: [
                sharedValue / constraints.maxHeight,
                0.5,
              ],
              controller: _controller,
            builder: (BuildContext context, ScrollController scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                     const SliverToBoxAdapter(
                      child: Divider(indent: 150, endIndent: 150, thickness: 2),
                    ),
                     SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.movie.title.toString(), style: Theme.of(context).textTheme.bodyLarge!),
                            const SizedBox(height: 8),
                            Text('Release Date: ', style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 4),
                            Text(widget.movie.releaseDate.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 74, 73, 73))),
                            const SizedBox(height: 8),
                            Text('Genre: ', style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 4),
                            Text(widget.movie.genreIds.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 74, 73, 73))),
                            const SizedBox(height: 8),
                            Text('Vote: ', style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 4),
                            Text(widget.movie.voteCount.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 74, 73, 73))),
                            const SizedBox(height: 12),
                            Text('Description ', style: Theme.of(context).textTheme.bodyLarge),
                            const SizedBox(height: 4),
                            Text(widget.movie.overview.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 74, 73, 73))),
                            const SizedBox(height: 8),

                            Text(widget.movie.releaseDate.toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12)),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('Vote: ', style: Theme.of(context).textTheme.bodyLarge),
                                    Text(widget.movie.voteCount.toString(), style: Theme.of(context).textTheme.bodyLarge),
                                  ],
                                ),
                                Text(widget.movie.voteAverage.toString(), style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey)),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
            
            ],
          ),
        
        );
      },
    );
  }
}
