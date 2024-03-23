import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/domain/entities/series.dart';

abstract class SeriesRepository{

  Future<List<Series>> getPopularSeries({int page = 1});

  Future<List<Series>> getSeriesByGenre({required int genreId, int page = 1});

  Future<Serie> getSerieById(String id);
}