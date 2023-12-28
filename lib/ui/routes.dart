import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/ui/detail/detail_screen.dart';
import 'package:orm_album_future_builder/ui/main/main_screen.dart';

final routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => MainScreen(),
        routes: [
          GoRoute(path: 'detail', builder: (_, state) {
            final int id = int.parse(state.uri.queryParameters['id']!);
            final String title = state.uri.queryParameters['title']!;
            return DetailScreen(id: id, title: title);
          })
        ],
      ),
    ]
);