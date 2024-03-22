import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/serie.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SerieScreen extends ConsumerStatefulWidget {
  final String serieId;

  static const name = 'serie-screen';

  const SerieScreen({super.key, required this.serieId});

  @override
  SerieScreenState createState() => SerieScreenState();
}

class SerieScreenState extends ConsumerState<SerieScreen> {
  //Aqui se carga los providers
  @override
  void initState() {
    super.initState();
    //todo adecuar providers
    ref.read(movieInfoProvider.notifier).loadMovie(widget.serieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.serieId);
  }

  @override
  Widget build(BuildContext context) {
    //todo: crear entidad serie
    final Serie? serie = ref.watch(movieInfoProvider)[widget.serieId];

    if (serie == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
        body: CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        _CustomSliverAppBar(serie: serie),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => _SerieDetails(serie: serie),
              childCount: 1),
        )
      ],
    ));
  }
}

class _SerieDetails extends StatelessWidget {
  final Serie serie;
  const _SerieDetails({required this.serie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  serie.posterPath,
                  width: size.width * 0.3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              //description
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(serie.name, style: textStyle.titleLarge),
                    Text(
                      serie.overview,
                    ),
                  ],
                ),
              )
            ],
          )),
      Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(children: [
            ...serie.genreIds.map((gender) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(gender),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ))
          ])),
      
      const SizedBox(
        height: 10,
      ),
      _ActorsBySerie(serieId: serie.id.toString()),
      const SizedBox(
        height: 50,
      )
    ]);
  }
}

class _ActorsBySerie extends ConsumerWidget {
  final String serieId;
  const _ActorsBySerie({required this.serieId});

  @override
  Widget build(BuildContext context, ref) {
    final actorsBySerie = ref.watch(actorsByMovieProvider);
    if (actorsBySerie[serieId] == null) {
      return const CircularProgressIndicator(
        strokeWidth: 2,
      );
    }
    final actors = actorsBySerie[serieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];
          return Container(
              padding: const EdgeInsets.all(8),
              width: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      actor.profilePath,
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              Text(
                  actor.name,
                  maxLines: 2,
                ),
                Text(
                  actor.character ?? "",
                  maxLines: 2,
                  style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                ),
              ]));
        },
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Serie serie;
  const _CustomSliverAppBar({required this.serie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              serie.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          background: Stack(children: [
            SizedBox.expand(
                child: Image.network(serie.backdropPath,
                 fit: BoxFit.cover, 
                 loadingBuilder: (context,child,loadingProgress){
                  if(loadingProgress != null) return const SizedBox();
                    return FadeIn(child: child);
                  
                 },
                 )),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.7, 1.0],
                          colors: [Colors.transparent, Colors.black87]))),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, stops: [
                0.0,
                0.3
              ], colors: [
                Colors.black87,
                Colors.transparent,
              ]))),
            ),
          ])),
    );
  }
}
