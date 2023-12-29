import 'dart:async';
import 'package:orm_album_future_builder/model/photo.dart';
import 'package:orm_album_future_builder/repository/album_repository.dart';
import 'package:orm_album_future_builder/repository/album_repository_impl.dart';

class DetailViewModel {
  final AlbumRepository _albumRepository = AlbumRepositoryImpl();

  List<Photo> _photoList = [];
  List<Photo> get photoList => List.unmodifiable(_photoList);

  final StreamController<bool> _isLoading = StreamController();
  Stream<bool> get isLoading => _isLoading.stream;

  Future<void> getPhotos(String id) async {
    _isLoading.add(true);

    _photoList = await _albumRepository.getPhotos(id);
    _photoList.removeWhere((element) => element.id == -1);

    _isLoading.add(false);
  }
}