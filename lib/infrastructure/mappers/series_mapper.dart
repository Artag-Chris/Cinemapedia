import 'package:cinemapedia/domain/entities/series.dart';

class SeriesMapper{


  static  Series resultsToEntity(response) => Series(
    id:response.id,
    name:response.name,
    overview:response.overview,
    posterPath:response.poster_path!=null
?"https://image.tmdb.org/t/p/w500$response.posterPath"
  :"no poster",
    backdropPath:response['backdrop_path']!=null
    ?"https://image.tmdb.org/t/p/w500$response.backdropPath}"
  :"https://th.bing.com/th/id/OIP.Sbq_JGR8ht94tFH1gnUYqgHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7",
    popularity:response['popularity'],
  );
  }