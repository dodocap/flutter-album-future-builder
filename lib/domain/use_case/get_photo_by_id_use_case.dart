import 'package:orm_album_future_builder/core/result.dart';
import 'package:orm_album_future_builder/data/repository/album_repository.dart';
import 'package:orm_album_future_builder/domain/model/photo.dart';

class GetPhotoByIdUseCase {
  final AlbumRepository _albumRepository;

  GetPhotoByIdUseCase({required AlbumRepository albumRepository}) : _albumRepository = albumRepository;

  Future<Result<List<Photo>>> execute(String id) async {
    final Result<List<Photo>> result = await _albumRepository.getPhotos(id);

    if (result is Success<List<Photo>>) {
      result.data.removeWhere((element) => element.id == -1);
    }

    return result;
  }
}