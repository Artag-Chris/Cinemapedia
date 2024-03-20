import 'package:cinemapedia/domain/entities/series.dart';
import 'package:cinemapedia/presentation/providers/series/series_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//nowPlayingMoviesProvider
final topRatedSeriesProvider =
    StateNotifierProvider<SeriesNotifier, List<Series>>((ref) {
  final fetchMoreSeries =
      ref.watch(seriesRepositoryProvider).getPopularSeries;

  return SeriesNotifier(fectMoreSeries: fetchMoreSeries);
});

typedef SeriesCallback = Future<List<Series>> Function({int page});

class SeriesNotifier extends StateNotifier<List<Series>> {
  int currentPage = 0;
  bool isloading = false;
  SeriesCallback fectMoreSeries;

  SeriesNotifier({required this.fectMoreSeries}) : super([]);

  Future<void> loadNextPage() async {
    if (isloading) return;

    isloading = true;
    // print("Cargando pagina $currentPage");
    currentPage++;
    final List<Series> series = await fectMoreSeries(page: currentPage);
    state = [...state, ...series];
    await Future.delayed(const Duration(milliseconds: 300));
    isloading = false;
  }
}
