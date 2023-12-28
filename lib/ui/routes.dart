import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/ui/detail/detail_screen.dart';
import 'package:orm_album_future_builder/ui/main/main_screen.dart';

final routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => const MainScreen(),
        routes: [
          GoRoute(path: 'detail', builder: (_, __) => const DetailScreen())
        ],
      ),
    ]
);