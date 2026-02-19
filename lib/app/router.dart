import 'package:go_router/go_router.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/movies/presentation/movie_list_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
    GoRoute(path: '/movie_list', builder: (context, state) => const MovieListPage()),
  ],
);
