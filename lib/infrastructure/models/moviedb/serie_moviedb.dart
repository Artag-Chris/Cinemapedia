

class SerieMovieDB {
   final bool adult;
    final String backdropPath;
    final List<dynamic> createdBy;
    final List<int> episodeRunTime;
    final DateTime firstAirDate;
    final List<dynamic> genres;
    final String homepage;
    final int id;
    final bool inProduction;
    final List<String> languages;
    final DateTime lastAirDate;
    final List<dynamic> lastEpisodeToAir;
    final String name;
    final dynamic nextEpisodeToAir;
    final List<dynamic> networks;
    final int numberOfEpisodes;
    final int numberOfSeasons;
    final List<String> originCountry;
    final String originalLanguage;
    final String originalName;
    final String overview;
    final double popularity;
    final String posterPath;
    final List<dynamic> productionCompanies;
    final List<dynamic> productionCountries;
    final List<dynamic> seasons;
    final List<dynamic> spokenLanguages;
    final String status;
    final String tagline;
    final String type;
    final double voteAverage;
    final int voteCount;

    SerieMovieDB({
        required this.adult,
        required this.backdropPath,
        required this.createdBy,
        required this.episodeRunTime,
        required this.firstAirDate,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.inProduction,
        required this.languages,
        required this.lastAirDate,
        required this.lastEpisodeToAir,
        required this.name,
        required this.nextEpisodeToAir,
        required this.networks,
        required this.numberOfEpisodes,
        required this.numberOfSeasons,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.seasons,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.type,
        required this.voteAverage,
        required this.voteCount,
    });

    factory SerieMovieDB.fromJson(Map<String, dynamic> json) => SerieMovieDB(
        adult: json["adult"]??false,
        backdropPath: json["backdrop_path"]??"",
        createdBy: json["created_by"].map((x) => x),
        episodeRunTime: List<int>.from(json["episode_run_time"].map((x) => x)),
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genres: (json["genres"].map((x) => (x))),
        homepage: json["homepage"],
        id: json["id"],
        inProduction: json["in_production"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        lastAirDate: DateTime.parse(json["last_air_date"]),
        lastEpisodeToAir:json["last_episode_to_air"],
        name: json["name"],
        nextEpisodeToAir: json["next_episode_to_air"],
        networks: json["networks"].map((x) => x),
        numberOfEpisodes: json["number_of_episodes"],
        numberOfSeasons: json["number_of_seasons"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"].map((x) => x),
        productionCountries: json["production_countries"].map((x) => x),
        seasons:json["seasons"].map((x) => x),
        spokenLanguages: json["spoken_languages"].map((x) =>(x)),
        status: json["status"],
        tagline: json["tagline"],
        type: json["type"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        
    );


    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "created_by": List<dynamic>.from(createdBy.map((x) => x.toJson())),
        "episode_run_time": List<dynamic>.from(episodeRunTime.map((x) => x)),
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "in_production": inProduction,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "last_air_date": "${lastAirDate.year.toString().padLeft(4, '0')}-${lastAirDate.month.toString().padLeft(2, '0')}-${lastAirDate.day.toString().padLeft(2, '0')}",
        
        "name": name,
        "next_episode_to_air": nextEpisodeToAir,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "number_of_episodes": numberOfEpisodes,
        "number_of_seasons": numberOfSeasons,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "type": type,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
