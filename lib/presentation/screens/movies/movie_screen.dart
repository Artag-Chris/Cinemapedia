import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {

final String movieId;

static const name = 'movie-screen';

  const MovieScreen({super.key, required this.movieId});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Película'),
      ),
      body: Text(widget.movieId),
    );
  }
}