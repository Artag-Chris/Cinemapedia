import 'package:cinemapedia/domain/entities/series.dart';

class SeriesMapper{


  static  Series seriesToEntity(series) => Series(
    id:series.id,
    name:series.name,
    overview:series.overview,
    posterPath:series.posterPath!=null
?"https://image.tmdb.org/t/p/w500${series.posterPath}"
  :"no poster",
   popularity: series.popularity,
    

  );
  }