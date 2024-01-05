import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';

abstract interface class AlbumRepository {
  Future<Result<List<Album>>> getAlbums();
  Future<Result<List<Photo>>> getPhotos(String id);
}