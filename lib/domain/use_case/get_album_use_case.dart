import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/data/repository/album_repository.dart';
import 'package:orm_album_future_builder/domain/model/album.dart';

class GetAlbumUseCase {
  final AlbumRepository _albumRepository;

  GetAlbumUseCase({required AlbumRepository albumRepository}) : _albumRepository = albumRepository;

  Future<Result<List<Album>>> execute() async {
    Result<List<Album>> result = await _albumRepository.getAlbums();

    if (result is Success<List<Album>>) {
      result.data.removeWhere((album) => album.id == -1);
    }

    return result;
  }
}