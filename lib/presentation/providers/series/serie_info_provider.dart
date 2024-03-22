import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/providers/series/series_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final serieInfoProvider = StateNotifierProvider<SerieMapNotifier, Map<String, Serie>>((ref) {
  final serieRepository = ref.watch( seriesRepositoryProvider );
  return SerieMapNotifier(getSerie: serieRepository.getSerieById );
});


/*
  {
    '505642': Movie(),
    '505643': Movie(),
    '505645': Movie(),
    '501231': Movie(),
  }
*/

typedef GetSerieCallback = Future<Serie>Function(String serieId);

class SerieMapNotifier extends StateNotifier<Map<String,Serie>> {

  final GetMovieCallback getSerie;

  SerieMapNotifier({
    required this.getSerie,
  }): super({});


  Future<void> loadSerie( String serieId ) async {
    if ( state[serieId] != null ) return;
   // print("Cargando movie $movieId");
    final serie = await getSerie( serieId );
    state = { ...state, serieId: serie };
  }

}