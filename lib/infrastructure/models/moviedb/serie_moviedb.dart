import 'package:cinemapedia/domain/entities/serie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/serie_details.dart';

class SerieMovieDB {
  static Serie serieDBToEntity(SerieMovieDB serieMovieDB) => Serie(
        adult: serieMovieDB.adult,
        overview: serieMovieDB.overview,
        popularity: serieMovieDB.popularity,
        voteCount: serieMovieDB.voteCount,
        originalLanguage: serieMovieDB.originalLanguage,
        originalName: serieMovieDB.originalTitle,
        id: serieMovieDB.id,
        name: serieMovieDB.name,
        posterPath: (serieMovieDB.posterPath != "")
            ? "https://image.tmdb.org/t/p/w500${serieMovieDB.posterPath}"
            : "no poster",
        backdropPath: (serieMovieDB.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${serieMovieDB.backdropPath}"
            : "https://th.bing.com/th/id/OIP.Sbq_JGR8ht94tFH1gnUYqgHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7",
        firstAirDate: serieMovieDB.releaseDate,
        voteAverage: serieMovieDB.voteAverage,
        createdBy: serieMovieDB.createdBy.map((e) => e.toJson()).toList(),
        episodeRunTime:
            serieMovieDB.episodeRunTime.map((e) => e.toString()).toList(),
        genres: serieMovieDB.genreIds.map((e) => e.toString()).toList(),
        homepage: serieMovieDB.homepage,
        inProduction: serieMovieDB.inProduction,
        languages: serieMovieDB.languages.map((e) => e.toString()).toList(),
        lastAirDate: serieMovieDB.lastAirDate,
        lastEpisodeToAir: serieMovieDB.lastEpisodeToAir.toJson(),
        nextEpisodeToAir: serieMovieDB.nextEpisodeToAir,
         networks: serieMovieDB.networks.map((e) => e.toJson()).toList(), 
         numberOfEpisodes: serieMovieDB.numberOfEpisodes, 
         numberOfSeasons: serieMovieDB.numberOfSeasons, 
         originCountry: serieMovieDB.originCountry.map((e) => e.toString()).toList(), 
         productionCompanies: serieMovieDB.productionCompanies.map((e) => e.toJson()).toList(), 
         productionCountries: serieMovieDB.productionCountries.map((e) => e.toJson()).toList(), 
         seasons: serieMovieDB.seasons.map((e) => e.toJson()).toList(),
          spokenLanguages: serieMovieDB.spokenLanguages.map((e) => e.toJson()).toList(), 
          status: serieMovieDB.status, 
          tagline: serieMovieDB.tagline, 
          type: serieMovieDB.type,
         
      );

  static Serie serieDetailsToEntity(SerieDetails serieMovieDB) => Serie(
          adult: serieMovieDB.adult,
        overview: serieMovieDB.overview,
        popularity: serieMovieDB.popularity,
        voteCount: serieMovieDB.voteCount,
        originalLanguage: serieMovieDB.originalLanguage,
        originalName: serieMovieDB.originalName,
        id: serieMovieDB.id,
        name: serieMovieDB.name,
        posterPath: (serieMovieDB.posterPath != "")
            ? "https://image.tmdb.org/t/p/w500${serieMovieDB.posterPath}"
            : "no poster",
        backdropPath: (serieMovieDB.backdropPath != "")
            ? "https://image.tmdb.org/t/p/w500${serieMovieDB.backdropPath}"
            : "https://th.bing.com/th/id/OIP.Sbq_JGR8ht94tFH1gnUYqgHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7",
        firstAirDate: serieMovieDB.releaseDate,
        voteAverage: serieMovieDB.voteAverage,
        createdBy: serieMovieDB.createdBy.map((e) => e.toJson()).toList(),
        episodeRunTime:
            serieMovieDB.episodeRunTime.map((e) => e.toString()).toList(),
        genres: serieMovieDB.genreIds.map((e) => e.toString()).toList(),
        homepage: serieMovieDB.homepage,
        inProduction: serieMovieDB.inProduction,
        languages: serieMovieDB.languages.map((e) => e.toString()).toList(),
        lastAirDate: serieMovieDB.lastAirDate,
        lastEpisodeToAir: serieMovieDB.lastEpisodeToAir.toJson(),
        nextEpisodeToAir: serieMovieDB.nextEpisodeToAir,
         networks: serieMovieDB.networks.map((e) => e.toJson()).toList(), 
         numberOfEpisodes: serieMovieDB.numberOfEpisodes, 
         numberOfSeasons: serieMovieDB.numberOfSeasons, 
         originCountry: serieMovieDB.originCountry.map((e) => e.toString()).toList(), 
         productionCompanies: serieMovieDB.productionCompanies.map((e) => e.toJson()).toList(), 
         productionCountries: serieMovieDB.productionCountries.map((e) => e.toJson()).toList(), 
         seasons: serieMovieDB.seasons.map((e) => e.toJson()).toList(),
          spokenLanguages: serieMovieDB.spokenLanguages.map((e) => e.toJson()).toList(), 
          status: serieMovieDB.status, 
          tagline: serieMovieDB.tagline, 
          type: serieMovieDB.type
      );
}
