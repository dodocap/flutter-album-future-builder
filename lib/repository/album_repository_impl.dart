import 'package:orm_album_future_builder/api/album_api.dart';
import 'package:orm_album_future_builder/api/json_placeholder_album_api_impl.dart';
import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/dto/photo_dto.dart';
import 'package:orm_album_future_builder/mapper/album_mapper.dart';
import 'package:orm_album_future_builder/mapper/photo_mapper.dart';
import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApi _api = JsonPlaceholderAlbumApiImpl();

  @override
  Future<List<Album>> getAlbums() async {
    final List<AlbumDto> albumDto = await _api.getAlbums();

    return albumDto.map((e) => e.mapper()).toList();
  }

  @override
  Future<List<Photo>> getPhotos() async {
    final List<PhotoDto> photoDto = await _api.getPhotos();

    return photoDto.map((e) => e.mapper()).toList();
  }
}
