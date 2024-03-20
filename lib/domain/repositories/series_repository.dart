import 'package:cinemapedia/domain/entities/series.dart';

abstract class SeriesRepository{

  Future<List<Series>> getPopularSeries({int page = 1});
}