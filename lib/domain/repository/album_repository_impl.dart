import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/data/api/album_api.dart';
import 'package:orm_album_future_builder/data/dto/album_dto.dart';
import 'package:orm_album_future_builder/data/dto/photo_dto.dart';
import 'package:orm_album_future_builder/data/mapper/album_mapper.dart';
import 'package:orm_album_future_builder/data/mapper/photo_mapper.dart';
import 'package:orm_album_future_builder/data/repository/album_repository.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumApi _api;

  AlbumRepositoryImpl({required AlbumApi api}) : _api = api;

  @override
  Future<Result<List<Album>>> getAlbums() async {
    final Result<List<AlbumDto>> albumDtoResult = await _api.getAlbums();

    return albumDtoResult.when(
      success: (data) => Result.success(data.map((e) => e.mapper()).toList()),
      error: (e) => Result.error(e),
    );
  }

  @override
  Future<Result<List<Photo>>> getPhotos(String id) async {
    final Result<List<PhotoDto>> photoDtoResult = await _api.getPhotos(id);

    return photoDtoResult.when(
      success: (data) => Result.success(data.map((e) => e.mapper()).toList()),
      error: (e) => Result.error(e),
    );
  }
}
