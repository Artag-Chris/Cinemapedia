import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_format.dart';

import 'package:cinemapedia/domain/entities/series.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SeriesHorizontalListView extends StatefulWidget {
  final List<Series> series;
  final String? name;
  final String? overview;
  final VoidCallback? loadNextPage;

  const SeriesHorizontalListView({super.key, required this.series, this.name, this.overview, this.loadNextPage});



  @override
  State<SeriesHorizontalListView> createState() =>
      _SeriesHorizontalListViewState();
}

class _SeriesHorizontalListViewState extends State<SeriesHorizontalListView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(children: [
        if (widget.name != null || widget.overview != null)
          _Title(name: widget.name, overview: widget.overview),
        Expanded(
            child: ListView.builder(
          controller: scrollController,
          itemCount: widget.series.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return FadeInRight(child: _Slide(serie: widget.series[index]));
          },
        ))
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final Series serie;
  const _Slide({required this.serie});

  @override
  Widget build(BuildContext context) {
    //  final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                serie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator(
                      strokeWidth: 2,
                    );
                  }


                  return GestureDetector(
                    onTap: () => context.push("/serie/${serie.id}"),

                    child: FadeIn(child: child),
                  );
                  
                },
              ),
            )),
        //* Titulo
        const SizedBox(height: 5),
        SizedBox(
          width: 150,
          child: Text(serie.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyles.titleSmall),
        ),

        //* rating
         SizedBox(
          width: 150,
          child: Row(children: [
            Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
            const SizedBox(width: 5),
            Text(HumanFormat.number(serie.popularity,1),
                style: textStyles.bodyMedium
                    ?.copyWith(color: Colors.yellow.shade800)),
            const SizedBox(width: 10),
            const Spacer(),
            Text(HumanFormat.number(serie.popularity,1),
                style: textStyles.bodyMedium?.copyWith(color: Colors.black87))
          ]),
        )
      ]),
    );
  }
}

class _Title extends StatelessWidget {
  final String? name;
  final String? overview;

  const _Title({this.name, this.overview});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (name != null) Text(name!, style: titleStyle),
        const Spacer(),
        if (overview != null)
          FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(overview!)),
      ]),
    );
  }
}
