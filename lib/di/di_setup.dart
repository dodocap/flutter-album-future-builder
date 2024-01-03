import 'package:get_it/get_it.dart';
import 'package:orm_album_future_builder/api/album_api.dart';
import 'package:orm_album_future_builder/api/json_placeholder_album_api_impl.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';
import 'package:orm_album_future_builder/ui/detail/detail_view_model.dart';
import 'package:orm_album_future_builder/ui/main/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<AlbumApi>(JsonPlaceholderAlbumApiImpl());

  getIt.registerSingleton<AlbumRepository>(AlbumRepositoryImpl(api: getIt<AlbumApi>()));

  getIt.registerFactory<MainViewModel>(() => MainViewModel(albumRepository: getIt<AlbumRepository>()));

  getIt.registerFactory<DetailViewModel>(() => DetailViewModel(albumRepository: getIt<AlbumRepository>()));
}