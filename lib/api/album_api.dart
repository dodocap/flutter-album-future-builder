import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/dto/photo_dto.dart';

abstract interface class AlbumApi {
  Future<Result<List<AlbumDto>>> getAlbums();
  Future<Result<List<PhotoDto>>> getPhotos(String id);
}