
import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource{

final dio=Dio(BaseOptions(
  baseUrl:"https://api.themoviedb.org/3",
  queryParameters: {
    "api_key":Environment.theMovieDbKey,
    "language":"es-MX"
  }
));





   Future<List<Movie>> getNowPlaying({int page =1})async{

final resonse = await dio.get("/movie/now_playing");
final List<Movie> movies=[];


    return movies;
   }

}