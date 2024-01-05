import 'package:go_router/go_router.dart';
import 'package:orm_album_future_builder/di/di_setup.dart';
import 'package:orm_album_future_builder/presentation/detail/detail_screen.dart';
import 'package:orm_album_future_builder/presentation/detail/detail_view_model.dart';
import 'package:orm_album_future_builder/presentation/detail/photo/photo_screen.dart';
import 'package:orm_album_future_builder/presentation/main/main_screen.dart';
import 'package:orm_album_future_builder/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (_, state) {
            final String id = state.uri.queryParameters['id']!;
            final String title = state.uri.queryParameters['title']!;
            return ChangeNotifierProvider(
              create: (context) => getIt<DetailViewModel>(),
              child: DetailScreen(id: id, title: title),
            );
          },
          routes: [
            GoRoute(
                path: 'photo',
                builder: (_, state) {
                  final String title = state.uri.queryParameters['title']!;
                  final String url = state.uri.queryParameters['url']!;
                  return PhotoScreen(title: title, url: url);
                })
          ],
        ),
      ],
    ),
  ],
);
