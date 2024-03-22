import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters["id"] ?? "no-id";

            return MovieScreen(
              movieId: movieId,
            );
          },
        ),
      ]),
      //TODO la ruta de series cambiar direccion y nombre
         GoRoute(
          path: '/serie/:id',
          name: SerieScreen.name,
          builder: (context, state) {
            final serieId = state.pathParameters["id"] ?? "no-id";

            return SerieScreen(
              serieId: serieId,
            );
          },
        ),
]);

//todo la ruta de series