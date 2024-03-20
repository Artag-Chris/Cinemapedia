

import 'package:cinemapedia/infrastructure/repositories/series_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/series_moviedb_datasource.dart';


//este provider es inmutable
final seriesRepositoryProvider = Provider((ref) {
  return SeriesRepositoryImpl(SeriesMoviedbDatasource());

});