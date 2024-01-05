import 'package:get_it/get_it.dart';
import 'package:orm_album_future_builder/data/api/album_api.dart';
import 'package:orm_album_future_builder/data/api/json_placeholder_album_api_impl.dart';
import 'package:orm_album_future_builder/data/repository/album_repository.dart';
import 'package:orm_album_future_builder/domain/repository/album_repository_impl.dart';
import 'package:orm_album_future_builder/domain/use_case/get_album_use_case.dart';
import 'package:orm_album_future_builder/domain/use_case/get_photo_by_id_use_case.dart';
import 'package:orm_album_future_builder/presentation/detail/detail_view_model.dart';
import 'package:orm_album_future_builder/presentation/main/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<AlbumApi>(JsonPlaceholderAlbumApiImpl());

  getIt.registerSingleton<AlbumRepository>(AlbumRepositoryImpl(api: getIt<AlbumApi>()));

  getIt.registerSingleton<GetAlbumUseCase>(GetAlbumUseCase(albumRepository: getIt<AlbumRepository>()));
  getIt.registerSingleton<GetPhotoByIdUseCase>(GetPhotoByIdUseCase(albumRepository: getIt<AlbumRepository>()));

  getIt.registerFactory<MainViewModel>(() => MainViewModel(getAlbumUseCase: getIt<GetAlbumUseCase>()));

  getIt.registerFactory<DetailViewModel>(() => DetailViewModel(getPhotoByIdUseCase: getIt<GetPhotoByIdUseCase>()));
}