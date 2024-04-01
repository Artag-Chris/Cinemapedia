import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/widgets.dart';
import 'package:cinemapedia/presentation/widgets/series/series_horizontal_listview.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';




class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedSeriesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    final topRatedSeries = ref.watch(topRatedSeriesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: moviesSlideshow),
            MovieHorizontalListView(
              movie: nowPlayingMovies,
              title: "En cines",
              subtitle: "Lunes 20",
              loadNextPage: () {
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: upcomingMovies,
              title: "Proximamente",
              subtitle: "este mes",
              loadNextPage: () {
                ref.read(upcomingMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: popularMovies,
              title: "Populares",
              // subtitle: "este mes",
              loadNextPage: () {
                ref.read(popularMoviesProvider.notifier).loadNextPage();
              },
            ),
            MovieHorizontalListView(
              movie: topRatedMovies,
              title: "Mejor valoradas",
              subtitle: "desde siempre",
              loadNextPage: () {
                ref.read(topRatedMoviesProvider.notifier).loadNextPage();
              },
            ),
            SeriesHorizontalListView(
              series: topRatedSeries,
              name: "Mejores Series",
              overview: "desde siempre",
              loadNextPage: () {
                ref.read(topRatedSeriesProvider.notifier).loadNextPage();
              },
            ),
            const SizedBox(

              height: 50,
            )
          ],
        );
      }, childCount: 1))
    ]);
  }
}
