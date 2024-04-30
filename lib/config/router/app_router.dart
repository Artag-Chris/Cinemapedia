import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [

//TODO la ruta de series cambiar direccion y nombre en StatefulShellRoute
//nuevo commit 


ShellRoute(
  builder:
      (BuildContext context, GoRouterState state, Widget child) {
    return Scaffold(
      body: child,
      /* ... */
      bottomNavigationBar: BottomNavigationBar(
      /* ... */
      ),
    );
  },
  routes: <RouteBase>[
    GoRoute(
      path: 'details',
      builder: (BuildContext context, GoRouterState state) {
        return const DetailsScreen();
      },
    ),
  ],
),






  /*
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen( childView: HomeView(),),
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
        ),*/
]
);

//todo la ruta de series