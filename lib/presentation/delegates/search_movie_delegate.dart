

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate <Movie?>{


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
 return     const Text("Build suggestions");
  }



}