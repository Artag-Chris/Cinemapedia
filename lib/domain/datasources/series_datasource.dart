import 'package:cinemapedia/domain/entities/series.dart';

abstract class SeriesDatasource{
  Future<List<Series>> getPopularSeries({int page = 1});
  
}