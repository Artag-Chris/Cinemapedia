

import 'package:cinemapedia/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';
import '../../domain/entities/movie.dart';

class MovieMapper{

static Movie movieDBToEntity (MovieMovieDB movieDB)=>Movie(
  adult: movieDB.adult,
  overview: movieDB.overview,
  popularity: movieDB.popularity,
  voteCount: movieDB.voteCount,
  video: movieDB.video,
  originalLanguage: movieDB.originalLanguage,
  originalTitle: movieDB.originalTitle,
  genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
  id: movieDB.id,
  title: movieDB.title,
  posterPath: (movieDB.posterPath !="")
  ?"https://image.tmdb.org/t/p/w500${movieDB.posterPath}"
  :"https://th.bing.com/th/id/OIP.59acm7M8zfvbkDUNHr6KdQAAAA?w=208&h=249&c=7&r=0&o=5&dpr=1.3&pid=1.7",
  backdropPath:( movieDB.backdropPath !="")
  ?"https://image.tmdb.org/t/p/w500${movieDB.backdropPath}"
  :"https://th.bing.com/th/id/OIP.Sbq_JGR8ht94tFH1gnUYqgHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7",
  releaseDate: movieDB.releaseDate !=null
  ?movieDB.releaseDate!
  :DateTime.now(),
  voteAverage: movieDB.voteAverage
);

static Movie movieDetailsToEntity(MovieDetails movieDB)=>Movie(
  adult: movieDB.adult,
  overview: movieDB.overview,
  popularity: movieDB.popularity,
  voteCount: movieDB.voteCount,
  video: movieDB.video,
  originalLanguage: movieDB.originalLanguage,
  originalTitle: movieDB.originalTitle,
  genreIds: movieDB.genres.map((e) => e.name.toString()).toList(),
  id: movieDB.id,
  title: movieDB.title,
  posterPath: (movieDB.posterPath !="")
  ?"https://image.tmdb.org/t/p/w500${movieDB.posterPath}"
  :"no poster",
  backdropPath:( movieDB.backdropPath !="")
  ?"https://image.tmdb.org/t/p/w500${movieDB.backdropPath}"
  :"https://th.bing.com/th/id/OIP.Sbq_JGR8ht94tFH1gnUYqgHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7",
  releaseDate: movieDB.releaseDate,
  voteAverage: movieDB.voteAverage


);

}