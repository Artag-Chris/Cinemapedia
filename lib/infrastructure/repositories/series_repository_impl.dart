import 'package:cinemapedia/domain/datasources/series_datasource.dart';
import 'package:cinemapedia/domain/entities/series.dart';
import 'package:cinemapedia/domain/repositories/series_repository.dart';

class SeriesRepositoryImpl extends SeriesRepository {

  final SeriesDatasource datasource;

  SeriesRepositoryImpl(this.datasource);

  @override
  Future<List<Series>> getPopularSeries({int page = 1}){
return datasource.getPopularSeries(page: page);
  }

} 