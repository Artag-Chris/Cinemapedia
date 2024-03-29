import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/series_datasource.dart';
import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/infrastructure/mappers/serie_mapper.dart';
import 'package:cinemapedia/infrastructure/mappers/series_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/serie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/series_response.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/series.dart';

class SeriesMoviedbDatasource extends SeriesDatasource {
    final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));
 
  
  @override
  Future<List<Series>> getSeriesByGenre({required int genreId, int page = 1})async {

    
return[];
}

  @override
  Future<List<Series>> getPopularSeries({int page = 1})async {
final response= await dio.get("/tv/top_rated", queryParameters: {"page": page});

final seriesDbResponse = SeriesResponse.fromJson(response.data);

List <Series> series = seriesDbResponse.results.map((result) => SeriesMapper.seriesToEntity(result)).toList();
return series;
  }

   @override
  Future<Serie> getSerieById(String id) async {
    final response = await dio.get(
      "/tv/$id",
    );
    if (response.statusCode != 200) throw Exception("Error al cargar la informacion");

    final serieDetails = SerieDetails.fromJson(response.data);
    final Serie serie = SerieMapper.serieDetailsToEntity(serieDetails);

    return serie;
  }

} 