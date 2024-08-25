import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kuncie_flutter_test/presentation/feature/movielist/movie_list_screen.dart';

class AppRouter {
  static final provider = Provider((ref) => AppRouter());

  static const movieListRoute = 'movie-list';

  late final router = GoRouter(
    initialLocation: '/$movieListRoute',
    routes: [
      GoRoute(
        name: movieListRoute,
        path: '/$movieListRoute',
        builder: (context, state) {
          return const MovieListScreen();
        },
      ),
    ],
  );
}
