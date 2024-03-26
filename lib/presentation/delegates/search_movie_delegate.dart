

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_format.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMovieCallback =  Future<List<Movie>>Function(String query);
class SearchMovieDelegate extends SearchDelegate <Movie?>{

  final SearchMovieCallback searchMovie;


SearchMovieDelegate({
  required this.searchMovie
});

@override
String get searchFieldLabel => "Buscar Película";

  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
   
   if (query.isNotEmpty)
   FadeIn(
     child: IconButton(onPressed: ()=>query="",
      icon: const Icon(Icons.clear)),
   )

  ];

  }

  @override
  Widget? buildLeading(BuildContext context) {
return IconButton(onPressed: ()=>close(context, null), 
icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
  return   const Text("Build Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
 return     FutureBuilder(
  future: searchMovie(query), 
  builder: (context, snapshot) {
  
final movies = snapshot.data??[];

  
  return ListView.builder(
    itemCount: movies.length,
    itemBuilder: (context, index) {
      

      return _MovieItem(
        movies: movies[index],
        onMovieSelected: close,);
    }
  
   );
  });
  }}


  class _MovieItem extends StatelessWidget {

    final Movie movies;
final Function onMovieSelected;

    const _MovieItem({required this.movies, required this.onMovieSelected});
  
    @override
    Widget build(BuildContext context) {

      final textStyles = Theme.of(context).textTheme;
      final size = MediaQuery.of(context).size;

      return  GestureDetector(

        onTap: () => onMovieSelected(context,movies),

        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: [
      
      SizedBox(
        width: size.width * 0.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
        movies.posterPath,
         fit: BoxFit.cover,
         loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),),
        ),
      ),
      
      const SizedBox(width: 10,),
      
      SizedBox(
        width: (size.width - 40) * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      Text(movies.title, style: textStyles.titleLarge),
      (movies.overview.length > 120)
      ?Text("${movies.overview.substring(0, 120)}...")
      :Text(movies.overview),
      Row(
        children: [
          Icon(Icons.star, color: Colors.yellow.shade800),
          const SizedBox(width: 5),
      
          Text(HumanFormat.number(movies.voteAverage,1), style: textStyles.titleMedium!.copyWith(color: Colors.yellow.shade900)),
        ],
      )
      
          ],
        ),
      ),
      
        ]),),
      );
    }
  }