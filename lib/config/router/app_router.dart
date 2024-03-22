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
          path: 'serie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters["id"] ?? "no-id";

            return MovieScreen(
              movieId: movieId,
            );
          },
        ),
]);

//todo la ruta de series