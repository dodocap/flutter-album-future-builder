import 'package:orm_album_future_builder/dto/album_dto.dart';
import 'package:orm_album_future_builder/dto/photo_dto.dart';

abstract interface class AlbumApi {
  Future<List<AlbumDto>> getAlbums();
  Future<List<PhotoDto>> getPhotos(String id);
}