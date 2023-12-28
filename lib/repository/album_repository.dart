import 'package:orm_album_future_builder/model/album.dart';
import 'package:orm_album_future_builder/model/photo.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Photo>> getPhotos();
}